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
getwd()
setwd("/home/benquist/Desktop/iPlant/output")
df <- read.delim("combined_gapMinder.tsv", sep='\t')

