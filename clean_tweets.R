
clean_tweets <- function(file) {
  
  library(stringr)
  tweets <- read.csv("coffee_tweets.csv")
  tweets <- select(tweets, text)
  tweets_clean <- gsub("\\d","", tweets[,1])
  tweets_clean <- gsub("\\#", "", tweets_clean) 
  tweets_clean <- gsub("https(.*)*$", "", tweets_clean)
  #Remove mentions here
  #Remove "RT"
  
  tweets_clean <- gsub("[[:punct:]]", "", tweets_clean) 
  tweets_clean <- iconv(tweets_clean, "latin1", "ASCII", sub="") 
  tweets_clean <- gsub("\\n", "", tweets_clean) 
  tweets_clean <- tolower(tweets_clean)

}
