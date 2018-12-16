### VECTOR images conversion parameters ###
ORG_DIR = ./img/originals
VEC_DIR = ./img/vectors

# ...from SVG
SVG_PREFIX = svg
SVGF  = $(notdir $(wildcard $(ORG_DIR)/*.svg))
vpath %.svg $(ORG_DIR)

# ...from TEX
TEX_PREFIX = tex
TEXF  = $(notdir $(wildcard $(ORG_DIR)/*.tex))
vpath %.tex $(ORG_DIR)

# ...to PDF
PDF   = $(SVGF:.svg=_$(SVG_PREFIX).pdf)
PDF  += $(TEXF:.tex=_$(TEX_PREFIX).pdf)

vpath %.pdf $(VEC_DIR)

### Select all raster ###
RAST_DIR = ./img/rasters
RASTF    = $(wildcard $(RAST_DIR)/*)

### TEX files ###
TEX_DIR   = ./tex
# TEX_DIR+= ./antani
# ...

TEX       = $(foreach dir,$(TEX_DIR),$(wildcard $(dir)/*.tex))

vpath %.tex $(TEX_DIR)

all: build/main.pdf vectors

build/main.pdf: main.tex $(RASTF) $(TEX) $(PDF) makefile
	@mkdir -p build
	@if [ -t 1 ]; then echo -e "\033[1;33m[Mashup      ]\033[0m main.tex"; else echo "Mashup"; fi
	@pdflatex -output-directory build -synctex=1 -interaction=nonstopmode main.tex > /dev/null
	@pdflatex -output-directory build -synctex=1 -interaction=nonstopmode main.tex > /dev/null

vectors: $(PDF)

%_tex.pdf : %.tex
	@mkdir -p $(VEC_DIR)
	@if [ -t 1 ]; then echo -e "\033[1;32m[Figure TEX  ]\033[0m $^ $@"; else echo "[Figure TEX   ] $^ $@"; fi
	@pdflatex -jobname $(@:.pdf=) -output-directory $(VEC_DIR) $^ > /dev/null

%_svg.pdf : %.svg
	@mkdir -p $(VEC_DIR)
	@if [ -t 1 ]; then echo -e "\033[1;32m[Figure SVG  ]\033[0m $^"; else echo "[Figure SVG   ] $^"; fi
	@inkscape -z -D --file=$^ --export-pdf=$(VEC_DIR)/$@ > /dev/null

tree:
	mkdir -p $(VEC_DIR)
	mkdir -p $(ORG_DIR)
	mkdir -p $(RAST_DIR)
	mkdir -p $(TEX_DIR)
	mkdir -p build
	cd build && mkdir -p $(TEX_DIR)
	
clean:
	rm -rf build
	rm -rf $(VEC_DIR)

mrproper: build
	rm -rf dist
