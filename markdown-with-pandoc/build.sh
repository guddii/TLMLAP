#!/bin/sh

# Clean build folder
rm -r out
mkdir -p out/html
mkdir -p out/pdf

# Build a Website and PDF
docker run --rm --volume $(pwd):/data --entrypoint "/data/script.sh" pandoc/latex:latest