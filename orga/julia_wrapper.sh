#!/bin/bash

# Making module / ml available
# ------------------------------------------------------------
export MODULEPATH=/opt/bwhpc/ka/modulefiles:/opt/bwhpc/common/modulefiles
source /usr/share/lmod/lmod/init/profile
export MODULEPATH="/pfs/work9/workspace/scratch/ka_rx8865-juliakit26/modules:$MODULEPATH"
# ------------------------------------------------------------

# Load julia (+ cuda + openmpi)
module load juliahpc/1.12.5

# if possible, put the writable julia depot on a local SSD ($TMPDIR)
if [[ -n "$TMPDIR" && -n "$USER" ]]; then
    export JULIA_DEPOT_PATH="$TMPDIR/.julia_$USER:$JULIAKIT26_DEPOT_PATH"
else
    export JULIA_DEPOT_PATH="$HOME/.julia:$JULIAKIT26_DEPOT_PATH"
fi

# Pass on all arguments to julia
exec julia "${@}"
