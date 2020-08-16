library(tidyverse)
library(dslabs)

data("gapminder")

#create and inspect tidy data
tidy_data <- gapminder %>%
  filter(country %in% c('South Korea','Germany')) %>%
  select(country,year,fertility)

head(tidy_data)


#plotting a graph
tidy_data %>% ggplot(aes(year,fertility,color=country)) +
  geom_point(na.rm = T)

#we are able to plot easily because the data is tidy

#looking at the same dataset which is not in tidy format
#specifically in wide format

path <- system.file('extdata',package = 'dslabs')
filename <- file.path(path,'fertility-two-countries-example.csv')
wide_data <- read_csv(filename)

select(wide_data,country,'1960':'1967')
