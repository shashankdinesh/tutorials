
# CREATING VECTORS
# 
#  ## Sequence of data elements with same data type
#  ## Same basic data type
#  ## could be numeric, character, logical and others


#Function name -> c()

num1<- c(1,2,3,4,5)

num2<-c(10:20)

char1<-c("a","b","c")

char2<-c("this","is","sparta")

my_log1<-c(TRUE,FALSE,TRUE,FALSE)

my_log2<-c(T,F,T,F)

class(num1)

class(char2)

is.vector(char1)

#Length of vector

length(num2)

length(char1)

#Check whether vector or not

is.vector(char1)

class(char1)

#Extracting elements out of a vector

char2[2:3]
num2[c(1,3,7,11)]

num2<-as.character(num2)

#Missing values in a vector

random_vec<-c(NA,6,7,8,NA,NA)

is.na(random_vec)

ifelse(is.na(random_vec),0,random_vec)

--------------------
  #Vectors are homogeneous and hence are also called atomic vectors
  #Only elements of same data type
  #If trying to insert more than 1 data type, leads to coersion
  #Coersion is automatic
  
Coerced_vector <-c(1,2,3,4,5,2+3i,"A","B","C")

Coerced_vector

class(Coerced_vector)

num2<- c(1,2,3,4)

num2<- as.character(num2)
class(num2)


---------------------------

#Creating Matrix
  
#MATRIX IS A 2D array of elements
#Data stored in rows and columns
#Only one vector type

#Function name - matrix(), 
#needs at least one matrix dimenstion in the arguments in the form of nrow and ncol

  
mat1<-matrix(c(1,2,3,4,5,6),nrow=2)

mat1<-matrix(c(1,2,3,4,5,6),ncol=2)

mat1<-matrix(1:100,nrow=10)

mat2<-matrix(1:100,nrow=10,byrow=TRUE)

mat1+mat2


mat2<-matrix(c(1,2,3,4,5,6),nrow=2,byrow = TRUE)

mat2<-matrix(c("a","b","c","d","e","GTFD"),nrow=2,byrow = T)

mat2

mat3<-matrix(c(T,F,T,F),nrow=2,byrow = T)

mat3

d<-matrix(1:100,nrow=10)



#Extracting information from matrix


#matrix_name[row index:column index]

mat_big[1:5,1:5]

mat_big[1:5,]

mat1

#mat2<-matrix(1:20,21:34,nrow=5)

mat_big<-NULL

#outputs all values in 10th row

mat1[,1] #outputs all values in 1st column

mat1[2,1] #output value corressponding to 2nd row and 1st column

mat_big[1:5,2:4]

matrix(c(1+2i,3+5i,5+6i,6+3i),nrow=2)

#Transposing matrix - convert row in column and column to row

mat_big

t(mat_big)


# cbind and rbind

mat_big1<-mat_big

cbind(mat_big,mat_big1)

cbind(mat_big,111:120)


mat_big1<-NULL

# Calculation on rows and columns of matrix

max(mat_big)

mean(mat1)

----------------------------

#DATAFRAME
  
  ##Dataframe enables us to work with datasets filled with observations
  ##Example : Dataset of people and their physical attributes 
  # each person=observation
  # properties/attributes = variables
  
#Matrix? , No why?
  
#DATAFRAME - fundamental object to store datasets
# similar to matrix but it is heterogeneous
# Rows => Observation (person name)
# Columns => Variables (age, weight, etc)
# Heterogeneous wrt rows, but within 1 column; 
# it supports only 1 data type -> Elements in same column- same type



#USUALLY DONE BY IMPORTING DATA from - Flat files, Import from data source, Relational data base,
#or software packages like Excel, SPSS, etc

#csinsights filmfafe
#cmot filmfare

#function to manually create ->  data.frame()

install.packages("readxl")
library(readxl)

#CREATE DATAFRAME FROM FILE

customer_churn <- read.csv("Customer_Churn.csv")

#data<-read_xlsx("Status.xlsx",sheet="Sheet1")

?read_xls

View(customer_churn)

head(customer_churn,10)

is.data.frame(customer_churn)

cust_churn<-read.csv("C:/Users/Harish/Desktop/New folder/Customer_Churn.csv")

#customer_Churn<-read.csv("C:/Users/Krishanmohan Y/Desktop/Customer_Churn.csv")

Customer_Churn <- read.csv("C:\\Users\\lenova\\Desktop\\Customer_Churn.csv")


x<-c("Anna Clinton","Harry","Michelle","Pete","Frank") #char

y<-c(20,25,29,31,23) #num

z<-c(FALSE, FALSE,TRUE, TRUE, FALSE) #logical


#Create data frames and assign names directly

df<-data.frame(Name=x, 
               Age=y, 
               Kids=z, 
               stringsAsFactors = F)
View(df)

#Dataframe Structure

is.data.frame(df)

str(df)

# Extract, Extend, Sort Dataframes

#By names - extracts vector

df$Age

df$Age

df$Kids

#By names - extracts dataframe

is.data.frame(df$Kids)
is.data.frame(df["Kids"])


df[2,3] <-NA

df[c("Age","Name")]
   
df["Name"]

df[is.na(df)]<-

  
#By index

df[3:5,1:2]


df[1,] #extracting row 1
df[1:3,1:2] # extracting row 1 & 2

df[,2:3] # extracting column 2
df[1,2] # extracting row 1 column 2 entry
df[1:5,] #extracting all rows from 1:5


#By using [ ] and [[]] 

df[1:2]#extracts dataframe

df[1] # extracts dataframe

is.vector(df[[1]]) #extracts vector


#Extend dataframes 
# Add columns = add more variables
# Add rows = add more observations

#Add Columns

df

df$Height_cm <-c(120,123,133,150,178)

Weight_kg<-c(80,63,73,50,78)

df<-cbind(df,Weight_kg)


df$Height_in_cm <- df$Height/2.5


#Add rows using rbind


new_person <- data.frame(Name="Ram",
                         Age=NA,
                         Kids = FALSE,
                         Height_cm = 121)

df<-rbind(df,new_person)

df["Kids"]<-NULL
df[1,2]<-TRUE



#Sort Dataframes by specific columns

#Function name = Order

df[order(df$Height),]

#In descending order

df<-df[order(df$Age,decreasing=TRUE),]

df[order(c(df$Height,df$Name),decreasing=TRUE),]

df<-df[1:4,]

----------------------------------------

  
#List  - function => list
  
my_list1<-list(1,"a",TRUE)

str(my_list1)

my_list1[[2]]


my_list2<-list(c(1,c(2,3)),
               title = c("a"),
               hit_or_not=c(TRUE,FALSE))

my_list2[[1]][2]


str(my_list2)




my_list2[[3]]


my_list2[[3]][2]

Fruit_list <- list(Apple = 85, Banana = 45, Guava = 100)
Fruit_list$Apple  



  
#Decision Making


#if(Condition){Execution statment}

x<-100
y<-195

    if(x>y){
    print("100 is GREATER than 95")
  }

------------
  
  if(x<y){
    print("x is less than y")
  }else{print("x is not less than y")}

-----------
#nested if
  
x=100
y=100
  
    if(x<y){
    print("x is less than y")
  }else if (x>y){
    print("x is greater than y")
  }else{
    print("x is equal to y")
  }

-----------------------------
#Looping

a<-1:15


for(i in seq(0, 9, 3)){
  print(a[i]^2)
  }

# i gets incremented by steps of 1, default

------------

  
i=1

while (i<=10) {
  print(i+2)
  i<-i+1
}

--------s
#inbuilt Functions

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = F)

?sample

sample(customer_churn,10)
sample_n(customer_churn,4)
sample_frac(customer_churn,.9)

str(customer_churn)

# SHOWS THE TOP 6 ROWS OF YOUR DATAFRAME

head(customer_churn)

head(customer_churn,10)
head(customer_churn,2)

tail(customer_churn)
tail(customer_churn,3)
tail(customer_churn,10)




for (i in 1:nrow(customer_churn)){
  customer_churn$TotalCharges[i]*2.5
}


ncol(customer_churn)

-
  
max(c(1,2,3,4,5))
max(customer_churn$MonthlyCharges)

min(c(1,2,3,4,5))

min(customer_churn$MonthlyCharges)

mean(c(1,2,3,4,5))

mean(customer_churn$MonthlyCharges)

range(c(1,2,3,4,5))

range(customer_churn$MonthlyCharges)

summary(customer_churn$MonthlyCharges)
summary(customer_churn)


sample(1:100,3)
sample(customer_churn$customerID,5)


sample(customer_churn$customerID,5)

table(customer_churn$gender)
table(customer_churn$InternetService)
-------------------------------------------
data.frame(Name=c("Sam","Bob"),Marks=c(97,25)) -> student  
as.character(student$Name) -> student$Name
rbind(student,c("Anne",75))
---------------
data.frame(Name=c("Sam","Bob"),Marks=c(97,25)) -> student  
as.character(student$Name) -> student$Name
cbind(student,Grade=c("A","C"))

