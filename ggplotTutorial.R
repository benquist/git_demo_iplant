########################
# ggplot2 learning
# Brian J. Enquist
# February 22 2015
#######################


# see also http://naupaka.github.io/2015-01-10-st_josephs/workshop/02_Sunday/04_Sunday_pm/ggplot.pdf

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

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color=Species)) +
  geom_point(aes(shape = Species), size =3)

## Exercise 1
d2 <- diamonds[sample(1:dim(diamonds)[1],1000),]
dim(diamonds)
dim(diamonds)[1]

#learn more http://docs.ggplot2.org/current/
#http://docs.ggplot2.org/current/

# done with lecture

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
  facet_grid(. ˜ Species)
#or

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

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  ffacet_grid(Species ˜ .) +
  scale_color_manual(values = c("red", "green", "blue"))

library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) +
  geom_boxplot(width = .2) +
  scale_y_continuous(labels = (paste (1:4, " Kg")),
                     breaks = seq(1   , 4   , by = 1   ))

#histogram examples
h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwidth = 30, colour = "black")

h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwidth = 8, fill = "steelblue",
                   colour = "black")

#Lines

# Bar Plots
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "identity")

df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity")

ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge")

ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position="dodge", color="black")

### Density
ggplot(faithful, aes(waiting)) + geom_density()

ggplot(faithful, aes(waiting)) +
  geom_density(fill = "blue", alpha = 0.1)

ggplot(faithful, aes(waiting)) +
  geom_line(stat = "density")

## Adding smoothers
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(aes(shape = Species), size = 2) +
  geom_smooth(method = "lm")

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(aes(shape = Species), size = 3) +
  geom_smooth(method = "lm") +
  facet_grid(. ~ Species)


##Adding Themes

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3, shape = 16) +
  facet_wrap(~Species) +
  theme_bw()

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 1.2, shape = 16) +
  facet_wrap(~Species) +
  theme(legend.key = element_rect(fill = NA),
        legend.position = "bottom",
        strip.background = element_rect(fill = NA),
        axis.title.y = element_text(angle =  ))

install.packages(ggthemes)
library(ggthemes)

#read more http://cran.r-project.org/web/packages/ggthemes/vignettes/ggthemes.html

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3, shape = 16) +
  facet_wrap(~Species) +
  #theme_excel()
  #theme_wsj()
  #theme_solarized()
  #theme_stata()
  #theme_economist()
  #theme_fivethirtyeight()
  #theme_tufte()
  #theme_economist()
  theme_pander()  #not bad
  #theme_calc()   #pretty good

## customize

my_custom_plot <- function(df, title = "", ...) {
  ggplot(df, ...) +
    ggtitle(title) +
    whatever_geoms() +
    theme(...)
}
  
plot1 <- my_custom_plot(iris, title = "Figure 1")

## publication quality figures
ggsave(˜/Desktop/filename.png)

ggsave(file = "/path/to/figure/filename.png", width = 6,
       height =4)

ggsave(file = "/path/to/figure/filename.eps")
ggsave(file = "/path/to/figure/filename.jpg")
ggsave(file = "/path/to/figure/filename.pdf")

'
'

#### Done with lecture

#how to visualize them

head(iris)
ddply(iris, .(Species), summarize)
df <- melt (iris, id)
dcast(df, Species ~ variable, mean)

#i want hue will help you pick a palet
# http:// tools.medialab.sciences-po.fr/iwanthue/

## unfinished
ggplot(birthwt, aes(factor(race), bwt)) +
  geom_boxplot(width = .2) +
  scale_y_continuous(labels = (pasteO(1:4, "Kg")), 
  breaks                  )

##