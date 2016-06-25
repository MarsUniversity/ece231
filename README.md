# ECE 231

Original Author: Lt Col James Phillips, PhD

## Setup OSX

Install `latex`:

    brew cask install mactex

Make sure `cmake` can find `latex`

	export PATH=$PATH:/usr/local/texlive/2016/bin/x86_64-darwin

If you update `mactex` make sure to change the link if the year changes.

To help stay up todate with template changes:

	ln -s ~/google_drive/github/ece231/LaTeX_Stuff/handout.cls handout.cls
	ln -s ~/google_drive/github/ece231/LaTeX_Stuff/DFEC-logo.png

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
| --------------- |:-------------:|
| cmake nuke      | deletes everything in the build directory ... Nuke the site from orbit. It's the only way to be sure. |
| cmake clean-pdf | deletes pdfs in output directory |
| cmake clean     | deletes some latex artifact files from the build directory |
| cmake copy      | copies pdfs to an output directory |

Since `cmake` copies everything into the build directory, you can safely delete
it.


## Misc

To remove spaces from file names:

    for f in **/*; do mv -n "$f" `echo "$f" | sed -e 's/ /_/g'`; done
