# Reading the data file

mydata<-read.csv("Cosmetics.csv",header=T)


colnames(mydata)[1]<-"Bag"

# Finding association rules

install.packages("arules")

library(arules)

rules <- apriori(mydata)

summary(rules)
 
# Rules with specified parameter valus


rules <- apriori(mydata,parameter = list(minlen=2, maxlen=3,supp=0.2, conf=0.8))

inspect(rules) 

summary(mydata)


# Finding interesting rules-1

rules <- apriori(mydata,parameter = list(minlen=2, maxlen=3,supp=.01, conf=.6),
                 appearance=list(rhs=c("Foundation=Yes"),
                                 default="lhs"))

summary(mydata)

inspect(rules)


# Finding interesting rules-2

rules <- apriori(mydata,parameter = list(minlen=2, maxlen=3,supp=.05, conf=.6),
                 appearance=list(rhs=c("Foundation=Yes"),
                                 lhs=c("Bag=Yes", "Blush=Yes", "Nail.Polish=Yes", "Brushes=Yes", "Concealer=Yes", 
                                       "Eyebrow.Pencils=Yes", "Bronzer=Yes", "Lip.liner=Yes", "Mascara=Yes", 
                                       "Eye.Shadow=Yes","Lip.Gloss=Yes", "Lipstick=Yes", "Eyeliner=Yes"),
                                 default="none"))


summary(rules)

inspect(rules)
quality(rules) <-round(quality(rules),digits=3)
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)


# Graphs and Charts


install.packages("arulesViz")
library(arulesViz)

plot(rules.sorted)

plot(rules.sorted,method="grouped")

plot(rules.sorted,method="graph",control=list(type="items"))

