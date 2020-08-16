library(tidyverse)


#original wide data
path <- system.file('extdata',package = 'dslabs')
filename <- file.path(path,'fertility-two-countries-example.csv')
wide_data <- read_csv(filename)

head(wide_data)

#tidy data from dslabs package
library(dslabs)
data("gapminder")

tidy_data <- gapminder %>%
  filter(country %in% c('South Korea','Germany')) %>%
  select(country,year,fertility)

#converting wide data to tidy data
new_tidy_data <- wide_data %>%
  gather(year,fertility,'1960':'2015')
head(new_tidy_data)

#gather is a function from the tidyr package
#we can perform the same operation as above by just excluding the column
#we don't want to include

# new_tidy_data <- wide_data %>%
#   gather(year,fertility,-country)

class(tidy_data$year)
class(new_tidy_data$year)

#the year column is in the character format hence while using the gather()
#function we convert it into the original data type
new_tidy_data <- wide_data %>%
  gather(year,fertility,-country,convert = T)

class(new_tidy_data$year)


#ggplot on new tidy data
new_tidy_data %>% ggplot(aes(year,fertility,color = country)) +
  geom_point()

#we can see the plot can be easily made in tidy data format

#similar to gather() function, spread() is another function which is
#used to convert tidy data into wide data format

new_wide_data <- new_tidy_data %>% spread(year, fertility)

select(new_wide_data,country,'1960':'1967')
