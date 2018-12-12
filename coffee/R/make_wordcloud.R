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
  library(wordcloud)
  words <- read.csv(file)
  corpus <- Corpus(VectorSource(words$x))
  words <- tm_map(corpus, removeWords, stopwords("english"))
  wordcloud(words, max.words = num_words, random.order = FALSE, random.color=FALSE)
}

