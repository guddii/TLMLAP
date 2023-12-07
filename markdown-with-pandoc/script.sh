#!/bin/sh

# Build a Website
pandoc \
  --standalone \
  --data-dir="./src" \
  --extract-media="./out/html" \
  --metadata-file="./src/README.yaml" \
  --variable documentclass=article \
	--variable linestretch=1.15 \
  --resource-path=./src \
  --to=html \
  --from=markdown \
  --toc \
  --toc-depth=2 \
  --bibliography ./src/references.bib \
  --citeproc --csl ./resources/apa.csl \
  --out ./out/html/README.html \
  ./src/README.md

# Build a PDF
pandoc \
  --standalone \
  --embed-resources \
  --metadata-file="./src/README.yaml" \
  --variable documentclass=article \
	--variable linestretch=1.15 \
  --resource-path=./src \
  --pdf-engine=xelatex \
  --to=pdf \
  --from=markdown \
  --toc \
  --toc-depth=2 \
  --bibliography ./src/references.bib \
  --citeproc --csl ./resources/apa.csl \
  --out ./out/pdf/README.pdf \
  ./src/README.md
