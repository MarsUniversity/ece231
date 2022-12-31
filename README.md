# ECE 231

**ECE 231.** Electrical Circuits and Systems I. 3(1). An introduction to circuit analysis and
system design. Topics include circuit models of electrical devices and systems, nodal and mesh
analysis, Thévenin and Norton equivalent circuits, dependent sources, operational amplifier
circuits, transient, sinusoidal, steady-state, and frequency response of first-order circuits (solution
of linear, first-order, constant coefficient, ordinary differential equations), and military and
civilian applications. Lab. Final exam. Prereq: Math 142. Sem hrs: 3 fall or spring.

Original Author: Lt Col James Phillips, PhD

**this is still a work in progress**

## Setup OSX

Install `latex`:

```
brew cask install basictex
```

Put `handout.cls` and `DFEC-logo.png` in:

`/Users/<user name>/Library/texmf/tex/latex/local/`

install `lastpage.stl`:

```
sudo tlmgr install lastpage
```

Might want to do:

```
sudo tlmgr update --all
```

## Setup Windows

1. Install `latex` from http://www.tug.org/downloads (install-tl-window.exe) which
is a Windows installation package:

2. Install `cmake` from https://cmake.org/download.

3. Install ImageMagick from http://www.imagemagick.org/script/binary-releases.php.
I used the portable version x64 (near bottom of page) and put it in my Documents
folder. Then added it to the path:

```
export IMAGEMAGICK_CONVERT=/c/Users/Kevin.Walchko/Documents/ImageMagick-7.0.2-5-portable-Q16-x64
export PATH=/c/Users/Kevin.Walchko/Documents/ImageMagick-7.0.2-5-portable-Q16-x64:$PATH
```

## Build

This uses [`UseLATEX.cmake`](https://github.com/kmorel/UseLATEX) to build the
`.tex` files.

Edit the `CMakeLists.txt` variables to build the solution or not and also set
the output PDF diectory.

1. `mkdir build`
2. `cd build`
3. `cmake ..`
4. `make`

Other useful `make` commands:

| Commands        | Description   |
| --------------- |:--------------|
| cmake nuke      | deletes everything in the build directory ... Nuke the site from orbit. It's the only way to be sure. |
| cmake clean-pdf | deletes pdfs in output directory |
| cmake clean     | deletes some latex artifact files from the build directory |
| cmake copy      | copies pdfs to an output directory |

Since `cmake` copies everything into the `build` directory, you can safely delete
it.

## Misc

To remove spaces from file names:

```
for f in **/*; do mv -n "$f" `echo "$f" | sed -e 's/ /_/g'`; done
```

Unfortunately this doesn't work recursively all the way down, just down one level.
