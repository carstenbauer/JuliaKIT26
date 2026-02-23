#!/bin/bash
#SBATCH --job-name=diff2dthreads
#SBATCH --nodes=1
#SBATCH --mem=5G
#SBATCH --cpus-per-task=10
#SBATCH --threads-per-core=1
#SBATCH --time=00:10:00
#SBATCH --output=job_script.out
#SBATCH --partition=cpu_il

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
    export JULIAKIT26_DEPOT_PATH="/pfs/work9/workspace/scratch/ka_rx8865-juliakit26/.juliakit26"
    export JULIA_DEPOT_PATH="$TMPDIR/.julia_$USER:$JULIAKIT26_DEPOT_PATH"
fi

for i in 256 512 1028
do
    echo -e "\n\n#### Run ns=$i"

    echo -e "-- single threaded"
    julia --project --threads 1 diffusion_2d_threads.jl $i
    echo -e ""

    echo -e "-- multithreaded (10 threads), dynamic scheduling"
    julia --project --threads 10 diffusion_2d_threads.jl $i
    echo -e ""

    echo -e "-- multithreaded (10 threads), static scheduling"
    julia --project --threads 10 diffusion_2d_threads.jl $i static
    echo -e ""
done
