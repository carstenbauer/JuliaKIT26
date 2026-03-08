#
# to be executed in the HOME directory
#

# install juliaup + julia (if julia doesn't already exist)
if ! command -v julia &>/dev/null; then
  echo "julia could not be found, installing juliaup + julia ..."
  curl -fsSL https://install.julialang.org | sh -s -- --yes
fi

# install workshop environment (excluding LIKWID)
git clone https://github.com/carstenbauer/JuliaKIT26
cd JuliaKIT26
julia install.jl full
