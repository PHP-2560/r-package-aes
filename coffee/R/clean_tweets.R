
clean_tweets <- function(file) {
  
  library(stringr)
  tweets <- read.csv(file)
  tweets <- select(tweets, text)
  #Remove numbers
  tweets_clean <- gsub("\\d","", tweets[,1])
  #Remove hashtags
  tweets_clean <- gsub("\\#", "", tweets_clean) 
  #Remove urls
  tweets_clean <- gsub("https(.*)*$", "", tweets_clean)
  #Remove "RT"
  tweets_clean <- gsub("RT ", "", tweets_clean)
  #Remove twitter usernames because they begin with @
  tweets_clean <- gsub("@\\w+ *", "", tweets_clean)
  #Remove punctuation
  tweets_clean <- gsub("[[:punct:]]", "", tweets_clean) 
  #Remove emojis
  tweets_clean <- iconv(tweets_clean, "latin1", "ASCII", sub="") 
  #Remove new line
  tweets_clean <- gsub("\\n", "", tweets_clean)
  #Lower case
  tweets_clean <- tolower(tweets_clean)
  #Remove leading whitespace
  tweets_clean <- str_trim(tweets_clean, "left")
  #Remove trailing whitespace
  tweets_clean <- str_trim(tweets_clean, "right")
  
  write.csv(tweets_clean, paste("clean_", file, sep = ""))
}
