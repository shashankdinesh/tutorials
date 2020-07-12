

#CONDITIONAL STATEMENTS

# If Statement

# if (Condition) { expression }


x<--5


if (x<0) {
  print("x is a negative number")
}  



#Else condition

#else statement, in conjunction with if statement

# if (Condition) { if=TRUE expression } else {
# else expression}



x<-5

if(x<0) {print("x is a negative number")} else {  
  print("x is a positive number")}





#Else if condition

#else if statement, in conjunction with if statement

# if (Condition) { if=TRUE expression } else if (condition) {
#{ else if expression} else { else expression}

#Sequence of execution is very important here 


x<-0


if(x<0) {
  print("x is a negative number")
} else if(x>0) {
  print("x is a positive number")
} else {
  print("x is equal to 0")
}


###############################################################################################################################
###############################################################################################################################



#For Loops

# for ( i in start:end ){ ------> sequence
#           expression       }------> body
#-------------------------------> output 


#Example 1  - Looping over lists

#primes_list<- list(2,3,5,7,11,13,17)


#for (i in 1:length(primes_list)) {
# print(primes_list[[i]]-i)
#}



#Example - Looping over columns of a dataframe

df<-data.frame( A=c(1,2,3,4,5),
                B=c(6,7,8,9,10),
                C=c(11,12,13,14,15),
                D=c(111,120,1003,104,1500))

View(df)


ncol(df)

for (i in 1:4) {
  print(mean(df[[4]]))
}

mean(df[[1]])


df[[4]]




for (i in 1:ncol(df)) {
  print(median(df[[i]]))
}



#is.data.frame(df[1])
#Example - Creating an output using a range of numbers

Storage<-c(1,3,4,6,9)


for (i in 1:length(Storage)) {
  Storage[i]=Storage[i]^2
}

Storage

##########################################################################################################
##########################################################################################################


#WHILE LOOPS

#Similar to if-else condition

# while(condition) {
# expression}


ctr<-1

while(ctr<=10) {
  print(paste("ctr is set to",ctr))
  ctr=ctr+1             # very critical otherwise the code will go into an infinite loop
}


# R in-built functions

#inbuilt Functions

customer_churn <- read.csv("customer_churn.csv",stringsAsFactors = TRUE)   #Reads CSV files



#Change the data type

customer_churn$customerID <- as.character(customer_churn$customerID)

str(customer_churn)   #Structure of the object
 

head(customer_churn)   # Displays top few rows of the object
head(customer_churn,10)

head(customer_churn,2)

tail(customer_churn)  # Displays last few rows of the object
tail(customer_churn,3)
tail(customer_churn,10)



n1<-nrow(customer_churn)  # Number of rows in a dataframe

n2<-ncol(customer_churn)  # Number of columns in a dataframe


# Basic Mathematical Functions

max(c(1,2,3,4,5))

max(customer_churn$MonthlyCharges)

min(c(1,2,3,4,5))

min(customer_churn$MonthlyCharges)

mean(c(1,2,3,4,5))

mean(customer_churn$MonthlyCharges)

median(customer_churn$MonthlyCharges)

range(c(1,2,3,4,5))

range(customer_churn$MonthlyCharges)

sample(1:100,3)

sample(customer_churn$customerID,5)

sample(customer_churn$customerID,20)


table(customer_churn$gender)

table(customer_churn$Churn)


summary(customer_churn)
-------------------------------------------

#CBIND and RBIND
  
student <- data.frame(Name=c("Sam","Bob"),Marks=c(97,25),
                      stringsAsFactors = FALSE) 

student <- rbind(student,c("Anne",75))

------------------

cbind(student,Grade=c("A","C","B"))

-------------------

#JOINING DATASETS
  
Employee<- data.frame(Name=c("Sam","Bob","Anne"),Salary=c(75000,105000,120000),
                      Dep=c("Tech","Sales","Analytics")) 

Department <- data.frame(Department=c("Tech","Analytics","Support"),
                         Location=c("Chicago","New York","Boston")) 


Merged_data <-merge(Employee,Department,by="Dep")  #inner join


Merged_data <-merge(Employee,Department,by.x="Dep",by.y="Department",all.x = TRUE)  #left join


#Merged_data <-merge(Employee,Department,by.x="Dep",by.y="Department")  #inner join

----------------------------------------------------------------------------------------------------

#User-Defined Function


Add_five <- function(x){
    x+5
  }

df$E <- Add_five(df$B)

df

Add_five(3)

Add_five(c(10,15,20))

----------------------------------------------------------------------------------------------------

#DATA MANIPULATION in R  
 
#Process of changing data in order to make in more organized and 
# also to find insights out of the data
# Transform data, ie changing the shape of the data
# Aggregating data
# Summarizing data


#APPLY FAMILY

  #apply()
  #lapply()
  #sapply()
  #tapply()


#apply(object, margin, function,...) 
      #object could be a 2-D object like matrix, dataframe, etc
      #margin specifies the dimension to iterate over , 1=row ; 2=col ; c(1,2) = both rows and colums
      #function could be any specific function like sum, mean



df<-data.frame( Maths=c(51,52,73,84,85),
                Science=c(64,67,82,91,100),
                Arts=c(61,62,73,34,55),
                English=c(61,62,63,94,95))

apply(df,2,max) # max marks in all subjects 

apply(df,1,sum) # sum of marks in all subjects for all student 


apply(df,c(1,2),Add_five) # sum of marks in all subjects for all student 


# Aggregate functions Works on only numeric columns

df_with_name<-data.frame( Name=c("Raj","Seema","Henry","Matt","Ram"),
                Maths=c(51,52,73,84,85),
                Science=c(64,67,82,91,100),
                Arts=c(61,62,73,34,55),
                English=c(61,62,63,94,95))


apply(df_with_name,2,mean) # gives warning and wrong output

apply(df_with_name[,2:5],1,Add_five) # remove character field from data






#lapply(object,function,...)
 
 #object could be vector,list, dataframe, etc
 #function could be any specific function like sum, mean to be applied to each element
 #output is a list
 #operation always done on columns/variables, hence margin not required


lapply(df_with_name[,c(2,3,5)],mean) # returns a list

#Also applicable to vectors

char_v<-c("This","is","a","random","vector")

lapply(char_v,nchar)




#sapply(object,function)

#object could be vector,list, dataframe, etc

#function could be any specific function like sum, mean to be applied to each element

#output is as SIMPLIFIED AS POSSIBLE, so output would be a vector/matrix/list

#operation always done on columns/variables, hence margin not required

View(df)

sapply(df,mean) # returns a vector

#Also applicable to vectors

char_v<-c("This","is","a","random","vector")

lapply(char_v,nchar) # returns a list

sapply(char_v,nchar) # returns a vector


#tapply(x,Index,function,...) , allows functions to be performed to subsets of a vector 


 #x=vector, column of a dataframe, etc to which function is to be applied
 #Index = vector of the same length that contains factors used to subset x (same length as x)

df_with_name<-data.frame( Name=c("Raj","Seema","Henry","Matt","Ram"),
                          Gender=c("M","F","M","M","M"),
                          Maths=c(51,52,73,84,85),
                          Science=c(64,67,82,91,100),
                          Arts=c(61,62,73,34,55),
                          English=c(61,62,63,94,95))


tapply(df_with_name$Maths,df_with_name$Gender,max)
 

for (i in 3:ncol(df_with_name)) {
print(tapply(df_with_name[[i]],df_with_name$Gender,max))
}


----------------------------------------------------------------------------------------------------

install.packages("dplyr")  
  
#Data Manipulation with dplyr

 #filter - It filters the data based on a condition
 #select - It is used to select columns of interest from a data set
 #arrange - It is used to arrange data set values on ascending or descending order
 #mutate - It is used to create new variables from existing variables
 #summarise (with group_by) - It is used to perform analysis by commonly used operations such as min, max, mean count etc
  
#You can create complex chain commands using these 5 verbs.
 


install.packages("dplyr")
library(dplyr)


data()  
mynewdata <- mtcars
myirisdata <- iris

View(myirisdata)

?mtcars
?iris

data(mtcars)
str(mtcars)
mynewdata <- mtcars
View(mynewdata)

#read data
head(mynewdata)
head(myirisdata)


#filter(mynewdata, cyl > 4)

#use filter to filter data with required condition

filter(mynewdata, cyl > 4)
filter(mynewdata, cyl > 4 & gear > 4 )  #AND
filter(mynewdata, cyl > 4 | gear > 4 ) #OR 

filter(myirisdata, Species %in% c('setosa','virginica'))
#filter(myirisdata, Species %like% c('setosa','virginica'))

filter(myirisdata, Species == 'setosa')

#use select to pick columns by name

select(mynewdata, cyl,mpg,hp)

#here you can use (-) to hide columns

select(mynewdata, -cyl, -mpg ) 

#select series of columns

select(mynewdata, mpg:hp)

#chaining or pipelining - a way to perform multiple operations in one line of code
  
  mynewdata %>%
  select(wt,cyl,gear) %>%
  filter(wt > 2)


#arrange can be used to reorder rows

mynewdata%>%
  select(cyl, gear,wt)%>%
  filter(wt > 4)%>%
  arrange(desc(gear,wt))

#or in descending order

mynewdata%>%
  select(cyl, wt, gear)%>%
  arrange(desc(wt,gear))


#mutate - create new variables

mynewdata %>%
  select(mpg, cyl)%>%
  mutate(mpgr = cyl*mpg)


mynewdata %>%
  select(mpg, cyl)%>%
  mutate(mpg = cyl*mpg)


#If you want to store the new variable as part of the dataframe

mynewdata_2 <- mynewdata %>% mutate(newvariable = mpg*cyl)


#summarise - this is used to aggregate the data and find insights from it

myirisdata%>%
  summarise(Average = mean(Sepal.Length))

# summarise using group by

myirisdata%>%
  group_by(Species)%>%
  summarise(Average = mean(Sepal.Length, na.rm = TRUE))


x<-
myirisdata%>%
  group_by(Species)%>%
  summarise_each(lst(mean, sum), Sepal.Length, Petal.Length) 
  
#you can rename the variables using rename command

mynewdata %>% rename(miles = mpg)

