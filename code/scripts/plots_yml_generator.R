library(stringr)

images <- system("ls ../../images/", intern = TRUE)

# remove file extension
img_names <- str_sub(images, end = -5)

# separate composite names
img_titles <- str_to_title(str_replace(img_names, '_', ' '))

# file name 'plots.yml'
outfile <- "../../_data/plots.yml"

# initialize output file
file.create(outfile)

for (i in seq_along(images)) {
  cat("- title: ", img_titles[i], "\n", file = outfile, sep = '', append = TRUE)
  cat("  image: ", images[i], "\n", file = outfile, sep = '', append = TRUE)
  cat("  link:  ./plots/", img_names[i], ".html\n", file = outfile, sep = '', append = TRUE)
  cat("\n", file = outfile, sep = '', append = TRUE)
}
