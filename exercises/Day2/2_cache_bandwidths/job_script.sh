#!/bin/bash
#SBATCH --job-name=cache_bandwidths
#SBATCH --nodes=1
#SBATCH --mem=5G
#SBATCH --cpus-per-task=1
#SBATCH --time=00:30:00
#SBATCH --output=job_script.out
#SBATCH --partition=cpu_il

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
fi

# run program
julia --project cache_bandwidths_solution.jl
# julia --project cache_bandwidths_strided_solution.jl