
library("dplyr")
library("tidyr")
library("DT")
library("Matrix")
library("recommenderlab")

#?methods

books<-read.csv("books.csv")
ratings<-read.csv("ratings_1.csv")

dimension_names<-list(user_id=sort(unique(ratings$user_id)),
                      book_id=sort(unique(ratings$book_id)))


rating_mat<-spread(ratings,book_id,rating)

head(rating_mat,1)

rating_mat<-select(rating_mat,-user_id)  # remove user id field from rating_mat object

head(rating_mat,1)

class(rating_mat)

rating_mat<-as.matrix(rating_mat) # convert to matrix

class(rating_mat)

rating_mat[1:10,1:10]

dimnames(rating_mat)<-dimension_names 

rating_mat[1:10,1:10]

dim(rating_mat)  #all rows represented by user id and all columns represented by book id


--------------------------------------------------------------------------
  
#Converting the rating matrix into a real rating matrix

rating_mat0<-rating_mat

dim(rating_mat0)

rating_mat0[is.na(rating_mat0)]<-0

rating_mat0[1:10,1:10]

sparse_ratings<-as(rating_mat0,"sparseMatrix") # saves space and compresses data

sparse_ratings[1:5,1:5]

#Last part of out transformation

real_ratings<-new("realRatingMatrix", data=sparse_ratings)

real_ratings[1:10,1:10]

#----------------------------------------------------------#

#Split data into train and test data : 80:20 split

split_tag<- sample(c(T,F),size=nrow(real_ratings),replace=T, prob = c(0.8,0.2))

recc_train<-real_ratings[split_tag,] 

recc_test<-real_ratings[!split_tag,] 


------------------------------------------------------------------------------------
  
#Building the ubcf model
  
Recommender(data = recc_train, method="UBCF")->recc_model_ubcf

n_recommended_ubcf<-6

recc_predicted_ubcf<-predict(object=recc_model_ubcf,newdata=recc_test,n=n_recommended_ubcf)

#Recommending books for user no 1

recc_predicted_ubcf@items

recc_predicted_ubcf@items[[1]]->user1_book_numbers

#Extracting book labels for predicted model

recc_predicted_ubcf@itemLabels[user1_book_numbers]

books %>% filter(book_id==80) %>% select(title,authors)
books %>% filter(book_id==125) %>% select(title,authors)
books %>% filter(book_id==4862) %>% select(title,authors)
books %>% filter(book_id==130) %>% select(title,authors)
books %>% filter(book_id==6772) %>% select(title,authors)
books %>% filter(book_id==162) %>% select(title,authors)
#Recommending books for user no 6

recc_predicted_ubcf@items[[6]]->user6_book_numbers

#Extracting book labels for predicted model

recc_predicted_ubcf@itemLabels[user6_book_numbers]

books %>% filter(book_id==4) %>% select(title,authors)
books %>% filter(book_id==216) %>% select(title,authors)
books %>% filter(book_id==9) %>% select(title,authors)





#Building item based collaborative filtering model
-----------------------------------------------------------------------
  
Recommender(data = recc_train,method="IBCF")->recc_model_ibcf
n_recommended_ibcf<-6
predict(object=recc_model_ibcf,newdata=recc_test,n=n_recommended_ibcf)->recc_predicted_ibcf

recc_predicted_ibcf@items[[1]]->user1_book_numbers
recc_predicted_ibcf@itemLabels[user1_book_numbers]

recc_predicted_ibcf@items[[5]]->user5_movie_numbers
recc_predicted_ibcf@itemLabels[user5_movie_numbers]

