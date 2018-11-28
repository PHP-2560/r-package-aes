
clean_tweets <- function(file) {
  
  library(stringr)
  tweets <- read.csv("coffee_tweets.csv")
  tweets <- select(tweets, text)
  tweets_clean <- gsub("\\d","", tweets[,1])
  tweets_clean <- gsub("\\#", "", tweets[,1]) 
}
