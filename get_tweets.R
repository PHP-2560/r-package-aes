
get_tweets <- function(keyword) {

  library(twitteR)
  library(dplyr)
  library(purrr)
  library(tidytext)
  
  api_key <- "kDhE1qt5Yud7aBaXVCaKN6Zma"
  api_secret <- "Hd3yLQ3W9OxZO2nwFtgq92EGfzLhMwZ4y67dCbmhD68y98C74u"
  access_token <- "47221368-YkXjK0S5Bc6zXu5751FMP9LNx9weTkLCjq7UpT2Yo"
  access_token_secret <- "m0lpA0eVRMhEERvi3vuIfPX7eFCttRWAa4f5b1YGsnYhK"
  
  setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)
  
  tweets <- searchTwitter(keyword, n = 1000)
  df <- tbl_df(map_df(tweets, as.data.frame))
  
  write.csv(df, paste(keyword, "_tweets.csv", sep = ""))
}




