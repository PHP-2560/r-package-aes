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
  library(tm)
  library(SnowballC)
  library(wordcloud2)
  tweets <- unnest_tokens(readr::read_csv(file), word, x)
  words <- tweets %>% count(word, sort=TRUE)
  words <- words %>% anti_join(stop_words)
  wordcloud2(data=words[0:num_words,], color = "random-light")
  
}
  
