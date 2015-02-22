########################
# ggplot2 learning
# Brian J. Enquist
# February 22 2015
#######################

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

#what are the data and how do we map them
myplot <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))
summary(myplot)

myplot + geom_point() 
myiris <- iris

ggplot(iris, aes(Sepal.Length, Sepal.Width, color=Species)) +
  geom_point(aes(shape = Species), size =3)

## Exercise 1
d2 <- diamonds[sample(1:dim(diamonds)[1],1000),]
dim(diamonds)
dim(diamonds)[1]

head(d2)

myplot2 <- ggplot(data=d2, aes(x = carat, y = price))
summary(myplot2)
myplot2 + geom_point(aes(color = color), size =6) 
#myplot2 + geom_point(aes(shape = color), size =3) 

#another way
ggplot(d2, aes(carat, price, color=color)) + geom_point()


library(MASS)
ggplot(birthwt, aes(factor(race), bwt))+ geom_boxplot()
head(birthwt)

myplot3 <- ggplot(birthwt, aes(factor(race), bwt))+ geom_boxplot()
summary(myplot3) #looking inside the ggplot object

ggplot(iris, aes(Sepal.Length, Sepal.Width, color=Species)) + 
  geom_point() +
  facet_grid(Species ~ .)  # dot is saying there is no other access that we want to subset
# note y axis is shared and the x axis is repeated
# or

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  facet_wrap(~ Species)
#

library(RColorBrewer)
display.brewer.all()

#using melt
df <-melt(iris, id.vars = "Species")  #click on df in the environment tab because we have melted it we can map it 
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") + # dodge is putting all four measures together
  scale_fill_brewer(palette = "Set1")

#how to visualize them

head(iris)
ddply(iris, .(Species), summarize)
df <- melt (iris, id)
dcast(df, Species ~ variable, mean)