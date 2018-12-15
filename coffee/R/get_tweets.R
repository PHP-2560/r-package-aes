#' Getting Tweets
#'
#' This function allows you to save tweets that contain a given keyword in a .csv file.
#' @param keyword A string that is the keyword included in tweets
#' @param num_tweets The number of tweets to get, default is 500
#' @keywords tweets
#' @export
#' @examples
#' get_tweets()


get_tweets <- function(keyword, num_tweets = 500) {

  check_packages(c("twitteR", "dplyr", "purrr", "tidytext", "ROAuth", "httpuv", "openssl"))
  
  #Authentication information
  api_key <- "kDhE1qt5Yud7aBaXVCaKN6Zma"
  api_secret <- "Hd3yLQ3W9OxZO2nwFtgq92EGfzLhMwZ4y67dCbmhD68y98C74u"
  access_token <- "47221368-YkXjK0S5Bc6zXu5751FMP9LNx9weTkLCjq7UpT2Yo"
  access_token_secret <- "m0lpA0eVRMhEERvi3vuIfPX7eFCttRWAa4f5b1YGsnYhK"
  
  #Setup authentication
  setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)
  options(httr_oauth_cache = TRUE)
  
  #Search for keyword
  tweets <- searchTwitter(keyword, n = num_tweets, lang = "en")
  #Store the tweets in a data frame
  df <- twListToDF(tweets)
  
  #Write the data frame to a .csv file titled "keyword_tweets.csv"
  write.csv(df, paste(keyword, "_tweets.csv", sep = ""))
}




