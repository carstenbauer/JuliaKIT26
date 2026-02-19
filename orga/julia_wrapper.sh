#!/bin/bash

# Making module / ml available
# ------------------------------------------------------------
export MODULEPATH=/opt/bwhpc/ka/modulefiles:/opt/bwhpc/common/modulefiles
# source /etc/profile.d/modules.sh
source /usr/share/lmod/lmod/init/profile
export MODULEPATH="/pfs/work9/workspace/scratch/ka_rx8865-juliakit26/modules:$MODULEPATH"
# ------------------------------------------------------------

# Load julia
module load juliahpc/1.12.5

# Pass on all arguments to julia
exec julia "${@}"
