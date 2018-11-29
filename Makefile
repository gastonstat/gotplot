rfiles = $(wildcard *.R)
imgs = $(wildcard *.png)


all: plots/*.md images/*.png


images/*.png: code/rplots/*.R
	cd code/rplots; Rscript *.R
	cd code/rplots; mv *.png ../../images/.


_data/plots.yml: code/scripts/plots_yml.R code/rplots/*.R
	cd code/scripts; Rscript plots_yml_generator.R


plots/*.md: code/scripts/md_files_generator.R code/rplots/*.R
	cd code/scripts; Rscript md_files_generator.R


clean:
	rm -r plots/*.md
