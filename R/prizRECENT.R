#' Get the recommended, relevant, recent content for a topic
#'
#' @param TOKEN Your API token
#' @param TID The topic id, which you can look for using \code{prizURL()} 
#' @return dataframe
#' @export


prizRECENT = function(TOKEN=NA, TID=NA) {
  suppressMessages(library(httr))
  ## set the endpoint
  EP = "http://interest-graph.getprismatic.com/topic/recent-url"
  ## make sure the token exsists
  if (is.na(TOKEN)) {
    message("You must supply a valid token")
  }
  ## make sure URL exists
  if (is.na(TID)) {
    message("You must supply a valid Topic ID such as 1950 for hockey.")
  }
  ## build the url
  PAGE = paste(EP,
               "?api-token=",
               TOKEN,
               "&id=",
               RCurl::curlEscape(TID),
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
    df = do.call(rbind, lapply(dat$urls, function(x) data.frame(topic_id = TID,
                                                                  url = x$url,
                                                                  score = x$score,
                                                                  stringsAsFactors=F)))
  }
  return(df)
}
