---
layout: page
title: "Heatmap-Cars"
---

# [Got Plot](/gotplot) 

### Heatmap-Cars 

![Heatmap-Cars](../images/heatmap-cars.png) 

-----

{% highlight r %} 
# ======================================================== 
# Data: example with mtcars dataset 
# ======================================================== 
# load RColorBrewer 
library(RColorBrewer) 
 
# sorting cars according to miles per gallon 
cars_ord = order(mtcars$mpg) 
 
# convert to matrix 
mcars = as.matrix(mtcars[cars_ord,]) 
 
# row and col names 
labRow <- rownames(mcars) 
labCol <- c("Miles/(US) gallon",  
            "Number of cylinders", 
            "Displacement (cu.in.)", 
            "Gross horsepower", 
            "Rear axle ratio", 
            "Weight (lb/1000)", 
            "1/4 mile time", 
            "V/S", 
            "Transmission", 
            "No. of forward gears", 
            "No. of carburetors") 
 
# scale data by "columns" 
cars_data = scale(mcars)  
 
 
# ======================================================== 
# Plot 
# ======================================================== 
# set graphic parameters 
op = par(mar = c(3, 15, 15, 7), oma = c(rep(0.2, 4)), mex = 0.5) 
# call image 
image(x = 1:ncol(mcars), y = 1:nrow(mcars), z = t(cars_data),  
      xlab = "", ylab = "", col = brewer.pal(9, "YlGnBu"), axes = FALSE) 
# add axes and labels 
text(1L:ncol(mcars), par("usr")[4]+1, srt = 45, adj = 0, labels = labCol,  
     cex = 1, xpd = TRUE) 
axis(side = 2, 1L:nrow(mcars), labels = labRow, las = 2, line = -0.5,  
     tick = 0, cex.axis = 1) 
# add title 
mtext(text = "Heatmap", side = 3, at = -0.5, line = 11, cex = 1.5,  
      col = "gray30", font = 2) 
# add grid 
abline(h = 1L:nrow(mcars) + 0.5, v = 1L:ncol(mcars) + 0.5,  
       col = "white", lwd = 1.7) 
# reset default graphic parameters 
par(op) 
{% endhighlight %} 
