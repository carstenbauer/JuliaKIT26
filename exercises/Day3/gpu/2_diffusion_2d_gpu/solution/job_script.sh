#!/bin/bash
#SBATCH --job-name=diff2dgpu
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --gres=gpu:1
#SBATCH --time=00:10:00
#SBATCH --output=job_script.out
#SBATCH --partition=gpu_a100_short

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
    export JULIAKIT26_DEPOT_PATH="/pfs/work9/workspace/scratch/ka_rx8865-juliakit26/.juliakit26"
    export JULIA_DEPOT_PATH="$TMPDIR/.julia_$USER:$JULIAKIT26_DEPOT_PATH"
fi

for i in 1024 2048 4096 8192 16384
do
    echo -e "\n\n#### GPU run ns=$i"

    julia --project diffusion_2d_gpu.jl $i
done
