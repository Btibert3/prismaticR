#' Get the topics for a given URL
#'
#' This is a helper function to get the human list of topics and topic ids
#' @param TOKEN Your API token
#' @param URL The URL of the page you want to tag for topics. Be sure to include http://
#' @return dataframe
#' @export

prizTID = function() {
  suppressMessages(library(rvest))
  ## set the endpoint
  URL = "http://interest-graph.getprismatic.com/topic/all/human"
  ## get the data
  resp = html(URL)
  tables = html_nodes(resp, "table")
  tids = html_table(tables[[1]])
  ## return the table
  return(tids)
}