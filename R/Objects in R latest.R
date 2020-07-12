# 
# Drawn_suits <- c("hearts", "spades", "diamonds","clubs")
# 
# class(Drawn_suits)
# 
# is.vector(Drawn_suits)



# CREATING VECTORS
# 
#  ## Sequence of data elements with same data type
#  ## Same basic data type
#  ## could be numeric, character, logical and others

#Function name -> c()

# Creating a character vector and assign to variable

Drawn_suits <- c("1"="hearts","2"="spades","3"="diamonds","4"="spades","5"="clubs")


#Check if vector

is.vector(Drawn_suits)

#type of vector

class(Drawn_suits)

length(Drawn_suits)


#Creating a numeric vector and different ways of assigning names to each entity


#1

remain_1<-c(12,11,12,12)

names(remain_1)<-c("hearts","spades","diamonds","clubs")

class(remain_1)


#2

remain_2<-c(12,11,12,12) 

suits<-c("hearts","spades","diamonds","clubs")

names(remain_2)<-suits

remain_2


#3

remain_3<-c("hearts"=12,
            "spades"=11,
            "diamonds"=12,
            "clubs"=12)

class(remain_3)

#Structure of vector

str(remain_1)


# How to check the length of the vector

length(Drawn_suits)

#Extract element based on index

Drawn_suits[2]

remain_1[2:3]

#Vectors are homogeneous and hence are also called atomic vectors
#Only elements of same data type
#If trying to insert more than 1 data type, leads to coersion
#Coersion is automatic

Coerced_vector <-c(1,2,3,4,5,2+3i,"A","B","C")

Coerced_vector

class(Coerced_vector)


#WRAP UP

 #Use function c for creating vectors
 #Can only store 1 data type
 #Automatic coersion when trying to insert more data types
 #Use lists for storing elements of different data types


###################################################################################################
###################################################################################################


#MATRIX

 ##MATRIX IS A 2D array of elements
 ##Data stored in rows and columns
 ##Only one vector type


 
#CREATING Matrix

#Function name - matrix(), 
#needs at least one matrix dimenstion in the arguments in the form of nrow and ncol

?matrix


mat_example <- matrix(1:6,nrow=2)

mat_example


x_matrix<-matrix(1:6,ncol=2)

x_matrix

#By default data filled in columns but you can change the sequence of fill

matrix(1:6,nrow=2,byrow=TRUE)

matrix(1:9,nrow=3,byrow=TRUE)


matrix(1:9,nrow=3,byrow=TRUE)


mat <- matrix(1:6, ncol=6, nrow=6) 


###RBIND and CBIND


x<-matrix(1:9, ncol = 2, byrow = TRUE)

x

m_rbind<-rbind(1:3,4:6)# binding data one below the other, rows

m_rbind

m_cbind<-cbind(1:3,4:6) # binding data next to each other, columns

m_cbind

#Extending matrices using rbind and cbind

m<-matrix(1:6,nrow=2,byrow=TRUE)

m

m_rbind <-rbind(m,7:9)

m_cbind <-cbind(m,7:8)


#Naming a matrix , use of functions rownames() and colnames() for naming rows and columns


m<-matrix(1:6,nrow=2,byrow=TRUE)

m

rownames(m)<-c("row1","row2")

colnames(m)<-c("col1","col2","col3")

m

#names while creating matrix itself

m1<-matrix(1:10,nrow=2,byrow=TRUE,
           dimnames = list(c("row1","row2"),
                           c("col1","col2","col3","col4","col5")))

m1


#CO-ERSION IN MATRICES, as it is homogeneous object

num_mx <-matrix(1:10,nrow=2,byrow=TRUE)

char_mx<-matrix(c("A","B","C","D","E","F"),nrow=2)

new_mx <- cbind(num_mx,char_mx)

class(new_mx)


#Subsetting matrices

num_mx

num_mx[2,3] # subset element

num_mx[1,] # subset row  

num_mx[,2] # subset col

num_mx[2] #subset using sequence

num_mx[c(1,2),c(1,3)] #subsetting in the form of matrix


m1

m1["row1",] #subsetting using dimnames

m1[,"col1"] #subsetting using dimnames

m1[c("row1","row2"),"col1"] #subsetting using dimnames

###############################################################################################################
###############################################################################################################


#######################################################################################################
#######################################################################################################

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


#######################################################################
#CREATING LISTS

#Function name -> list()

#Song details

list("My name is Sheela",190,5)

#Vector - leads to co-ersion
c("My name is Sheela",190,5)


#Store list

Song<-list("My name is Sheela",190,5)

#Validate type
is.list(Song)

#Assigning names to each element in list
names(Song)<-c("Track_title","Duration","Track_no")

Song

#Creating lists directly with name
My_Song <- list(Track_title="My name in Sheela",
                Duration=195,
                Track_no=5)


#Song$Track_title

#Structure of lists

str(My_Song)

#Storing lists within lists

All_Songs<-list(Track_title="Despacito",
                Duration=105,
                Track_no=6,
                Another_song=Song)

str(All_Songs)


#Subsetting lists and extracting items from list

x<-All_Songs[2] # Returns a list, this is a subsetting action

#class(All_Songs[2])

y<-All_Songs[[2]] # Returns an element

#Extracting elements within lists enclosed in lists

All_Songs[[4]]

All_Songs[[4]][[1]]


#Extracting elements using names - only possible for named lists

x<-All_Songs["Track_title"] # Returns list

x

x2<-All_Songs[["Track_title"]] # Returns element

class(x2)

#Updating values in lists
All_Songs[["Another_song"]][["Duration"]] <-120

#Extract names using dollar sign
All_Songs$Track_title

#Add new elments to list using dollar sign
All_Songs$Likes <-c("Arnold","Mahesh")

str(All_Songs)


#WRAP UP

# How to use single vs double square brackets to extract items from lists
## [[ for selecting elements out of lists
## [ results in subsetting of lists

# [[ and $ to subset and extend lists

#########################################################



#CREATING DATAFRAME

 #USUALLY DONE BY IMPORTING DATA from - Flat files, Import from data source, Relational data base,
 #or software packages like Excel, SPSS, etc


 #function to manually create ->  data.frame()

#CREATE DATAFRAME FROM FILE

data_var <- read.csv("Data for variables.csv")

head(data_var)

is.data.frame(data_var)



x<-c("Anna","Harry","Michelle","Pete","Frank") #char
y<-c(20,25,29,31,23) #num
z<-c(FALSE, FALSE,TRUE, TRUE, FALSE) #logical

#Create data frames and assign names directly

df<-data.frame(Name=x, Age=y, Kids_or_not=z)

View(df)

#Dataframe Structure

str(df)


# Creating dataframes in R, comining vectors of same length is critical, see example below

name<-c("Anna","Harry","Michelle","Frank")

age<-c(20,25,29,31,23)

parent<-c(FALSE, FALSE,TRUE, TRUE,FALSE)

df<-data.frame(Name=name, Age=age, Kids=parent,stringsAsFactors = FALSE)

#Correcting the length of the vector

name<-c("Anna","Harry","Michelle","Frank","Detroit")

df<-data.frame(Name=name, Age=age, Kids=parent,stringsAsFactors = FALSE)

str(df)



#Extract, Extend, Sort Dataframes


#By names - extracts vector

df$Age

df$Kids



#By names - extracts dataframe


df["Age"]

df["Name"]


#By index


df[1:2,]




df[1,2] # extracting row 1 column 2 entry

df[1,] #extracting row 1



df[1:5,] #extracting all rows from 1:5




df[,2] # extracting column 2


#By using [ ] and [[]] 


df[1] #extracts dataframe

df[[1]]  #extracts vector

head(df)

tail(df)


str(df)

#Extend dataframes 
    # Add columns = add more variables
    # Add rows = add more observations


#Add Columns



df$Height <-c(120,123,133,150,178)

View(df)

df["Height_2"]<-c(120,123,133,150,178)

df

x<-colnames(df)

#Append rows to data



x1<-data.frame(Age=20,Name="Aka",Kids=FALSE,Height=125)





df<-rbind(df,x1)

df$Height_inch <- df$Height/2.5


#Deleting columns


df$Height_2<-NULL


df
#df$Height_2<-NULL

df["Height"] <- NULL


x<-3

#Using cbind and rbind


Weight<-c(80,63,73,50,78,90)

df<-cbind(df,Weight)


#Add rows using rbind

new_person <- data.frame("Ram",22,FALSE,121,42)
  
df<-rbind(df,new_person)

new_person <- data.frame(Name="Ram",Age=NA,Kids = FALSE,Height = 121,Height_inch=42)

df<-rbind(df,new_person)



df[2,2]=NA


df[2]<-NULL

#df[2,]=NULL

#Sort Dataframes by specific columns

#Function name = Order


df[order(df$Age),]



#In descending order

df[order(df$Age,decreasing=TRUE),]

df[order(df$Age,decreasing=TRUE),]


#Create dataframes -> data.frame ,import data using read.csv
#Extract information using $ sign, using indices
#Extend and Truncate
#Sort dataframes



