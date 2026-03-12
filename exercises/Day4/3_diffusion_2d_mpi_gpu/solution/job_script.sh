#!/bin/bash
#SBATCH --job-name=diff2dmultigpu
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --gres=gpu:4
#SBATCH --time=00:10:00
#SBATCH --output=job_script.out
#SBATCH --partition=gpu_a100_short
##SBATCH --qos=workshop
##SBATCH --reservation=ws_julia

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
    export JULIAKIT26_DEPOT_PATH="/pfs/work9/workspace/scratch/ka_rx8865-juliakit26/.juliakit26"
    export JULIA_DEPOT_PATH="$TMPDIR/.julia_$USER:$JULIAKIT26_DEPOT_PATH"
fi

export JULIA_CUDA_MEMORY_POOL=none

# run MPI + CUDA code on 4 GPUs
mpiexecjl -n 4 julia --project diffusion_2d_mpi_gpu.jl
# combine the results and visualize them
julia --project visualize_mpi.jl

# run with higher resolution
mpiexecjl -n 4 julia --project diffusion_2d_mpi_gpu.jl 16384 nosave
