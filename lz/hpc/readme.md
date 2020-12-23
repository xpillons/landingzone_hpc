# HPC Landing Zone preview

### 1. Rover login, Environment & example set
Ensure the below is set prior to apply or destroy.
```bash
# Login the Azure subscription
rover login -t [TENANT_ID/TENANT_NAME] -s [SUBSCRIPTION_GUID]
```

### 2. Apply Landingzones sandpit environment
```bash
# Add the lower dependency landingzones
git clone --branch 2012.1.0 --depth 1 https://github.com/Azure/caf-terraform-landingzones.git /tf/caf/public

```

### 3. Deploy the launchpad

```bash
rover -lz /tf/caf/public/landingzones/caf_launchpad \
-launchpad \
-parallelism 30 \
-var-folder /tf/caf/lz/hpc/configuration/launchpad \
-a apply
```

### 4. Deploy the HPC Landing Zone

```bash

rover -lz /tf/caf/lz/hpc/ \
  -var-folder /tf/caf/lz/hpc/configuration/deployhpc \
  -parallelism 30 \
  -a plan

```