library(tidyverse)


#raw data
path <- system.file('extdata',package = 'dslabs')
filename <- file.path(path,'life-expectancy-and-fertility-two-countries-example.csv')
raw_data <- read_csv(filename)

print(head(raw_data))

#using gather method
# dat <- raw_data %>%
#   gather(key,value,-country)

# head(dat)
#gather is taught from the video
#pivot_longer() is the new function which is meant to replace gather()

dat <- raw_data %>%
  gather(key,value,-country) %>%
  separate(key,c('year','variable_name'),extra = 'merge') %>%
  spread(variable_name,value)

print(head(dat))

#another way to achieve this is to separate and then unite
#all operations performed in one go using pipe operator
dat2 <- raw_data %>%
  gather(key,value,-country) %>%
  separate(key,c('year','first_var','second_var'),'_',fill = 'right') %>%
  unite(variable_name,first_var,second_var,sep = '_') %>%
  spread(variable_name,value) %>%
  rename(fertility = fertility_NA)

print(head(dat2))

#the same above operations performed step by step to understand
#what separate and unite does

#step 1
dat3 <- raw_data %>%
  gather(key,value,-country) %>%
  separate(key,c('year','first_var','second_var'),'_',fill = 'right')

print(head(dat3))
#uncomment everything to see step by step
# #step 2
# dat3 <- dat3 %>%
#   unite(variable_name,first_var,second_var,sep='_') 
# 
# print(head(dat3))
# 
# #step 3
# dat3 <- dat3 %>%
#   spread(variable_name,value)
# 
# print(head(dat3))
# 
# #step 4
# dat3 <- dat3 %>%
#   rename(fertility = fertility_NA)
# 
# print(head(dat3))