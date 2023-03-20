library(tidyverse)
# 
# class97 <- read_csv("class97.csv")
# knitr::kable(head(class97))
# head(class97$tutetime)
# class97$tutetime
# nrow(class97)
# sum(class97$height >= 0, na.rm=TRUE)
# ggplot(class97) +
#   geom_bar(aes(x=height))
# summary(class97$height)
# ggplot(data = class97) +
#   geom_boxplot(aes(y = height, x = sex))
# rainfall <- read_csv("rainfall.csv")
# ?stem
# stem(rainfall$max_daily_rainfall, scale = 2)
# ggplot(rainfall) +
#   geom_boxplot(aes(x=max_daily_rainfall))
# summary(rainfall$max_daily_rainfall)
# mean(rainfall$max_daily_rainfall)
# sd(rainfall$max_daily_rainfall)
# trim(rainfall)
# mean(rainfall$max_daily_rainfall, trim = 0.1)
# #ggplot(diamonds) +
# #  geom_bar(aes(
# #    x = diamonds$cut
# #))xlab="cut"
# 
 install.packages("babynames")
 library(babynames)
# 
# sample(1:6, 6, replace = TRUE, prob = NULL)
# dim(babynames)
# trimmeddata <- filter(babynames, name == "Samuel", sex == "M")
# ggplot(trimmeddata) +
#   geom_point(aes(x= year, y = prop), size = 3)
# 
# names <- filter(babynames, year==1880, n==1:5)$name
# names

install.packages("patchwork")
library(patchwork)
x <- rpois(1000, 3)
y <- rbinom(1000, 1000, 3/1000)
df <- data.frame(valx = x, valy = y)
df %>%
  count(valx, valy) %>%
  mutate(prop = prop.table(n))
pos <- ggplot(df) +
  geom_bar(aes(x=valx))
bin <- ggplot(df) +
  geom_bar(aes(x=valy))
wrap_plots(pos, bin)

babynames2017 <- data.frame(filter(babynames, year == 2017 & sex == "F"))

head(select(arrange(babynames2017, desc(n)), name, n))

