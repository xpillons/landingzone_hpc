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
git clone --branch 0.4 https://github.com/Azure/caf-terraform-landingzones.git /tf/caf/public

# Review and update the launchpad region in /tf/caf/configuration/launchpad.tfvars

# Deploy the launchpad light to store the tfstates
rover -lz /tf/caf/public/landingzones/caf_launchpad/ -launchpad -level level0 -var-folder /tf/caf/public/landingzones/caf_launchpad/scenario/100/ -a apply

# Deploy the caf_foundations
rover -lz /tf/caf/public/landingzones/caf_foundations -level level1 -a apply

# Deploy the caf_hub
rover -lz /tf/caf/public/landingzones/caf_networking/ -level level2 -var-folder /tf/caf/public/landingzones/caf_networking/scenario/100-single-region-hub -a apply

# Deploy the caf_shared_services
rover -lz /tf/caf/public/landingzones/caf_shared_services/ -level level2 -a apply
```

### 3. Apply an example landing zone

# Deploy the HPC configuration (networking spoke, HPC headnode, etc.)
```bash
rover -lz /tf/caf/ -level level3 -var-folder /tf/caf/examples/100-simple-headnode -a apply
```

### 3 - Destroy

```bash
rover -lz /tf/caf/ -level level3 -var-folder /tf/caf/examples/100-simple-headnode -a destroy -auto-approve
rover -lz /tf/caf/public/landingzones/caf_shared_services/ -level level2 -a destroy -auto-approve
rover -lz /tf/caf/public/landingzones/caf_networking/ -level level2 -var-file /tf/caf/public/landingzones/caf_networking/scenario/100-single-region-hub/configuration.tfvars -a destroy -auto-approve
rover -lz /tf/caf/public/landingzones/caf_foundations -level level1 -a destroy -auto-approve 
rover -lz /tf/caf/public/landingzones/caf_launchpad/ -level level0 -launchpad -var-folder /tf/caf/public/landingzones/caf_launchpad/scenario/100/ -a destroy -auto-approve

```