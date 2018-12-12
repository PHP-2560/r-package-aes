#' Making a Category Graph for Emotions
#'
#' This function allows you to make a bar graph given a .csv file.
#' @param file A .csv file
#' @keywords category graph
#' @export
#' @examples
#' make_cat_graph()
#' 

make_cat_graph <- function(file) {
  tweets_tidy <- unnest_tokens(readr::read_csv(file), word, x)
  tweets_tidy1 <- tweets_tidy %>% left_join(get_sentiments("nrc"))
  tweets_tidy2 <- tweets_tidy1 %>% na.omit()
  tweets_tidy2 %>%
    sample_n(30) %>%
    ggplot(aes(x = word, fill = sentiment)) +
    facet_grid(~sentiment) +
    geom_bar() + #Create a bar for each word per sentiment
    theme(panel.grid.major.x = element_blank(),
          axis.text.x = element_blank()) + #Place the words on the y-axis
    xlab(NULL) + ylab(NULL) +
    ggtitle("Emotional Category for Tweet Words") +
    coord_flip()
}
