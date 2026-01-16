#importing the data from an excel file
movies <- read.csv("C:/Users/djoza/Downloads/UCI_Data_Sets/UCI_Data_Sets/Movies/movies.csv")

#get a glimpse of the data, first 6 rows
head(movies)

#syntax: data[row, column]. If you leave one blank, it takes all of them 

#Get the indexes in column 4 (gross earnings) that are over 100000
which(movies[,4] > 100000)

#Get the rows where it's column 4 (gross earnings) are over 100000
movies[which(movies[,4]>100000), 1]

#This looks ugly asf 
plot(movies)

#plot all rows with columns 4-9
plot(movies[, 4:9])

#Model 1----

#Relationship between Gross (y) and and Views/Likes/Dislikes/Comments
#More interaction should result in a higher gross profit, a positive relationship

#m1.[insert predictor]1-3 go in the order of linear, squared, then rational
##Views----
m1.views <- lm(Gross ~ Views, data=movies) 
plot(m1.views)
summary(m1.views)
AIC(m1.views)

##Likes ----
m1.likes <- lm(Gross~Likes, data=movies) #linear
plot(m1.likes)
summary(m1.likes)
AIC(m1.likes)

m1.likes2 <- lm(Gross ~ Likes + I(Likes^2), data=movies) #quadratic
plot(m1.likes2)
summary(m1.likes2)
AIC(m1.likes2)


##Dislikes----
m1.dislikes <- lm(Gross~Dislikes, data=movies) #linear
plot(m1.dislikes)
summary(m1.dislikes)
AIC(m1.dislikes)


##commments----
m1.comments <- lm(Gross ~ Comments, data = movies) # linear
plot(m1.comments)
summary(m1.comments)
AIC(m1.comments)

m1.comments2 <- lm(Gross ~ Comments + I(Comments^2), data = movies) # quadratic
plot(m1.comments2)
summary(m1.comments2)
AIC(m1.comments2)



#The highest r^2 and lowest AIC was from views
m1 <- m1.views


#Best r^2 and AIC goes to the model with Views and Gross
plot(movies$Views, movies$Gross)
abline(m1.views, col="blue")

#

#Creating legend
legend("topright", # where to draw the legend
       c("Linear"), # line names
       lty=c(1),  # just leave this as 1 for each line you're drawing)
       lwd=c(2),  #line width
       col=c("blue") # colors of lines
)


#Model 2----

#Check if all of the predictors together would work 

#None of the predictors have any actual significance
#Also produces NaN when plotting Residuals vs Leverage which causes
#an error
#Mfw the model isn't good: 
m2.all <- lm(Gross ~ Views + Likes + I(Likes^2)
             + Dislikes + Comments + I(Comments^2), data=movies)
plot(m2.all)
summary(m2.all)
AIC(m2.all)

#Using fewer predictors, using the predictors with the best 
#r^2 and AIC from model 1


#Works, but results suck and predictors have no significance
m2.viewsComments <- lm(Gross ~ Views + Comments + I(Comments^2), data=movies)
plot(m2.viewsComments)
summary(m2.viewsComments)
AIC(m2.viewsComments)

#Trying interaction, but it results in an error when plotting
#summary() results are bad as well 
m2.viewsComments2 <- lm(Gross ~ Views*I(Comments^2), data=movies)
plot(m2.viewsComments2)
summary(m2.viewsComments2)
AIC(m2.viewsComments2)

#Might be better to look for other things 
#Budget and Ratings seems to have a relationship
m2.ratingsBudget <- lm(Gross ~ Ratings + Budget, data=movies)
plot(m2.ratingsBudget)
summary(m2.ratingsBudget)
AIC(m2.ratingsBudget)

#Ratings*Budget is very significant and produces better results
m2.ratingsBudget2 <- lm(Gross ~ Ratings*Budget, data=movies)
plot(m2.ratingsBudget2)
summary(m2.ratingsBudget2)
AIC(m2.ratingsBudget2)

#Ratings*Budget is probably the best one since it has the best
#r^2 and AIC
m2<- m2.ratingsBudget2



plot(movies)
