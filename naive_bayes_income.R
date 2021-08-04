#set the working directory 
setwd('H:\\4.2\\4.2\\Data Sceince\\Data Science Practical Task-20210526\\Dataset for practical task')

# install the package
install.packages("e1071")

# Loading package
library(e1071)

# read the csv file into table
sample <- read.table('nbtrain.csv',header = TRUE,sep = ',')

# split the data into train and test
traindata <- sample[1:9010,1:4]
testdata <- sample[9011:10010,1:4]

# call the naive bayes by income 
model <- naiveBayes(income ~.,traindata)
model
# get the prediction for test data
y_pred <- predict(model, newdata = testdata)

# create confusion matrix for the result
conf <- table(actual=testdata$income,predicted=y_pred)
conf
# calculate the accuracy
acc<-sum(diag(conf))/sum(conf)
acc