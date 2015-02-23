########################
# ggplot2 atmosphere R script
# Brian J. Enquist
# February 22 2015

# load first three countries
# Afghanistan
# Albania
#  Algeria  

#load the countries

# Write an Rmd script to load the data file, 
# select all the data for that country (hint, use the subset() function), 
# and use ggplot make a three scatter plots (one for each country) that has 
# year on the x-axis and GDP on the y axis. Make sure you load all the libraries 
#you might need (ggplot2, reshape2, etc). Describe any trends you see for each 
#country using markdown text.

# this is the script way of installing packages
install.packages ("ggplot2", dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

#load libraries
library(ggplot2)
library(reshape2)
library(ggthemes)
library(plyr)

getwd()
setwd("/home/benquist/Desktop/iPlant/output")
df <- read.delim("combined_gapMinder.tsv", sep='\t')

#subset data from the data frame
df2 <- subset(df, country=="Afghanistan" | country == "Albania" | country == "Algeria")
View(df2)

head(df)
df2$GDP <- df2$gdpPercap * df2$pop
head(df2)

#myplot <- ggplot(data=df2, aes(x = country, y = GDP, color=country))
summary(myplot)
myplot + geom_point() 

ggplot(subset(df2, country=="Afghanistan") , aes(x=year, y=GDP)) +
geom_point(shape=21) +
  xlab(expression('year'))+
  ylab(expression('GDP')) +
  theme_bw(base_size=12) +
  scale_colour_manual(values=cbPalette) +
  theme(legend.position="none")


ggplot(subset(df2, country=="Algeria") , aes(x=year, y=GDP)) +
  geom_point(shape=21) +
  xlab(expression('year'))+
  ylab(expression('GDP')) +
  theme_bw(base_size=12) +
  scale_colour_manual(values=cbPalette) +
  theme(legend.position="none")


ggplot(subset(df2, country=="Albania") , aes(x=year, y=GDP)) +
  geom_point(shape=21) +
  xlab(expression('year'))+
  ylab(expression('GDP')) +
  theme_bw(base_size=12) +
  scale_colour_manual(values=cbPalette) +
  theme(legend.position="none")


