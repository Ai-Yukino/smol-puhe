

library(read_xls)
library(caret)
library(skimr)



dataset<- read_xls("C:/Users/chery/Documents/Repositories/smol-puhe/data/filtered_data.xls")
dim(dataset)

df <- dataset[c("f1", "f2", "f3", "f4", "f0", "intensity", "harmonicity", "age","gender")]
head(df)

# dimensions of dataset
dim(df)


#create output as target class
df$gender = as.factor(df$gender)

# Step 1: Get row numbers for the training data
trainRowNumbers <- createDataPartition(df$gender, p=0.8, list=FALSE)

# Step 2: Create the training  dataset
trainData <- df[trainRowNumbers,]

# Step 3: Create the test dataset
testData <- df[-trainRowNumbers,]

# Store X and Y for later use.
x = trainData[ 1:5]
y = factor(trainData[[9]])


Sys.setlocale( locale = 'Chinese')
#skimmed <- skim_to_wide(trainData)
#skimmed[,]
skim(df)

df %>% dplyr::group_by(gender) %>% skim()

#create a list of 80% of rows for training
validation_index <- createDataPartition(df$gender, p=0.80, list=FALSE)
validation <- df[-validation_index,]
df <- df[validation_index,]


# dimensions of dataset
dim(df)

#summarize attribute distributions
summary(df)

#summarize the class distribution
percentage <-prop.table(table(df$gender)) *100
y = factor(trainData[[9]])
cbind(freq=table(df$gender), percentage =percentage)

#split input and output
#x<-df[,1:5]
#y<-as.factor(df[[9]])

#boxplot for each attribute
par(mfrow=c(1,5))
  for(i in 1:5){
    boxplot(x[,i], main=names(df)[i])
  }


# Run algorithms using 10-fold cross validation
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# a) linear algorithms
set.seed(7)
fit.lda <- train(gender~., data=df, method="lda", metric=metric, trControl=control)
# b) nonlinear algorithms
# CART
set.seed(7)
fit.cart <- train(gender~., data=df, method="rpart", metric=metric, trControl=control)
# kNN
set.seed(7)
fit.knn <- train(gender~., data=df, method="knn", metric=metric, trControl=control)
# c) advanced algorithms
# SVM
set.seed(7)
fit.svm <- train(gender~., data=df, method="svmRadial", metric=metric, trControl=control)
# Random Forest
set.seed(7)
fit.rf <- train(gender~., data=df, method="rf", metric=metric, trControl=control)

#summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)

# compare accuracy of models
dotplot(results)

# best model is random forest
print(fit.rf)

#analyze results in confusion matrix

# estimate skill of rf on the validation dataset
predictions <- predict(fit.rf, validation)
confusionMatrix(predictions, validation$gender)
