TEX = report.tex
PDF = $(TEX:.tex=.pdf)
BBL = $(TEX:.tex=.bbl)
BIB = $(wildcard *.bib)
BST = $(wildcard *.bst)
STY = $(wildcard *.sty)

all: $(PDF)

%.pdf: %.tex $(BIB) $(STY) $(BST)
	latexmk -pdf $<

%.bbl: %.tex $(BIB) $(STY) $(BST)
	latexmk -pdf $<

clean:
	#git clean -Xdf
	rm -f *.{aux,bbl,blg,fdb_latexmk,fls,log,out,lof,dvi}
	rm -f *.{bcf,run.xml}
	rm -f *.{toc,snm,nav}
	rm -f *.{ist,glo,acn}

cleanall: clean
	rm -f $(PDF)

.PHONY: all clean cleanall
