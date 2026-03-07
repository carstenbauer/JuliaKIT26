#!/bin/bash
#SBATCH --job-name=diff2dmpi
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=4G
#SBATCH --time=00:10:00
#SBATCH --output=job_script.out
#SBATCH --partition=cpu_il

if [[ -n "${SLURM_JOB_ID}" ]]; then
    module load juliahpc
    export JULIAKIT26_DEPOT_PATH="/pfs/work9/workspace/scratch/ka_rx8865-juliakit26/.juliakit26"
    export JULIA_DEPOT_PATH="$TMPDIR/.julia_$USER:$JULIAKIT26_DEPOT_PATH"
fi

# run MPI code
mpiexecjl -n 4 julia --project diffusion_2d_mpi.jl
# combine the results and visualize them
julia --project visualize_mpi.jl
