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
git clone --branch 2012.0.0 --depth 1 https://github.com/Azure/caf-terraform-landingzones.git /tf/caf/public

# Add the lower dependency CAF modules
git clone --depth 1 https://github.com/xpillons/terraform-azurerm-caf.git /tf/caf/aztfmod

