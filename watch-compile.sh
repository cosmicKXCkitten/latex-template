#!/bin/bash

watchexec \
  --watch ./src/ \
  --exts tex,bib,sty,cls \
  --restart \
  -- 'latexmk -pdf -dvi- -ps- -interaction=nonstopmode -output-directory=dist -aux-directory=dist-aux ./src/main.tex && \
      latexmk -c -output-directory=dist ./src/main.tex'
