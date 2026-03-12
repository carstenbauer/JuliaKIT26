#!/bin/bash
#SBATCH --job-name=diff2dmpi_bench
#SBATCH --nodes=1
#SBATCH --ntasks=40
#SBATCH --threads-per-core=1
#SBATCH --time=00:10:00
#SBATCH --output=job_script_bench.out
#SBATCH --partition=gpu_a100_short
#SBATCH --gres=gpu:4
##SBATCH --qos=workshop
##SBATCH --reservation=ws_julia
#SBATCH --exclusive

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
    export JULIAKIT26_DEPOT_PATH="/pfs/work9/workspace/scratch/ka_rx8865-juliakit26/.juliakit26"
    export JULIA_DEPOT_PATH="$TMPDIR/.julia_$USER:$JULIAKIT26_DEPOT_PATH"
fi

# run MPI code
for i in 1 2 4 8 9 12
do
    echo -e "\n\n#### Run nranks=$i"
    mpiexecjl -n $i --map-by numa --bind-to core julia --project diffusion_2d_mpi.jl 2056 nosave
done
