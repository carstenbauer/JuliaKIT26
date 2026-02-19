for f in *.jl
do
    echo "Running $f"
    mpiexecjl --project -n 4 julia "$f"
done
