#!/bin/sh

pandoc \
  --standalone \
  --variable documentclass=article \
  --variable linestretch=1.15 \
  --resource-path=./out/docbook \
  --pdf-engine=xelatex \
  --to=pdf \
  --from=docbook \
  --toc \
  --toc-depth=2 \
  --out ./out/pdf/README.pdf \
  ./out/docbook/README.xml