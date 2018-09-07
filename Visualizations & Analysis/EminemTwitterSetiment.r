
options(warn=-1)

install.packages(c("devtools", "rjson", "bit64", "httr"))

library(devtools)
install_github("geoffjentry/twitteR")

library(twitteR)

devtools::install_github("mjockers/syuzhet")

library('syuzhet')

installed.packages("SnowballC")
installed.packages("tm")
library("SnowballC")
library("tm")

consumer_key <- 'jmZJTje8YXxTxaerNcqdtLtGH'
consumer_secret <- 'gL4jakK8Pd098o2H3iOVIAahYYVUZyBu8fvGzOWiWsVfNe4Sus'
access_token <- '1037843989762924544-lkBatw36sDjwwjlJe0xsx3WF9KhxZB'
access_secret <- 'Qcai0dFZ07shS1uudUXHdYSl3VlWWVHSmbLFk8A0HSjmg'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets <- userTimeline("eminem", n=1000)
n.tweet <- length(tweets)

tweets.df <- twListToDF(tweets)
head(tweets.df)

tweets.df2 <- gsub("http.*","",tweets.df$text)
tweets.df2 <- gsub("https.*","",tweets.df2)
tweets.df2 <- gsub("#.*","",tweets.df2)
tweets.df2 <- gsub("@.*","",tweets.df2)

tweets.df2<- gsub("[^\x01-\x7F]", "", tweets.df2)


head(tweets.df2)

word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)
emotion.df2 <- cbind(tweets.df2, emotion.df) 
head(emotion.df2)

sent.value <- get_sentiment(word.df)
most.positive <- word.df[sent.value == max(sent.value)]
most.negative <- word.df[sent.value <= min(sent.value)] 
most.negative
most.positive

positive.tweets <- word.df[sent.value > 0]
negative.tweets <- word.df[sent.value < 0]

head(positive.tweets)

head(negative.tweets)

category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0, "Positive", "Neutral"))

table(category_senti)
category_senti

installed.packages("tau")

library(ggplot2)
library(plyr)
library(dplyr)
library(readr)
library(plotly)

install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes

library("wordcloud")
library("RColorBrewer")

positive.tweets <- Corpus(VectorSource(positive.tweets))

negative.tweets <- Corpus(VectorSource(negative.tweets))

negative.tweets <- tm_map(negative.tweets, content_transformer(tolower))
negative.tweets <- tm_map(negative.tweets, removeNumbers) 
negative.tweets <- tm_map(negative.tweets, removePunctuation)
negative.tweets <- tm_map(negative.tweets, stripWhitespace)
negative.tweets <- tm_map(negative.tweets, removeWords, stopwords("english"))

positive.tweets <- tm_map(positive.tweets, content_transformer(tolower))
positive.tweets <- tm_map(positive.tweets, removeNumbers) 
positive.tweets <- tm_map(positive.tweets, removePunctuation)
positive.tweets <- tm_map(positive.tweets, stripWhitespace)
positive.tweets <- tm_map(positive.tweets, removeWords, stopwords("english"))

ntm <- TermDocumentMatrix(negative.tweets)
a <- as.matrix(ntm)
b <- sort(rowSums(a),decreasing=TRUE)
c <- data.frame(word = names(b),freq=b)
head(c, 10)

set.seed(1234)
wordcloud(words = c$word, freq = c$freq, min.freq = 1,
          max.words=100, random.order=FALSE, rot.per=0.25, 
          colors=brewer.pal(8, "Dark2"))

dtm <- TermDocumentMatrix(positive.tweets)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=100, random.order=FALSE, rot.per=0.25, 
          colors=brewer.pal(8, "Dark2"))
