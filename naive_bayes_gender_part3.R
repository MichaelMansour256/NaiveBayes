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

# filter the training data with gender (male , female)
trainmale=traindata[traindata$gender == 'M',]
trainfemale=traindata[traindata$gender == 'F',]
# try 3 times to get random records
for (i in 1:4){
  # get 3500 record randomly from each gender
  a <- trainmale[sample(nrow(trainmale), 3500 ), ]
  b <- trainfemale[sample(nrow(trainfemale), 3500 ), ]
  
  # combine each 3500 record in one data frame
  new_traindata<-rbind(a,b)
  
  # call naive bayes model on gender col
  model <- naiveBayes(gender ~.,new_traindata)
  print(model)
  # get the predictions
  y_pred <- predict(model, newdata = testdata)
  
  # create the confusion metrics
  conf <- table(actual=testdata$gender,predicted=y_pred)
  
  # calculate the accuracy
  acc <-sum(diag(conf))/sum(conf)
  print(acc)

}

