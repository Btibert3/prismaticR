% Generated by roxygen2 (4.1.0.9001): do not edit by hand
% Please edit documentation in R/prizURL.R
\name{prizURL}
\alias{prizURL}
\title{Get the topics for a given URL}
\usage{
prizURL(TOKEN = NA, URL = NA)
}
\arguments{
\item{TOKEN}{Your API token}

\item{URL}{The URL of the page you want to tag for topics. Be sure to include http://}
}
\value{
dataframe
}
\description{
This function attempts to take a URL and use the API to tag it with topics
}

