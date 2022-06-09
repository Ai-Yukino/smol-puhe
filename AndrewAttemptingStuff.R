library(tidyverse)
library(factoextra)
library(cluster)
library(ggplot2)
library(e1071)


### MAKE SURE TO SET YOUR DIRECTORY /  MODIFY THIS AS NEEDED TO IMPORT DATA SET
data = read_csv("~/smol-puhe/data/filtered_data.csv")

data$difference = data$f1 - data$f0
data$quotient = data$f1/data$f0
dataMod = subset(data, select = -c(b1,b2,b3,b4,f1p,f2p,f3p,f4p, intensity, harmonicity, ...1, time))

model1 = lm(difference~gender, data = data)
summary(model1)
model2 = lm(quotient~gender, data = data)
summary(model2)


model3 = lm(difference~., data = subset(dataMod, select = -c(quotient, f0, f1)))
summary(model3)
model4 = lm(quotient~., data = subset(dataMod, select = -c(difference, f0, f1)))
summary(model4)

fviz_nbclust(dataMod, kmeans, method = "wss")
gapStat = clusGap(dataMod, FUN = kmeans, K.max = 10, B = 50)
fviz_gap_stat(gapStat)

km1 = kmeans(dataMod, centers = 2)
km2 = kmeans(dataMod, centers = 6)
km3 = kmeans(dataMod, centers = 8)
fviz_cluster(km1, dataMod)
fviz_cluster(km2, dataMod)
fviz_cluster(km3, dataMod)


fviz_nbclust(subset(dataMod, select = c(f1, f2, gender)), kmeans, method = "wss")
gapStat2 = clusGap(subset(dataMod, select = c(f1, f2, gender)), FUN = kmeans, K.max = 10, B = 50)
fviz_gap_stat(gapStat2)

km4 = kmeans(dataMod, centers = 2)
km5 = kmeans(dataMod, centers = 4)
km6 = kmeans(dataMod, centers = 5)
fviz_cluster(km4, subset(dataMod, select = c(f1, f2, gender)))
fviz_cluster(km5, subset(dataMod, select = c(f1, f2, gender)))
fviz_cluster(km6, subset(dataMod, select = c(f1, f2, gender)))


ggplot(dataMod, aes(x = f0, y = f1)) + geom_point(aes(color = gender, alpha = 0.01))


fullMod = lm(gender~f0 + f1 + f2, dataMod)
redMod = lm(gender~f0, dataMod)
anova(redMod, fullMod)

test = lm(gender~f0, dataMod)
summary(test)

test2 = lm(gender~f0 + f1, dataMod)
summary(test2)

test3 = lm(gender~f0 + f1 + f0*f1, dataMod)
summary(test3)
