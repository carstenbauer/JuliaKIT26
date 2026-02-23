#!/bin/bash
#SBATCH --job-name=saxpy_gpu
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --gres=gpu:1
#SBATCH --time=00:10:00
#SBATCH --output=job_script.out
#SBATCH --partition=gpu_a100_short

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
fi

# run program
julia --project saxpy_gpu_solution.jl
