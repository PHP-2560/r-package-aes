#' Making a Bar Graph for each Sentiment.
#'
#' This function allows you to analyze word counts that contribute to each sentiment.
#' @param file A .csv file
#' @keywords category graph
#' @export
#' @examples
#' make_cat_graph()
#' 

make_cat_graph <- function(file) {
  tweets_tidy <- unnest_tokens(readr::read_csv(file), word, x)
  tweets_tidy1 <- tweets_tidy %>% 
    inner_join(get_sentiments("nrc")) %>%
    count(word, sentiment, sort = TRUE) %>%
    ungroup()
  tweets_tidy1 %>%
    group_by(sentiment) %>%
    top_n(8) %>%
    ggplot(aes(reorder(word, n), n, fill = sentiment)) +
    geom_bar(alpha = 0.8, stat = "identity", show.legend = FALSE) +
    facet_wrap(~sentiment, scales = "free_y", nrow=2) +
    labs(y = "Contribution to Sentiment", x = "Words in Tweets") +
    coord_flip()
}
