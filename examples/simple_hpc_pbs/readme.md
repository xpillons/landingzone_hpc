```bash
# Set the environment
export environment=simple_hpc_pbs

# Create the launchpad

rover -lz /tf/caf/public/landingzones/caf_launchpad \
  -parallelism 30 \
  -level level0 \
  -env ${environment} \
  -launchpad \
  -var-folder /tf/caf/examples/launchpad \
  -a apply

# Build the environment

rover -lz /tf/caf/examples/ \
  -var-folder /tf/caf/examples/${environment} \
  -parallelism 30 \
  -level level0 \
  -env ${environment} \
  -a plan

```
