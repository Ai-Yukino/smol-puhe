library(tidyverse)

wd <- getwd() %>% str_replace("/scripts/R/praat_processing$", "")
setwd(wd)
getwd()
rm(wd)

data <- read_csv("./data/filtered_data.csv")
data <- data[, c('f0', 'f1', 'f2', 'gender')]

##Unsupervised Learning: Principal Components Analysis

#Calculate the Principal Components
results <- prcomp(data, scale = TRUE)

#reverse the signs
results$rotation <- -1*results$rotation

#display principal components
results$rotation

#reverse the signs of the scores
results$x <- -1*results$x

#display the first six scores
head(results$x)

biplot(results, scale = 0)

#calculate total variance explained by each principal component
results$sdev^2 / sum(results$sdev^2)

#calculate total variance explained by each principal component
var_explained = results$sdev^2 / sum(results$sdev^2)

#create scree plot
qplot(c(1:4), var_explained) + 
  geom_line() + 
  xlab("Principal Component") + 
  ylab("Variance Explained") +
  ggtitle("Scree Plot") +
  ylim(0, 1)