#!/bin/bash

watchexec \
  --watch ./src/ \
  --exts tex,bib,sty,cls \
  --restart \
  -- latexmk -pdf -interaction=nonstopmode -output-directory=dist ./src/main.tex
