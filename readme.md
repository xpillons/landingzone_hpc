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
git clone --branch vnext https://github.com/Azure/caf-terraform-landingzones.git /tf/caf/public

# Review and update the launchpad region in /tf/caf/configuration/launchpad.tfvars

# Deploy the launchpad light to store the tfstates
rover -lz /tf/caf/public/landingzones/caf_launchpad -launchpad -var-file /tf/caf/configuration/launchpad.tfvars -a apply

# Deploy the caf_foundations
rover -lz /tf/caf/public/landingzones/caf_foundations -a apply

# Deploy HPC networking
rover -lz /tf/caf/public/landingzones/caf_networking/ -var-file /tf/caf/configuration/networking.tfvars -a apply


# Deploy HPC Headnode
rover -lz /tf/caf/public -var-file /tf/caf/configuration/headnode.tfvars -a apply


# Run HPC landing zone deployment

rover -lz /tf/caf/ \
      -tfstate ${example}_landingzone_aks.tfstate \
      -var-file /tf/caf/examples/aks/${example}/configuration.tfvars \
      -var tags={example=\"${example}\"} \
      -a apply    


rover -lz /tf/caf/apps \
      -tfstate ${example}_dapr.tfstate \
      -var-file /tf/caf/examples/apps/dapr/configuration.tfvars \
      -var tags={example=\"${example}\"} \
      -a apply     
```