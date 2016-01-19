**UPDATE** Prismatic has shut down, so this package no longer will work.  Read more about it [here](http://venturebeat.com/2015/12/11/prismatic-is-shutting-down-its-news-app-for-ios-android-and-web-on-december-20/)

# About

This is a very basic R package to interface with Prismatic's Topic Graph API.  This is also my first R package, so I am sure that there are many things that can be improved.  To learn more about how to create your own R packages, these are two resources to get your started:

1.  [Writing an R Package by Hillary Parker](http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
2.  [Hadley's Book on R Packages](http://r-pkgs.had.co.nz/)
3.  

## The API

To learn more about what is possible, please visit this page.

[API](https://github.com/Prismatic/interest-graph)

It's important to note that API is currently alpha, and only allows for 20 calls/minute.

## Supported Methods

Right now, the package currently has functionality for:

1.  `prizURL` = Tag a URL with topics
2.  `prizSIM` = Identify related topics.
3.  `prizASP` = Get the Aspects of the URL  
4.  `prizTID` = Scrape the page to get the current list of topics and their ID  
5.  `prizRECENT` = The best recent content for a topic id

`prizSIM` expects a topic ID.  You can find those [here](http://interest-graph.getprismatic.com/topic/all/human) or use `prizTID()`.

On March 11, 2015, Prismatic introduced the Aspect Endpoint, which can be [found here](http://blog.getprismatic.com/deeper-content-analysis-with-aspects/).

## Usage

```
install.package("devtools")
devtools::install_github("btibert3/prismaticR")
library(prismaticR)

## define your token
TOKEN = "your-token-here"

## tag a url
prizURL(TOKEN, "https://en.wikipedia.org/wiki/New_England_Patriots")

returns a dataframe ...

  topic_id                topic   score
1     3087 New England Patriots 0.78413
2     4269           Super Bowl 0.72410
3     3085          New England 0.66779
4     3125      New York Giants 0.62686
5     4165       St. Louis Rams 0.61037
6     3165                  NFL 0.60830
7     1806    Green Bay Packers 0.57642

## get the database of topics and their ids locally
topic_ids = prizTID()

## get similar topics to Ice Hockey
prizSIM(TOKEN, 1950) 

also returns a dataframe ...

  topic_id           topic   score
1     1948          Hockey 0.33074
2     3166             NHL 0.30033
3     4163 St. Louis Blues 0.26700


## get the aspects of a page
URL = "https://en.wikipedia.org/wiki/New_England_Patriots"
x = prizASP(TOKEN, URL)
x

which returns:

$aspects
$aspects$type
$aspects$type$`sub-aspects`
$aspects$type$`sub-aspects`$content
$aspects$type$`sub-aspects`$content$score
[1] 0.23123

$aspects$type$`sub-aspects`$content$value
[1] "review"



$aspects$type$score
[1] 0.58643

$aspects$type$value
[1] "article"


$aspects$flag_nsfw
$aspects$flag_nsfw$score
[1] 0.99997

$aspects$flag_nsfw$value
[1] "false"



```

Not sure why only the St. Louis Blues are similar, but the API is currently alpha, so I am sure it will get "better" over time.

## Notes and Future Development

I had some issues tryign to get the calls to work properly.  Usage of the API is a basic curl command, but instead of `POST`, I simply build the URL and used the `GET` method.  I am not sure why I couldn't get curl to work properly, with `RCurl` or `httr`, but my issues centered around the `--data` flag. I would feel better about my approach if I was actually POSTing the data, but maybe that is down the road.

Along those lines, I would like to implment the other methods.  After a quick first pass, I was hitting some snags, so I paused and released the two functions above.

Because this is my first R package, and I am certainly no expert interfacing with APIs, I am sure that my approach has many bugs.  Please let me know what you see. 
