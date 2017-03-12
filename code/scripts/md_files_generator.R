# Title: .md files generator
# Generates .md files for website 

library(stringr)


Rfiles <- system("ls ../rplots/", intern = TRUE)

# remove file extension
img_names <- str_sub(Rfiles, end = -3)

images <- paste0(img_names, ".png")

# separate composite names
img_titles <- str_to_title(str_replace(img_names, '-', ' '))

# output files
outfiles <- paste("../../plots/", img_names, ".md", sep = '')


# how many files
num_files <- length(Rfiles)

# start writing output to '.md' files
for (i in 1:num_files) {
  # read R script
  file_content <- readLines(sprintf("../rplots/%s", Rfiles[i]), warn = FALSE)
  
  # yaml header
  cat(file = outfiles[i], "---", "\n", sep = '')
  cat(file = outfiles[i], "layout: page", "\n", sep = '', append = TRUE)
  cat(file = outfiles[i], sprintf("title: \"%s\"", img_titles[i]), 
      "\n", sep = '', append = TRUE)
  cat(file = outfiles[i], "---", "\n\n", sep = '', append = TRUE)
  
  # add page title and image
  cat(file = outfiles[i], "# [Got Plot](/gotplot)", "\n\n", append = TRUE)
  cat(file = outfiles[i], sprintf("### %s", img_titles[i]), 
      "\n\n", append = TRUE)
  cat(file = outfiles[i], 
      sprintf("![%s](../images/%s)", 
              img_titles[i], images[i]), 
      "\n\n", append = TRUE)

  cat(file = outfiles[i], "-----", "\n\n", sep = '', append = TRUE)
  
  # add R code
  cat(file = outfiles[i], "{% highlight r %}", "\n", append = TRUE)
  # R file content
  for (l in 1:length(file_content)) {
    cat(file = outfiles[i], file_content[l], "\n", append = TRUE)    
  }
  # last line
  cat(file = outfiles[i], "{% endhighlight %}", "\n", append = TRUE)
}


