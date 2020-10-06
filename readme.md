# landingzone_hpc

### 1. Rover login, Environment & example set
Ensure the below is set prior to apply or destroy.
```bash
# Login the Azure subscription
rover login -t [TENANT_ID/TENANT_NAME] -s [SUBSCRIPTION_GUID]
```

### 2. Apply Landingzones
```bash
# Add the lower dependency landingzones
git clone --branch 0.4 https://github.com/Azure/caf-terraform-landingzones.git /tf/caf/public

# Review and update the launchpad region in /tf/caf/configuration/launchpad.tfvars

# Deploy the launchpad light to store the tfstates
rover -lz /tf/caf/public/landingzones/caf_launchpad -launchpad -var-file /tf/caf/configuration/launchpad.tfvars -a apply

# Deploy the caf_foundations
rover -lz /tf/caf/public/landingzones/caf_foundations -a apply

# Deploy HPC networking
rover -lz /tf/caf/public/landingzones/caf_networking/ -var-file /tf/caf/configuration/networking.tfvars -a apply

# Deploy the HPC Headnode
rover -lz /tf/caf -var-file /tf/caf/configuration/headnode.tfvars -a apply
```

### 3 - Destroy

```bash
rover -lz /tf/caf -var-file /tf/caf/configuration/headnode.tfvars -a destroy -auto-approve
rover -lz /tf/caf/public/landingzones/caf_networking/ -var-file /tf/caf/configuration/networking.tfvars -a destroy -auto-approve
rover -lz /tf/caf/public/landingzones/caf_foundations -a destroy -auto-approve
rover -lz /tf/caf/public/landingzones/caf_launchpad -launchpad -var-file /tf/caf/configuration/launchpad.tfvars -a destroy -auto-approve

```