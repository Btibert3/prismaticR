# About

This is a very basic R package to interface with Prismatic's Topic Graph API.  This is also my first R package, so I am sure that there are many things that can be improved.  To learn more about how to create your own R packages, these are two resources to get your started:

1.  [Writing an R Package by Hillary Parker](http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
2.  [Hadley's Book on R Packages](http://r-pkgs.had.co.nz/)

## The API

To learn more about what is possible, please visit this page.

[API](https://github.com/Prismatic/interest-graph)

It's important to note that API is currently alpha, and only allows for 20 calls/minute.

## Supported Methods

Right now, the package currently has functionality for:

1.  `prizURL` = Tag a URL with topics
2.  `prizSIM` = Identify related topics.

`prizSIM` expects a topic ID.  You can find those [here](http://interest-graph.getprismatic.com/topic/all/human)

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

## get similar topics to Ice Hockey
prizSIM(TOKEN, 1950) 

also returns a dataframe ...

  topic_id           topic   score
1     1948          Hockey 0.33074
2     3166             NHL 0.30033
3     4163 St. Louis Blues 0.26700

```

Not sure why only the St. Louis Blues are similar, but the API is currently alpha, so I am sure it will get "better" over time.

## Notes and Future Development

I had some issues tryign to get the calls to work properly.  Usage of the API is a basic curl command, but instead of `POST`, I simply build the URL and used the `GET` method.  I am not sure why I couldn't get curl to work properly, with `RCurl` or `httr`, but my issues centered around the `--data` flag. I would feel better about my approach if I was actually POSTing the data, but maybe that is down the road.

Along those lines, I would like to implment the other methods.  After a quick first pass, I was hitting some snags, so I paused and released the two functions above.

Because this is my first R package, and I am certainly no expert interfacing with APIs, I am sure that my approach has many bugs.  Please let me know what you see. 