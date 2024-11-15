notes:
	latexmk main.tex

.PHONY: input

input: $(wildcard content/*.tex)
	ls content/??_*.tex | awk '{printf "\\input{%s}\n", $$1}' > content/input.tex
	cat content/input.tex

