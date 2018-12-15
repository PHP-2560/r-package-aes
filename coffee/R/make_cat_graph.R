#' Making a Bar Graph for each Sentiment.
#'
#' This function allows you to analyze word counts that contribute to each sentiment.
#' @param file A .csv file as a string of clean tweets
#' @keywords category graph
#' @export
#' @examples
#' make_cat_graph()
make_cat_graph <- function(file) {
  
  check_packages("tidytext")
  
  #Tokenize the tweets
  tweets_tidy <- unnest_tokens(readr::read_csv(file), word, x)
  #Inner join words with sentiments
  tweets_tidy1 <- tweets_tidy %>% 
    inner_join(get_sentiments("nrc")) %>%
    count(word, sentiment, sort = TRUE) %>%
    ungroup()
  #Group by sentimens and plot
  tweets_tidy1 %>%
    group_by(sentiment) %>%
    top_n(8) %>%
    ggplot(aes(reorder(word, n), n, fill = sentiment)) +
    geom_bar(alpha = 0.8, stat = "identity", show.legend = FALSE) +
    facet_wrap(~sentiment, scales = "free_y", nrow=2) +
    labs(y = "Contribution to Sentiment", x = "Words in Tweets") +
    coord_flip()
}
