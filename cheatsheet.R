install.packages("tidyverse")
install.packages("janitor")
library(tidyverse)
library(janitor)
library(babynames)
#option- for assignment, command shift m for pipe
# Make vector:
# c(param1, param2)

# Make plot template
ggplot(data = <DATA>) +
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
stem(<dataset$column>, scale = <1>)
#Add position = "dodge" to put the groups side by side
#Add + coord_flip() to flip x and y axis!
#GEOM_FUNCTION
geom_bar #counts number of occurances in dataset, requires only 1 column
geom_col #graphs x vs y, requires 2 columns, x and y
#Example:
#ggplot(email50) +
#  geom_dotplot(mapping = aes(x = num_char))

#Summations (for looking at sums of columns):
sum(<condition>, na.rm=bool)
#Example:
sum(is.na(), na.rm=TRUE)
#is.na() conditions if the entry is empty, na.rm conditions whether to count empty entries or not

#Bits of a data set
filter(<data>, cond1, cond2, etc) #returns all rows satisfies all conditions
select(<data>, <col1>, <col2>, etc) #returns a dataframe with those columns only
mutate(<data>, <new/old colname> = <function of other cols>) #modifies existing/creates new cols as function of other cols, use NULL to delete col 
sample(<vector set>, <"# ofsamples">, <replacement>, <prob weights>)
slice_sample(<data>, <"# ofsamples">, <replacement>, <prob weights>)
#slice also comes with _head, _tail, _min, _max
mean(<dataset$column>, trim = 0) #trim trims x% off both ends
group_by(<dataset>, <col1>, <col2>, etc) #groups the rows into col1 then col2 etc for future operations like sum and count
ungroup() #ungroups all groups
x %in% y #vector %in% vector, Ex: n %in% c(1:4)

#Visualise data
knitr::kable(head(<dataset>))
View(<dataset>)
summary(<dataset$column>) #returns quartiles of the column
summarise(<dataset>, <col1 name> = <summary stat>, <col2 name> = <sum stat>, etc) 
#EX: summarise(<data>, total = sum(n), max = max(n), mean = mean(n))
#mean(), median(), sd(), IQR(), mad(), min(), max(), first(), last(), nth(), n(), n_distinct(), any(), all()
tibble(<col1> = <vector>, <col2> = <vector>)
#forEach row functions
count(<column>)
count(<col1>, <col2>)
arrange(<column>)
desc(<column>) #sorts by descending instead of ascending order

rep(<vector>, <count>)
#Ex: tibble(outcome = c(x,y), model = rep(c("Pois", "Binom"), rep(1000,2)))

#distributions:
rbinom(<number of samples>, <valid outputs>, <prob of success>)
rpois(<number of samples>, <lambda>)
runif(<number of samples>, <min>, <max>)
rnorm(<number of samples>, <mean>, <SD>)
#d/p/q density, prob, quantile
#Ex: find P(a<X<b) X~pois(lambda)
sum(dpois(a:b, lambda))



#Popularity of boy name Thomas:
babynames %>%
  filter(name == "Thomas", sex == "M") %>%
  select(year, prop) %>%
  ggplot() +
  geom_line(aes(x = year, y = prop)) +
  labs(title = "Popularity of the boy name Thomas")



Approximations:
B(n, p) ~ N(np, npq) for np, nq ≥ 5
P(lambda) ~ N(lambda, lambda) for lambda > 9
NB(k, p) ~ N(q/p, q/p^2) for q ~ p and k > 25 #sum of geoms





