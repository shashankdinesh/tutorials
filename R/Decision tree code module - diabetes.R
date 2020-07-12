
diabet<-read.csv("diabetes.csv")


#Split the data into training and testing -> 75% train and 25% test

library(caTools)
sample.split(diabet,SplitRatio = 0.80)-> split_tag
diabet_train <- subset(diabet, split_tag==T)
diabet_test <- subset(diabet, split_tag==F)


#Building decision trees

#For rpart() we need to load rpart library

library(rpart)

#colnames(diabet)

#Lets use all variables to build our decision tree model

diabet_model <- rpart(Outcome~ .,data = diabet_train)

#Summary of the tree

diabet_model

plot(diabet_model,margin=0.5)

text(diabet_model,
     use.n = TRUE, pretty=TRUE, cex=0.8 )

#How to make decision trees look good

library(rattle)

fancyRpartPlot(diabet_model,cex=0.6)

#Prediction of test dataset

pred_diabet <- predict(diabet_model,newdata = diabet_test,type = "class")

head(pred_diabet)

#Lets compare with actual

table(diabet_test$Outcome,pred_diabet)

#Accuracy
(93+42)/171

#Recall
(42)/(42+16)

customer_churn<-read.csv("customer_churn.csv")

#Simple logistic regression to predit Churn using Monthly charges of customers

library(caTools)  

sample.split(customer_churn, SplitRatio = 0.75)-> split_tag

subset(customer_churn, split_tag==T)->train

subset(customer_churn, split_tag==F)->test

#For rpart() we need to load rpart library


churn_model <- rpart(Churn~PaymentMethod + TechSupport + tenure+ PaperlessBilling+
                       Partner+InternetService+MonthlyCharges,
                                 data = train)

fancyRpartPlot(churn_model,cex=0.6)

#Prediction of test dataset

pred_churn <- predict(churn_model,newdata = test,type = "class")

head(pred_churn)

#Lets compare with actual

table(test$Churn,pred_churn)


#Accuracy
(1388+218)/2013


#Recall
218/(218+303)



#For creating confusion matrix, we can use the following :-

#install.packages("caret")
#install.packages("e1071")

#library(caret)


#Random Forest


library(randomForest)

mod_forest <-randomForest(Outcome~,data = diabet_train,ntree=500)

pred_for <- predict(mod_forest,newdata = diabet_test,type = "class")

#Lets compare with actual

table(diabet_test$Outcome,pred_for)

# Confusion matrix for Decision tree we created earlier

table(diabet_test$Outcome,pred_diabet)






-----------------------------------------------

customer_churn<-read.csv("customer_churn.csv")

library(caTools)  
sample.split(customer_churn$Churn,SplitRatio = 0.75)-> split_tag
subset(customer_churn, split_tag==T)->train
subset(customer_churn, split_tag==F)->test

library(randomForest)

# Number of variables randomly sampled as candidates at each split. 
# Note that the default values are different for classification (sqrt(p)
# where p is number of variables in x) 
# and regression (p/3)

mod_forest1 <- randomForest(Churn~PaymentMethod + TechSupport + tenure+ PaperlessBilling+
                              Partner+InternetService+MonthlyCharges, 
                            data=train, 
                            mtry=3, # number of features/variables 
                            ntree=100) # number of trees

importance(mod_forest1)
varImpPlot(mod_forest1)
varImpPlot(mod_forest1, col="palegreen4")

#par(mfrow=c(1,1)) #fitting multiple plots in a view

predict(mod_forest1,newdata=test,type="class")->result_forest1

head(result_forest1)

table(test$Churn, result_forest1)



randomForest(Churn~MonthlyCharges+tenure+gender+InternetService+Contract, data=train, mtry=4, ntree=100)-> mod_forest2

predict(mod_forest2,newdata=test,type="class")->result_forest2
head(result_forest2)
table(test$Churn, result_forest2)

randomForest(Churn~MonthlyCharges+tenure+gender+InternetService+Contract, data=train, mtry=5, ntree=100)-> mod_forest3
predict(mod_forest3,newdata=test,type="class")->result_forest3
head(result_forest3)
table(test$Churn, result_forest3)



randomForest(Churn~MonthlyCharges+tenure+gender+InternetService+Contract, data=train)-> mod_forest4
predict(mod_forest4,newdata=test,type="class")->result_forest4
head(result_forest4)
table(test$Churn, result_forest4)


randomForest(Churn~MonthlyCharges+tenure+gender+InternetService+Contract+OnlineSecurity+OnlineBackup+DeviceProtection+TechSupport, data=train, mtry=3, ntree=1000)-> mod_forest4
importance(mod_forest4)
varImpPlot(mod_forest4, col="palegreen4")

predict(mod_forest4,newdata=test,type="class")->result_forest4
head(result_forest4)
table(test$Churn, result_forest4)

?randomForest
