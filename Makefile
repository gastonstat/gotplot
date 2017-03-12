
all: plots/*.md
#images/*.png: code/plots/*.r
#	cd code/plots; Rscript *.r
#	cd code/plots; mv *.png ../../images/

_data/plots.yml: code/scripts/plots_yml.R
	cd code/scripts; Rscript plots_yml_generator.R


plots/*.md: code/scripts/md_files_generator.R
	cd code/scripts; Rscript md_files_generator.R


clean:
	rm -r plots/*.md
