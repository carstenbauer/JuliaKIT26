#!/bin/bash
#SBATCH --job-name=diff2dthreads_bench
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --time=00:10:00
#SBATCH --output=job_bench_threads.out
#SBATCH --partition=cpu_il

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
fi

for i in 512 2048 6144 16384
do
    echo -e "\n\n#### Run $i"

    julia --project --threads 16 bench_threads.jl $i # benchmark multithreaded variants
done
