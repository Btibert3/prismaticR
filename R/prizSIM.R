#' Get similar topics
#'
#' This function attempts to take a URL and use the API to tag it with topics
#' @param TOKEN character. Your API token
#' @param TID integer The id number of the topic you want to find simlarities to.
#' @export


prizSIM = function(TOKEN=NA, TID=NA) {
  suppressMessages(library(httr))
  ## set the endpoint
  EP = "http://interest-graph.getprismatic.com/topic/topic"
  ## make sure the token exsists
  if (is.na(TOKEN)) {
    message("You must supply a valid token")
  }
  ## make sure URL exists
  if (is.na(TID)) {
    message("You must supply a valid URL in the form of http://....")
  }
  ## build the url
  PAGE = paste(EP,
               "?api-token=",
               TOKEN,
               "&id=",
               TID,
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


