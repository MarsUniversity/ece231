# ECE 231

Original Author: Lt Col James Phillips, PhD

**this is still a work in progress**

## Setup OSX

Install `latex`:

    brew cask install mactex

Make sure `cmake` can find `latex`

	export PATH=$PATH:/usr/local/texlive/2016/bin/x86_64-darwin

If you update `mactex` make sure to change the link if the year changes.

To help stay up todate with template changes, create these links in `~/Library/texmf/tex/latex/common`:

	ln -s ~/google_drive/github/ece231/LaTeX_Stuff/handout.cls handout.cls
	ln -s ~/google_drive/github/ece231/LaTeX_Stuff/DFEC-logo.png


## Setup Windows

1. Install `latex` from http://www.tug.org/downloads (install-tl-window.exe) which
is a Windows installation package:

2. Install `cmake` from https://cmake.org/download.

3. Install ImageMagick from http://www.imagemagick.org/script/binary-releases.php.
I used the portable version x64 (near bottom of page) and put it in my Documents
folder. Then added it to the path:

	export IMAGEMAGICK_CONVERT=/c/Users/Kevin.Walchko/Documents/ImageMagick-7.0.2-5-portable-Q16-x64
	export PATH=/c/Users/Kevin.Walchko/Documents/ImageMagick-7.0.2-5-portable-Q16-x64:$PATH


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

    for f in **/*; do mv -n "$f" `echo "$f" | sed -e 's/ /_/g'`; done

Unfortunately this doesn't work recursively all the way down, just down one level.
