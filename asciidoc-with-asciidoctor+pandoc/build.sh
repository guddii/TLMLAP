#!/bin/sh

# Clean build folder
rm -r out
mkdir -p out/pdf

# Build a Website
docker run --rm -u $(id -u):$(id -g) --volume $(pwd):/documents/ asciidoctor/docker-asciidoctor:latest \
  asciidoctor \
  --require asciidoctor-diagram \
  --require asciidoctor-bibtex \
  --out ./out/html/README.html \
  --backend=html5 \
  src/README.adoc

# Build a DocBook
docker run --rm -u $(id -u):$(id -g) --volume $(pwd):/documents/ asciidoctor/docker-asciidoctor:latest \
  asciidoctor \
  --require asciidoctor-diagram \
  --require asciidoctor-bibtex \
  --out ./out/docbook/README.xml \
  --backend=docbook5 \
  src/README.adoc

# Build a PDF from DocBook
docker run --rm --volume $(pwd):/data --entrypoint "/data/script.sh" pandoc/latex:latest
