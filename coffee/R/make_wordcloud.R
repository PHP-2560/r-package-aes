#' Making a Word Cloud
#'
#' This function allows you to make a word cloud given a .csv file and the number of words for the word cloud.
#' @param file A .csv file
#' @param num_words The number of words in the word cloud, default is 100
#' @keywords wordcloud
#' @export
#' @examples
#' make_wordcloud()
make_wordcloud <- function(file, num_words = 100) {

  source("check_packages.R")
  check_packages(c("tm", "SnowballC", "wordcloud2", "tidytext", "tidyr", "dplyr"))
  
  tweets <- unnest_tokens(readr::read_csv("clean_starbucks_tweets.csv"), word, x)
  words <- tweets %>% count(word, sort=TRUE)
  words <- words %>% anti_join(stop_words)
  wordcloud2(data=words[1:1,], color = "random-light")
  
}
  
