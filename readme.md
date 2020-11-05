# landingzone_hpc preview

### 1. Rover login, Environment & example set
Ensure the below is set prior to apply or destroy.
```bash
# Login the Azure subscription
rover login -t [TENANT_ID/TENANT_NAME] -s [SUBSCRIPTION_GUID]
```

### 2. Apply Landingzones sandpit environment
```bash
# Add the lower dependency landingzones
git clone --branch 2010.0.preview2 https://github.com/Azure/caf-terraform-landingzones.git /tf/caf/public

export environment=demo

# Level 0 - Deploy the launchpad to store the tfstates
rover -lz /tf/caf/public/landingzones/caf_launchpad \
  -var-folder /tf/caf/configuration/${environment}/level0 \
  -parallelism 30 \
  -level level0 \
  -env ${environment} \
  -launchpad \
  -a apply

# Level 1 - Deploy the foundations
rover -lz /tf/caf/public/landingzones/caf_foundations/ \
  -var-folder /tf/caf/configuration/${environment}/level1 \
  -parallelism 30 \
  -level level1 \
  -env ${environment} \
  -a apply

# Level 2 - Deploy the shared services

rover -lz /tf/caf/public/landingzones/caf_shared_services/ \
  -tfstate caf_shared_services.tfstate \
  -var-folder /tf/caf/configuration/${environment}/level2/shared_services \
  -parallelism 30 \
  -level level2 \
  -env ${environment} \
  -a apply

# Level 2 - Deploy the networking hub 

rover -lz /tf/caf/public/landingzones/caf_networking/ \
  -tfstate networking_hub.tfstate \
  -var-folder /tf/caf/configuration/${environment}/level2/networking/hub \
  -parallelism 30 \
  -level level2 \
  -env ${environment} \
  -a apply

# Level 3 - Deploy the networking spoke 

rover -lz /tf/caf/public/landingzones/caf_networking/ \
  -tfstate networking_spoke.tfstate \
  -var-folder /tf/caf/configuration/${environment}/level3/networking/spoke \
  -parallelism 30 \
  -level level3 \
  -env ${environment} \
  -a apply
```

### 3. Apply an example landing zone

# Deploy the HPC configuration (networking spoke, HPC headnode, etc.)
```bash
rover -lz /tf/caf/ -level level3 -var-folder /tf/caf/examples/100-simple-headnode -a apply
```

### 3 - Destroy

```bash
rover -lz /tf/caf/public/landingzones/caf_networking/ \
  -tfstate networking_spoke.tfstate \
  -var-folder /tf/caf/configuration/${environment}/level3/networking/spoke \
  -parallelism 30 \
  -level level3 \
  -env ${environment} \
  -a destroy -auto-approve

rover -lz /tf/caf/public/landingzones/caf_networking/ \
  -tfstate networking_hub.tfstate \
  -var-folder /tf/caf/configuration/${environment}/level2/networking/hub \
  -parallelism 30 \
  -level level2 \
  -env ${environment} \
  -a destroy -auto-approve

rover -lz /tf/caf/public/landingzones/caf_shared_services/ \
  -tfstate caf_shared_services.tfstate \
  -var-folder /tf/caf/configuration/${environment}/level2/shared_services \
  -parallelism 30 \
  -level level2 \
  -env ${environment} \
  -a destroy -auto-approve

rover -lz /tf/caf/public/landingzones/caf_foundations/ \
  -var-folder /tf/caf/configuration/${environment}/level1 \
  -parallelism 30 \
  -level level1 \
  -env ${environment} \
  -a destroy -auto-approve

rover -lz /tf/caf/public/landingzones/caf_launchpad \
  -var-folder /tf/caf/configuration/${environment}/level0 \
  -parallelism 30 \
  -level level0 \
  -env ${environment} \
  -launchpad \
  -a destroy -auto-approve

```