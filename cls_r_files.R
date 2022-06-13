install.packages("caret")
library(caret)
library(tidyverse)
libary(tidyr)"


filename <- "data\filtered_data.csv"
dataset <-read.csv(filename, header = FALSE)
colnames(dataset) <- c("time","f1",	"b1",	"f2",	"b2",	"f3",	"b3",	"f4",	"b4",	"f1p",	"f2p",	"f3p",	"f4p",	"f0",	"intensity",	"harmonicity",	"age","gender"
)
#create a list of 80% of the row for training
validation_index <- createDataPartition(dataset$gender, p=0.80, list=FALSE)
# select 20% of the data for validation
validation <- dataset[-validation_index,]
#use 80% of data to training and testing the models
dataset<- dataset[validation_index,]
