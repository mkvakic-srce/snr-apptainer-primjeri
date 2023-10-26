#!/bin/bash

# download
wget -nc https://github.com/myleott/mnist_png/raw/master/mnist_png.tar.gz

# untar
tar xvf mnist_png.tar.gz

# squashfs
mksquashfs mnist_png/ mnist_png.sqsh
