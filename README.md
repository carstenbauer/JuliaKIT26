# JuliaKIT26

A four-day workshop that will take place at [KIT](https://www.kit.edu/) in March 2026.
   
**Trainer:** [Dr. Carsten Bauer](https://github.com/carstenbauer)

## Schedule (tentative)

<a href="https://github.com/carstenbauer/JuliaKIT26/raw/main/orga/timetable.pdf"><img src="https://github.com/carstenbauer/JuliaKIT26/raw/main/orga/timetable.png" width=720px></a>

## Preparing for the course

<details>
   <summary> <h2>Preparing your laptop (click to unfold)</h2> </summary>

### Install Julia 1.12

The simplest way to install Julia 1.12 is via [juliaup](https://github.com/JuliaLang/juliaup). Run one of the following in a terminal.

##### Linux/macOS

```
curl -fsSL https://install.julialang.org | sh -s -- --yes --default-channel 1.12
```

##### Windows

```
winget install julia -s msstore
```

### Download workshop materials

The simplest way to download the workshop materials (this GitHub repository) is through [Git]().

```bash
git clone https://github.com/carstenbauer/JuliaKIT26
```

If you don't have Git, you can either [install it](https://github.com/git-guides/install-git) or manually [download the materials as a `.zip` archive](https://github.com/carstenbauer/JuliaKIT26/archive/refs/heads/main.zip) instead.

### Installing the Julia environment

Within the `JuliaKIT26` directory (that you've cloned or downloaded above), run the following command:

```bash
julia install.jl
```

**Remark: The installation might take a couple of minutes and a few GB of disk space** (worst case: up to ~10 minutes and up to ~2.6 GB). The reason is that we also install binary dependencies (e.g. MPI) via Julia's Package manager to be as self-contained as possible. If you want to remove everything after the course, simply delete `~/.julia`.

### Update `PATH` environment variable

We will use `mpiexecjl` during the course, which - after the installation above - lies in `~/.julia/bin`. To make it available everywhere, we need to add `~/.julia/bin` to the `PATH` environment variable. On Linux/macOS, you can add the following line to your `.bashrc` (or whatever file gets automatically loaded by your shell):

```
export PATH=$HOME/.julia/bin:$PATH
```

If you're on Windows, please [ask Claude](https://claude.ai/new?q=how+to+add+%24HOME%2F.julia%2Fbin+to+the+PATH+environment+variable+on+windows%3F) oder [ask ChatGPT](https://chatgpt.com/?prompt=how+to+add+%60%24HOME%2F.julia%2Fbin%60+to+the+%60PATH%60+environment+variable+on+windows%3F).

### Install Visual Studio Code (+ extensions)

* Download Visual Studio Code from https://code.visualstudio.com/download and install it.
* Afterwards, install the following two extensions (the linked pages should have "Install" buttons, respectively)
  * [Remote - SSH extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
  * [Julia extension](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia)

### Install Jupyter Lab

Technically, you don't necessarily need Jupyter Lab, because Visual Studio Code can also open notebook files. However, I highly recommend that you install it:

* [Installation instructions](https://jupyter.org/install)

If you don't manage to install Jupyter using the above link, you can also let Julia try to install it for you. Run `julia --project` **within the `JuliaKIT26` directory** and then execute the following Julia commands:

```julia
using IJulia
IJulia.notebook()
```
</details>

<details>
   <summary> <h2>Preparing your KIT account (click to unfold)</h2> </summary>

TBD
</details>
