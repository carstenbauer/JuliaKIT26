#!/bin/bash
#SBATCH --job-name=daxpy_cpu
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --time=00:10:00
#SBATCH --output=job_script.out
#SBATCH --partition=gpu_a100_short
#SBATCH --gres=gpu:4
##SBATCH --qos=workshop
##SBATCH --reservation=ws_julia

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
    export JULIAKIT26_DEPOT_PATH="/pfs/work9/workspace/scratch/ka_rx8865-juliakit26/.juliakit26"
    export JULIA_DEPOT_PATH="$TMPDIR/.julia_$USER:$JULIAKIT26_DEPOT_PATH"
fi

# run program
julia --project -t 12 daxpy_cpu.jl
