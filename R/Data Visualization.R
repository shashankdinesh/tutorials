#import data to R

customer_churn<-read.csv("Customer_Churn.csv")

#Univariate analysis 

plot(customer_churn$gender)  #categorical

plot(customer_churn$MonthlyCharges)

plot(customer_churn$Dependents)

plot(customer_churn$Dependents, col="green" , ylim=c(0,7000))

plot(customer_churn$Dependents, col=c("skyblue","red") , 
     ylim=c(0,7000),
 xlab="Dependents or not",
 ylab="Customer count",
 main="Customer distribution across Dependents vs Non dependents")

-----------------------

plot(customer_churn$SeniorCitizen) # need to be converted to factor first

customer_churn$SeniorCitizen <- as.factor(customer_churn$SeniorCitizen)

plot(customer_churn$SeniorCitizen)

------

plot(customer_churn$PhoneService)  
plot(customer_churn$PhoneService,col="blue")
plot(customer_churn$PhoneService,col="blue",
xlab="PhoneService",main="Distribution of PhoneService")

--------
plot(customer_churn$Contract)  
plot(customer_churn$Contract,col=c("green","red","blue"),xlab="Contract",main="Distribution of Contract")

---------------------------

#HISTOGRAM  
    
hist(customer_churn$tenure)  

hist(customer_churn$tenure,col="blue")

hist(customer_churn$tenure,col="red", breaks=10)

--------------------------------

hist(customer_churn$tenure)


#Boxplots  

boxplot(customer_churn$MonthlyCharge)

boxplot(customer_churn$MonthlyCharges ~ customer_churn$Churn)

boxplot(customer_churn$MonthlyCharges~customer_churn$Churn, 
        col = c("red","green"))


?boxplot


boxplot(customer_churn$MonthlyCharges~customer_churn$Churn,
        col = c("orange", "yellow"), 
        main = "Distribution of Monthly charges by Customer Churn",
        xlab = "Churn Identifier", 
        ylab = "Total Montly charges")


#Scatterplots

plot(customer_churn$MonthlyCharges~customer_churn$tenure,
     col="blue")

----------------------------------------------------------------------------------

#install.packages("ggplot2")

library(ggplot2)

#Histograms

ggplot(data = customer_churn, 
       aes(x=tenure)) + geom_histogram()


#change number of bins and add color
ggplot(data = customer_churn, aes(x=tenure)) + geom_histogram(bins = 10, #number of breaks/bars
                                                              fill= "green", # Color of bars
                                                              col= "blue") # border



# change fill by churn
ggplot(data=customer_churn,aes(x=tenure,fill=Churn))+ geom_histogram(bins=10,col= "blue")

# Assign partner to aesthetics
ggplot(data = customer_churn, aes(x=tenure, fill=Partner))+geom_histogram(bins = 10,col= "blue")

ggplot(data = customer_churn, aes(x=MonthlyCharges))+geom_histogram(bins = 10,col= "blue")

customer_churn$Tenure_flag <- ifelse(customer_churn$tenure>6, "Old","New")

ggplot(data = customer_churn, aes(x=MonthlyCharges, fill=Tenure_flag))+geom_histogram(bins = 10,col= "blue")


-------------------------
  
#Bar Plots - Categorical
  
ggplot(data = customer_churn,aes(x=gender))+geom_bar()

ggplot(data = customer_churn,aes(x=Dependents))+geom_bar(fill="sky blue",  # color of the bars
                                                         col="black") # border

#Assigning device protection to fill aesthetics
ggplot(data = customer_churn,aes(x=Dependents,fill=Churn))+geom_bar()

#Set position to dodge
ggplot(data = customer_churn,aes(x=Dependents,fill=Churn))+geom_bar(position="dodge")


------------------

#Scatter Plots - visualizing the relationship b/w 2 numerical/categorical variables
#geom_point
  
summary(customer_churn$Charges)
  
  
ggplot(data = customer_churn,aes(y=MonthlyCharges,x=tenure))+geom_point()  

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure))+geom_point(col="blue")

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=Tenure_flag))+geom_point()



ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=InternetService))+geom_point()

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=OnlineSecurity))+geom_point()

-------

#Box Plots  

  
  
ggplot(data = customer_churn,aes(y=MonthlyCharges))+geom_boxplot(fill="green")


ggplot(data = customer_churn,aes(y=MonthlyCharges,x=Churn))+geom_boxplot(fill="green")

    
    
ggplot(data = customer_churn,aes(y=MonthlyCharges,x=Churn, col=InternetService))+geom_boxplot()

------------------------
  
#Box Plots - visualizing the spread of data and derving inferences accordingly
# displays 25th pct, median, 75th pct, min and max
  
ggplot(data = customer_churn,aes(y=MonthlyCharges))+geom_boxplot()  

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=gender))+geom_boxplot()  

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=InternetService))+geom_boxplot()

ggplot(data = customer_churn,aes(y=MonthlyCharges,fill=InternetService))+geom_boxplot()

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=InternetService))+geom_boxplot(fill=c("blue","red","black"))


---------------------------

#Faceting data  

  
g1 <- ggplot(data = customer_churn,aes(x=tenure,fill=Churn))+geom_histogram(bins=10,col="blue") 

g1+facet_grid(~Churn)


#ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=Contract))+geom_point()-> g2

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=Contract))+geom_point()-> g2
g2+facet_grid(~Contract)

----------------------------

ggplot(data =customer_churn,aes(x=tenure,fill = factor(customer_churn$Churn))) + geom_histogram(bins = 10)



#Adding theme layer to visualizations  

#Initial plot    

ggplot(data = customer_churn,aes(x=tenure))+geom_histogram(bins=10,fill="blue", col="white")->g1

# Adding labels

g1 + labs(title = "Distribution of customers by tenure")->g2


#Adding theme or panel background

g2+ theme(panel.background = element_rect(fill = "green"))->g3  

#Adding plot background

g3+theme(plot.background = element_rect(fill = "sky blue"))->g4

#Adjusting title position and color/appearance

g4+theme(plot.title = element_text(hjust = 0.5, face="bold", colour = "black"))



ggplot(data = customer_churn,aes(x=tenure))+geom_histogram(bins=10,fill="blue", col="white") +
  labs(title = "Distribution of customers by tenure") + 
  theme(panel.background = element_rect(fill = "green"), 
      plot.background = element_rect(fill = "sky blue"), 
      plot.title = element_text(hjust = 0.5, face="bold", colour = "black"))

#Adjusting title position and color/appearance

g4+theme()











