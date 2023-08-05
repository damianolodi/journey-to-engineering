---
author: Damiano Lodi
pubDatetime: 2022-10-17T07:00:00+02:00
title: How to Setup Ubuntu for C and C++ Development
postSlug: 2022-10-17-how-to-setup-ubuntu-c-c++-embedded-development-cmake-make
featured: false
draft: false
tags:
  - development
  - embedded
  - C
  - C++
ogImage: ""
description: Setting up the correct tools for C and C++ (embedded) development is one of the things I struggled with the most. In this post, I summarize all the steps I take to install all the necessary tools on my new development machine.
---

In this article, I will explain how I am setting up my new Ubuntu desktop system for  C/C++ development. In particular, I am going to install build-systems (*Make*, *CMake* and *Ninja*), compilers (*GCC*, *Clang* and *Arm-GCC*) and some supporting tools (e.g. *Doxygen*).

## Prerequisites

- A system with *Ubuntu* installed. In particular, I am using *Ubuntu 22.04 LTS*.
- Some knowledge of the usage of the *Terminal* is required.
- (Optional) A good terminal setup. [I described my setup in the previous article.](https://www.journeytoengineering.com/blog/2022-10-03-powerful-and-improved-ubuntu-terminal-setup-for-productive-people/)

I learned most parts of this setup process in the course *[Creating a Cross-Platform Build System for Embedded Projects with CMake](https://embeddedartistry.com/course/creating-a-cross-platform-build-system-for-embedded-projects-with-cmake/)* from Embedded Artistry. The course goes more in-depth on the installation process of other tools, and it covers all the major OSes. If you need to learn more about *CMake*, go for it.

## Build Systems Installation

*CMake* is the main tool I would like to use to create the build system. It can be installed either with `apt` or `pip`. The version installed using the first method is not updated frequently, so I decided to proceed using Python.

```bash
# Check if Python is installed
$ which python3
/usr/bin/python3

# Check Python version
$ python3 --version
Python 3.10.6

# Install pip (Python package manager)
$ sudo apt install python3-pip

# Install CMake
$ python3 -m pip install cmake
```

After running this last command, a warning is returned: *CMake is installed in `~/.local/bin/`, which is not on PATH.* To run the command, I need to add the directory to the PATH variable.

---

If you are using *Terminal* setup (*Zsh* and *Oh-My-Zsh*), you need to do the following.

- Open `~/.zshrc`
- Near the start of the file search the comment which is mentioning PATH and add the following lines
	- `path+=('/home/<user>/.local/bin')` where `<user>` must be replaced by your user
	- `export PATH`
- Close and reopen *Terminal*

Instead, if you are using the default Bash shell, you need to add the following into `~/.bashrc`

```bash
PATH="/home/<user>/.local/bin:$PATH"
```

---

Now I can check the *CMake* version.

```bash
$ cmake --version
cmake version 3.24.1
```

Finally, I can install *Ninja*.

```bash
$ sudo apt install ninja-build

# Check Ninja installation
$ ninja version
1.10.1
```

*Make* is missing because it will be installed later.

## Toolchains Installation

Now I need to install the toolchains, i.e. the compilers used to translate C into machine code.

First, let's install the `build-essential` package which contains (among other things):

- *Make*
- The GCC compiler
- The `libc` library

```bash
$ sudo apt install build-essential

# Check Make installation
$ make --version
GNU Make 4.3
# ...more text...

# Check gcc installation
$ gcc --version
gcc (Ubuntu 11.2.0-19ubuntu1) 11.2.0
# ...more text...
```

I will also install the *Clang* compiler.

```bash
sudo apt install clang lld llvm clang-tools
```

It's time for embedded toolchains. I would like to install the ARM GNU Toolchain. Unfortunately, this process is a little bit more complicated because ARM does not provide the toolchain on package managers.

 - Go to the [Arm GNU Toolchain website](https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain)
 - Click on the **Download ARM GNU Toolchain** button
 - Download the tarball appropriate for the system (in this case x86_64 Linux `.tar.xz`)
 - Install the compression software *XZ Utils* using `sudo apt install xz-utils`
 - Unpackage the tarball with `tar -vxf <filename>.tar.xz`
 - Place the directory somewhere on your system
	 - In my case, I decided to place it in `~/.local/toolchains`
 
 Now, I need to add the `bin` directory to *PATH*.

---

 You can follow the same instructions of the previous paragraph. Based on your shell, you will have something like:

```bash
# ZSH - Add before the `export PATH` line
path+=('/home/damiano/.local/toolchains/arm-gnu-toolchain-12.2.mpacbti-bet1-x86_64-arm-none-eabi/bin')

# BASH
PATH="/home/damiano/.local/toolchains/arm-gnu-toolchain-12.2.mpacbti-bet1-x86_64-arm-none-eabi/bin:$PATH"
```

---

 Finally, I can re-open the *Terminal* and check if the ARM Toolchain is detected by checking its version.

```bash
$ arm-none-eabi-gcc --version
arm-none-eabi-gcc (Arm GNU Toolchain 12.2.MPACBTI-Bet1 (Build arm-12-mpacbti.16)) 12.2.0
# ...more text...
```

## Supporting Tools Installation

The core tools are now ready, but I would like to install other software generally helpful when dealing with C/C++ code.

```bash
# Install make (already installed by build-essential)
sudo apt install make

# Install pkg-config
sudo apt install pkg-config

# Install lizard (code complexity analyzer)
python3 -m pip install lizard

# Install others (documentation, formatting, etc.)
sudo apt install doxygen cppcheck gcovr lcov clang-format clang-tidy clang-tools
```

I will explore the usage of these tools in later posts.

## Text Editor Setup

Finally, I need a text editor. Everyone has their own favourite, and I am not here to discuss which one is the best. Personally, I find *Visual Studio Code* pleasant, so I installed this one.

In case you are using it too, you can find it useful to install the following extensions:

- [CMake](https://marketplace.visualstudio.com/items?itemName=twxs.cmake) (by *twxs*) &rarr; CMake syntax highlight
- [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) (by Microsoft) &rarr; C/C++ language extension

## Conclusion 

If you followed this article, you should have all the tools necessary to write and build C/C++ code, including support for cross-compilation.

In the following posts, we will use them extensively.
