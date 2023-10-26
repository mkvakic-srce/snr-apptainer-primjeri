#!/bin/bash

# učitaj datoteke
apptainer exec \
  --bind mnist_png.sqsh:/mnist_png:image-src=/ \
 ${HOME}/ubuntu-22.04.sif \
 python3 read.py
