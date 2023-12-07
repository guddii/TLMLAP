#!/bin/sh

# Clean build folder
rm -r out

# Build a Website
docker run --rm -u $(id -u):$(id -g) --volume $(pwd):/documents/ asciidoctor/docker-asciidoctor:latest \
  asciidoctor \
  --require asciidoctor-diagram \
  --require asciidoctor-bibtex \
  --out ./out/html/README.html \
  --backend=html5 \
  src/README.adoc

# Build a PDF
docker run --rm -u $(id -u):$(id -g) --volume $(pwd):/documents/ asciidoctor/docker-asciidoctor:latest \
  asciidoctor-pdf \
  --require asciidoctor-diagram \
  --require asciidoctor-bibtex \
  --theme resources/themes/basic.yml \
  --out ./out/pdf/README.pdf \
  --backend=pdf \
  src/README.adoc
