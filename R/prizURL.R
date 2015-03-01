#' Get the topics for a given URL
#'
#' This function attempts to take a URL and use the API to tag it with topics
#' @param TOKEN Your API token
#' @param URL The URL of the page you want to tag for topics. Be sure to include http://
#' @return dataframe
#' @export


prizURL = function(TOKEN=NA, URL=NA) {
  suppressMessages(library(httr))
  ## set the endpoint
  EP = "http://interest-graph.getprismatic.com/url/topic"
  ## make sure the token exsists
  if (is.na(TOKEN)) {
    message("You must supply a valid token")
  }
  ## make sure URL exists
  if (is.na(URL)) {
    message("You must supply a valid URL in the form of http://....")
  }
  ## build the url
  PAGE = paste(EP,
               "?api-token=",
               TOKEN,
               "&url=",
               RCurl::curlEscape(URL),
               sep = "")
  ## get the data
  resp = httr::GET(PAGE)
  if (resp$status_code != 200) {
    df = data.frame()
  } else if (length(content(resp)[[1]]) == 0) {
    ## checks if no topics are returned by the API
    df = data.frame()
  } else {
    ## parse the data into a nested list
    dat = httr::content(resp)
    ## parse into a dataframe
    df = do.call(rbind, lapply(dat$topics, function(x) data.frame(topic_id = x$id,
                                                                  topic = x$topic,
                                                                  score = x$score,
                                                                  stringsAsFactors=F)))
  }
  return(df)
}