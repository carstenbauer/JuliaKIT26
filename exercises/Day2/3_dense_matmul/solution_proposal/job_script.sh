#!/bin/bash
#SBATCH --job-name=dense_matmul
#SBATCH --nodes=1
#SBATCH --mem=5G
#SBATCH --cpus-per-task=1
#SBATCH --time=00:45:00
#SBATCH --output=job_script.out
#SBATCH --partition=cpu_il

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
fi

# run program
julia --project dense_matmul_solution.jl 2048
