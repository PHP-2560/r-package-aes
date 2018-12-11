#' Making a Bar Graph
#'
#' This function allows you to make a word cloud given a .csv file and the number of words for the word cloud.
#' @param file A .csv file
#' @keywords wordcloud
#' @export
#' @examples
#' make_wordcloud()
make_wordcloud <- function(file) {
  library(ggplot2)
  library(dplyr)
  library(tidyr)
  library(tidytext)
  
  options(stringsAsFactors = FALSE)
  tweets <- read.csv("clean_sarah_tweets.csv")
  # get a list of words
  tweet_words <- tweets %>%
    dplyr::select(x) %>%
    unnest_tokens(word, x)
  
  # plot the top 15 words
  tweet_words %>%
    count(word, sort = TRUE) %>%
    top_n(15) %>%
    mutate(word = reorder(word, n)) %>%
    ggplot(aes(x = word, y = n)) +
    geom_col() +
    xlab(NULL) +
    coord_flip() +
    labs(x = "Count",
         y = "Unique words",
         title = "Count of unique words found in tweets") + theme_bw()
  ## Selecting by n
}
