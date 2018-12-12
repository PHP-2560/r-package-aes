#' Making a Bar Graph
#'
#' This function allows you to make a bar graph given a .csv file.
#' @param file A .csv file
#' @keywords bargraph
#' @export
#' @examples
#' make_bar_graph()
#' 

make_bar_graph <- function(file) {
  library(tidytext)
  library(ggplot2)
  library(dplyr)
  tweets_tidy <- unnest_tokens(readr::read_csv(file), word, x)
  tt <- tweets_tidy %>% filter(!nchar(word) < 3) %>% anti_join(stop_words)
  
  tweets_bing <- tt %>%
    inner_join(get_sentiments("bing"))
  
  bing_plot <- tweets_bing %>%
    group_by(sentiment) %>%
    summarise(word_count = n()) %>%
    ungroup() %>%
    mutate(sentiment = reorder(sentiment, word_count)) %>%
    #Use `fill = -word_count` to make the larger bars darker
    ggplot(aes(sentiment, word_count, fill = -word_count)) +
    geom_col() +
    guides(fill = FALSE) + #Turn off the legend
    labs(x = NULL, y = "Word Count") +
    scale_y_continuous(limits = c(0, 500)) + #Hard code the axis limit
    ggtitle("Tweets Sentiment") +
    coord_flip()
  
  plot(bing_plot)
}
