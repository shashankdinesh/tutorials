
#K-means clustering algorithm


require("datasets")
data("iris") # load Iris Dataset
str(iris) #view structure of dataset

#iris$Sepal.Length<-as.integer(iris$Sepal.Length)
#iris$Sepal.Length<-iris$Sepal.Length+1.8

summary(iris) #view statistical summary of dataset


head(iris) #view top  rows of dataset


# Preprocess the dataset
#Since clustering is a type of Unsupervised Learning, 
#we would not require Class Label(output) during execution of our algorithm. 
#We will, therefore, remove Class Attribute "Species" and store it in another variable. 

iris.new<- iris[,c(1,2,3,4)]

iris.class<- iris[,"Species"]  #stores the label of dataset


head(iris.new)

#We would then normalize the attributes between 0 and 1 using our own function.

normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

iris.new$Sepal.Length<- normalize(iris.new$Sepal.Length)
iris.new$Sepal.Width<- normalize(iris.new$Sepal.Width)
iris.new$Petal.Length<- normalize(iris.new$Petal.Length)
iris.new$Petal.Width<- normalize(iris.new$Petal.Width)


head(iris.new)

#Finding the optimimum number of clusters 

#set.seed(200)

k.max <- 20


wss <- sapply(1:k.max,function(k){kmeans(iris.new[,1:4],k,nstart = 20,iter.max = 20)$tot.withinss})

wss

plot(1:k.max,wss, type= "b", xlab = "Number of clusters(k)", ylab = "Within cluster sum of squares")


#K=3

set.seed(200)

# Apply k-means clustering algorithm

result <- kmeans(iris.new,3) #aplly k-means algorithm with no. of centroids(k)=3

result$size # gives no. of records in each cluster

result$centers # gives value of cluster center datapoint value(3 centers for k=3)

result$cluster #gives cluster vector showing the custer where each record falls

#Verify results of clustering

par(mfrow=c(1,2)) #fitting multiple plots in a view

plot(iris.new[c(1,2)], col=result$cluster)# Plot to see how Sepal.Length and Sepal.Width data points have been distributed in clusters
plot(iris.new[c(1,2)], col=iris.class)# Plot to see how Sepal.Length and Sepal.Width data points have been distributed originally as per "class" attribute in dataset

plot(iris.new[c(3,4)], col=result$cluster)# Plot to see how Petal.Length and Petal.Width data points have been distributed in clusters
plot(iris.new[c(3,4)], col=iris.class)


table(result$cluster,iris.class) #Result of table shows that Cluster 1 corresponds to Virginica, Cluster 2 corresponds to Versicolor and Cluster 3 to Setosa.

iris.new<-cbind(iris.new,result$cluster)

iris.new$`result$cluster`<-as.factor( iris.new$`result$cluster`)

iris.new<-cbind(iris.new,iris.class)



library(ggplot2)
require(gridExtra)

plot1 <- ggplot(iris.new,aes(x = Sepal.Length, y = Sepal.Width, col= `result$cluster`)) + geom_point()
plot2 <- ggplot(iris.new,aes(x = Sepal.Length, y = Sepal.Width, col= iris.class)) + geom_point()


plot3 <- ggplot(iris.new,aes(x = Petal.Length, y = Petal.Width, col= `result$cluster`)) + geom_point()
plot4 <- ggplot(iris,aes(x = Petal.Length, y = Petal.Width, col= Species)) + geom_point()

grid.arrange(plot3, plot4, ncol=2)


grid.arrange(plot1, plot2,plot3, plot4, nrow=4)

