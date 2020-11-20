# Cloud Adoption Framework landing zones for HPC - Simple HPC PBS template
Example Goal:
  - Build a single VNET with subnets admin, netapp, storage, viz and compute. No NSG applied on subnets, no diagnostics, no peerings, no private end points
  - Build a single Linux VM used as a Headnode in the admin subnet, with a public IP and NGS with port 22 open.
  - Build a VMSS without any public IP, no load balancer in the compute subnet
  - no backup scenarios, no diagnostics, very simple deployment
  - try to use a 2 level approach, Level0 for the launchpad, and everything else in Level1. Maybe a 3 level approach could be design in order to separate the networking infrastructure

This first example is actually implemented from level0 to level3 => how to update it into a 2 or 3 level approach ?
The level4 directory contains the headnode definition. Here are the questions that need to be addressed :
  - How to configure the root of this repo so it can contains modules for HPC, like HeadNode, VMSS definitions and more ?
  - How to organize repos if multiple repos need to be used ?
  - What is the rover command line to used to deploy the headnode ?
  - How to provide variables to the headnode ?
  - How to create a headnode module ?
  - How to reuse existing networking infrastructure ?

## SIMPLE_HPC_PBS ENVIRONMENT

Assumptions:

- Demo environment does not have diagnostics enabled.
- Demo environment does not have RBAC model

## Deploying SIMPLE_HPC_PBS environment

After completing the steps from the general [configuration readme](../README.md), you can start using the demo deployment:

You can then specify the environment you are running:
```bash
export environment=simple_hpc_pbs
```

### 1. Launchpad-level0 landing zones

#### Deploy the launchpad

```bash
rover -lz /tf/caf/public/landingzones/caf_launchpad \
  -var-folder /tf/caf/configuration/${environment}/level0 \
  -parallelism 30 \
  -level level0 \
  -env ${environment} \
  -launchpad \
  -a [plan|apply|destroy]
```

### 2. Level 1 landing zones

#### Deploy foundations

```bash
rover -lz /tf/caf/public/landingzones/caf_foundations/ \
  -var-folder /tf/caf/configuration/${environment}/level1 \
  -parallelism 30 \
  -level level1 \
  -env ${environment} \
  -a [plan|apply|destroy]
```

### 3. Level 2 landing zones

#### Deploy the shared services

```bash
rover -lz /tf/caf/public/landingzones/caf_shared_services/ \
  -tfstate caf_shared_services.tfstate \
  -var-folder /tf/caf/configuration/${environment}/level2/shared_services \
  -parallelism 30 \
  -level level2 \
  -env ${environment} \
  -a [plan|apply|destroy]
```

### 4. Level 3 landing zones - Shared infrastructure platforms

#### Deploy the networking

```bash
rover -lz /tf/caf/public/landingzones/caf_networking/ \
  -tfstate networking.tfstate \
  -var-folder /tf/caf/configuration/${environment}/level3/networking \
  -parallelism 30 \
  -level level3 \
  -env ${environment} \
  -a [plan|apply|destroy]
```

### 5. Level 4 - Application infrastructure components - Headnode

```bash
rover -lz /tf/caf/ \
  -tfstate lz_hpc.tfstate \
  -var-folder /tf/caf/configuration/${environment}/level4 \
  -parallelism 30 \
  -level level4 \
  -env ${environment} \
  -a [plan|apply|destroy]
```

```bash
rover -lz /tf/caf/ -level level4 -var-folder /tf/caf/examples/100-simple-headnode -a apply
```
