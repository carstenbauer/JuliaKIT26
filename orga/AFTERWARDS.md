# What you should definitely do

Remove the line
```
source /pfs/work9/workspace/scratch/ka_rx8865-juliakit26/bashrc.sh
```
from `$HOME/.bashrc`. Assuming it is still the last line in this file (which it should be) you can simply run
```
sed -i '$d' $HOME/.bashrc
```

# The modules are gone, what should I do?

### `module load code` (VSCode CLI)

(Only required for VS Code tunneling - not SSH)

```
curl -L -o vscode_cli.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64"
mkdir -p "$HOME/.local/bin2" && tar -xzf vscode_cli.tar.gz -C "$HOME/.local/bin2"
rm vscode_cli.tar.gz
```

This downloads the `code` command line interface to `$HOME/.local/bin` which should already be on `$PATH`. Afterwards, you should be able to run `code` anywhere on the cluster. No need for `module load code` anymore.

### `module load juliahpc` (Julia + CUDA + MPI)

#### Option 1

Install Julia via juliaup on the cluster with

```
curl -fsSL https://install.julialang.org | sh
```

Load CUDA and MPI with the following commands, whenever you need them.

```
module load devel/cuda/12.8
module load mpi/openmpi/5.0-gnu-14.2
```

#### Option 2

Download Julia manually and create a custom module file like I did for the workshop.

##### Download Julia

```
curl -fL -o /tmp/julia.tar.gz https://julialang-s3.julialang.org/bin/linux/x64/1.12/julia-1.12.5-linux-x86_64.tar.gz && tar -xz -C $HOME/.local/bin -f /tmp/julia.tar.gz && rm /tmp/julia.tar.gz
```

This download Julia and puts it in a subfolder in `$HOME/.local/bin`.

##### Create a custom module file

```
mkdir -p $HOME/.local/modules/juliahpc && cat > $HOME/.local/modules/juliahpc/1.12.5.lua << EOF
local root = "$HOME/.local/bin/julia-1.12.5/"
whatis("The Julia programming language for numerical computing")
family("juliahpc")
setenv("JULIA_VERSION","1.12.5")
setenv("JULIA_HOME_DIR",root)
setenv("JULIA_BIN_DIR",pathJoin(root, "bin"))
setenv("JULIA_LIB_DIR",pathJoin(root, "lib"))
setenv("JULIA_LIBEXEC_DIR",pathJoin(root, "libexec"))
setenv("JULIA_INC_DIR",pathJoin(root, "include"))
setenv("JULIA_ETC_DIR",pathJoin(root, "etc"))
prepend_path("PATH",pathJoin(root, "bin"))
prepend_path("LD_LIBRARY_PATH",pathJoin(root, "lib"))
prepend_path("MANPATH",pathJoin(root, "share/man"))
conflict("juliahpc")
load("devel/cuda/12.8")
load("mpi/openmpi/5.0-gnu-14.2")
setenv("SLURM_MPI_TYPE","pmix")
setenv("UCX_ERROR_SIGNALS","SIGILL,SIGBUS,SIGFPE")
setenv("UCX_WARN_UNUSED_ENV_VARS","n")
EOF
echo 'export MODULEPATH=$HOME/.local/modules:$MODULEPATH' >> $HOME/.bashrc
```
This creates the module file that we've used during the workshop in `$HOME/.local/modules/juliahpc` and puts this directory structure on `$MODULEPATH`.

After running `. ~/.bashrc` or logging out and back in again you should be able to do `module load juliahpc` just as during the workshop.

# The `julia_wrapper.sh` is gone, what should I do?

```
curl -fL -o $HOME/.local/bin/julia_wrapper.sh https://raw.githubusercontent.com/carstenbauer/JuliaKIT26/refs/heads/main/orga/julia_wrapper.sh && chmod +x $HOME/.local/bin/julia_wrapper.sh
```
Point the Julia VS Code extension (the "executable" setting) to `<YOURHOME>/.local/bin/julia_wrapper.sh` where you replace `<YOURHOME>` by what `echo $HOME` gives you.
