#' Getting Tweets
#'
#' This function allows you to save tweets that contain a given keyword in a .csv file.
#' @param keyword A string that is the keyword included in tweets
#' @keywords tweets
#' @export
#' @examples
#' get_tweets()
get_tweets <- function(keyword) {

  install.packages("twitteR")
  install.packages("purrr")
  library(twitteR)
  library(dplyr)
  library(purrr)
  library(tidytext)
  
  api_key <- "kDhE1qt5Yud7aBaXVCaKN6Zma"
  api_secret <- "Hd3yLQ3W9OxZO2nwFtgq92EGfzLhMwZ4y67dCbmhD68y98C74u"
  access_token <- "47221368-YkXjK0S5Bc6zXu5751FMP9LNx9weTkLCjq7UpT2Yo"
  access_token_secret <- "m0lpA0eVRMhEERvi3vuIfPX7eFCttRWAa4f5b1YGsnYhK"
  
  setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)
  
  tweets <- searchTwitter(keyword, n = 1000, lang = "en")
  df <- twListToDF(tweets)
  
  write.csv(df, paste(keyword, "_tweets.csv", sep = ""))
}




