#!/bin/bash
#SBATCH --job-name=daxpy_scaling
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --time=00:40:00
#SBATCH --output=job_script.out
#SBATCH --partition=cpu_il

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
fi

# run program
julia --project -t 64 daxpy_cpu_scaling.jl
