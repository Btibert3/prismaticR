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
TOKEN = "your-token-here"

## tag a url
prizURL(TOKEN, "https://en.wikipedia.org/wiki/New_England_Patriots")

## get similar topics
prizSIM(TOKEN, 1950)
```

## Notes and Future Development

I had some issues tryign to get the calls to work properly.  Usage of the API is a basic curl command, but instead of `POST`, I simply build the URL and used the `GET` method.  I am not sure why I couldn't get curl to work properly, with `RCurl` or `httr`, but my issues centered around the `--data` flag. I would feel better about my approach if I was actually POSTing the data, but maybe that is down the road.

Along those lines, I would like to implment the other methods.  After a quick first pass, I was hitting some snags, so I paused and released the two functions above.

Because this is my first R package, and I am certainly no expert interfacing with APIs, I am sure that my approach has many bugs.  Please let me know what you see. 