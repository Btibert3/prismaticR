#' Get the aspects of the the URL you provide
#'
#' This function attempts to take a URL and use the API to tag it with topics
#' @param TOKEN Your API token
#' @param URL The URL of the page you want to tag for topics. Be sure to include http://
#' @return a list, and on a successful API call, a list of lists
#' @export
#' 

prizASP = function(TOKEN=NA, URL=NA) {
  suppressMessages(library(httr))
  ## set the endpoint
  EP = "http://interest-graph.getprismatic.com/url/aspect"
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
    dat = list()
  } else if (length(content(resp)[[1]]) == 0) {
    ## checks if the API doesn't return data for whatever reason
    dat = list()
  } else {
    ## parse the data into a nested list
    dat = httr::content(resp)
  }
  return(dat)
}

