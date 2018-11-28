
clean_tweets <- function(file) {
  
  library(stringr)
  tweets <- read.csv("coffee_tweets.csv")
  tweets <- tweets %>% 
    filter(isRetweet == FALSE) %>%
    select(text)
  tweets_clean <- gsub("\\d","", tweets)
}
