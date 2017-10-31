Title
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. 

This is how I have been looking at machine learning trends in pubmed publications:


```r
library(informationRetrieval)
library(RISmed)
RF_hits <- get.NormalizedNumberOfHits(1990:2014, query="random forest[tw]", db="pubmed", normalization_value=1000000)
```

```
## 1990 
## 1991 
## 1992 
## 1993 
## 1994 
## 1995 
## 1996 
## 1997 
## 1998 
## 1999 
## 2000 
## 2001 
## 2002 
## 2003 
## 2004 
## 2005 
## 2006 
## 2007 
## 2008 
## 2009 
## 2010 
## 2011 
## 2012 
## 2013 
## 2014
```

![plot of chunk Call Trends](figure/Call Trends-1.png) 


