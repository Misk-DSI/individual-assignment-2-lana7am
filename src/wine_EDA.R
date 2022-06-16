
#Initialize necessary packages in your script.

library(ggplot2)
library(dplyr)
library(DataExplorer)
library(tidyverse)
install.packages('corrgram')

#import dataset
wine_tbl <- read.csv('data/winequality-red.csv')
dplyr::glimpse(wine_tbl)

summary(wine_tbl)

#clean up the names in your dataset
janitor::clean_names(wine_tbl)

#mean
library(dplyr)
wine_tbl %>% filter(quality > 6 ) %>% pull(alcohol) %>% mean()

#correlation between all features graph
corrgram::corrgram(wine_tbl, order = TRUE, upper.panel =  NULL)+
  labs(title= "correlation between all features")

#pie chart of quality
library(ggplot2)
((piechart <- ggplot(wine_tbl, aes( x="",y=quality,fill=factor(quality))) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)+
  scale_fill_manual(values = c("red", "yellow",
                               "blue", "orange",
                               "green","purple"))))


