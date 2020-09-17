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
git clone git@github.com:aztfmod/terraform-azurerm-caf-enterprise-scale.git /tf/caf/public

# Deploy the launchpad light to store the tfstates
rover -lz /tf/caf/public/landingzones/caf_launchpad -launchpad -var-file /tf/caf/configuration/launchpad_configuration.tfvars -a apply
## To deploy HPC some dependencies are required to like networking and some acounting, security and governance services are required.
rover -lz /tf/caf/public/landingzones/caf_foundations -a apply

# Deploy networking
rover -lz /tf/caf/public/landingzones/caf_networking/ \
      -tfstate ${example}_landingzone_networking.tfstate \
      -var-file /tf/caf/examples/aks/${example}/landingzone_networking.tfvars \
      -var tags={example=\"${example}\"} \
      -a apply

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