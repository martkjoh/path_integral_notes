#!/bin/bash
# For gihub actions

latexmk main.tex

# pdflatex -interaction=nonstopmode --output-directory=build/ main.tex
# pdflatex -interaction=nonstopmode --output-directory=build/ main.tex

# cd build/
# mpost feyn.mp
# cd ../

# pdflatex -interaction=nonstopmode --output-directory=build/ main.tex
