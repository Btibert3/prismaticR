# About

This is a very basic R package to interface with Prismatic's Topic Graph API.  

## The API

To learn more, please visit this page.

[API](https://github.com/Prismatic/interest-graph)

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