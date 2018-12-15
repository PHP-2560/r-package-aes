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
  
  #Plot wordcloud of one word
  if (num_words == 1){
    words <- read.csv(file)
    corpus <- Corpus(VectorSource(words$x))
    words <- tm_map(corpus, removeWords, stopwords("english"))
    wordcloud(words, max.words = num_words, random.order = FALSE, random.color=FALSE, scale = c(4,0.5))
  } else {
    tweets <- unnest_tokens(readr::read_csv(file), word, x)
    words1 <- tweets %>% count(word, sort=TRUE)
    words1 <- words1 %>% anti_join(stop_words)
    wordcloud2(data=words1[0:num_words,], color = "random-light")
  }
}
  
