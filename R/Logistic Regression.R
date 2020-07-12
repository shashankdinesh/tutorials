
customer_churn<-read.csv("customer_churn.csv")
  
#Simple logistic regression to predit Churn using Monthly charges of customers

library(caTools)  

sample.split(customer_churn, SplitRatio = 0.75)-> split_tag

subset(customer_churn, split_tag==T)->train

subset(customer_churn, split_tag==F)->test

#Fit a logistic regression algorithm on training

mod_log <- glm(Churn~MonthlyCharges, data=train, family = "binomial")

summary(mod_log)

predict(mod_log,newdata=test,type="response")->result_log

head(result_log)

range(result_log)

#Probability threshold set as 0.35

table(test$Churn, result_log> 0.35)


---------------------------------------------------------

#Churn is the dependent variable
#Partner+InternetService+MonthlyCharges 

#Multiple Logistic Regression

#Predict Churn Rate based on whether a customer has partner or not ; 
#what internet service they use and monthly charges associated)  

  
customer_churn <-read.csv("customer_churn.csv")

#install.packages("caTools")      

library(caTools)  

sample.split(customer_churn$Churn,SplitRatio = 0.75)-> split_tag

subset(customer_churn, split_tag==T)->train

subset(customer_churn, split_tag==F)->test

#build logistics regression model

glm(Churn~ Partner + InternetService + MonthlyCharges, data=train, family = "binomial")-> mod_log2

summary(mod_log2)

predict(mod_log2,newdata=test,type="response")-> result_log2

head(result_log2)

range(result_log2)

#Threshold value for predicting outcome = 0.35

table(test$Churn, result_log2 > 0.35)

(1074+222)/1761

--

  
#Lets try running the model with Payment Method, TechSupport, Tenure, and Paperless billing

glm(Churn ~ PaymentMethod + InternetService + TechSupport + tenure+ PaperlessBilling +MonthlyCharges, data=train, family = "binomial")-> mod_log3

summary(mod_log3)

predict(mod_log3,newdata=test,type="response")->result_log3

head(result_log3)

range(result_log3)

table(test$Churn, result_log3>0.35)


-----------------------------------------------------------------------------------------
#ROCR
  
library(caTools)  

sample.split(customer_churn$Churn,SplitRatio = 0.75)-> split_tag
subset(customer_churn, split_tag==T)->train
subset(customer_churn, split_tag==F)->test




glm(Churn ~ PaymentMethod + TechSupport +  PaperlessBilling + tenure+ MonthlyCharges + InternetService, 
    data=train, family = "binomial")-> mod_log
predict(mod_log,newdata=test,type="response")->result_log
head(result_log)
range(result_log)


library(ROCR)

prediction(result_log,test$Churn) -> predict_log

performance(predict_log,"acc")->acc

plot(acc)

table(test$Churn, result_log>0.41)


#ROC Curve

performance(predict_log,"tpr","fpr") -> roc_curve

plot(roc_curve)

plot(roc_curve, colorize=T,print.cutoffs.at=seq(0.1,by=0.1))

table(test$Churn, result_log>0.28)

