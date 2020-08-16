library(tidyverse)
library(ggrepel)
library(dslabs)

ds_theme_set()

data("murders")

print(head(murders))

data("polls_us_election_2016")
head(results_us_election_2016)

#making two smaller tables to illustrate join
tab1 <- slice(murders, 1:6) %>% select(state, population)
print(tab1)

tab2 <- slice(results_us_election_2016, c(1:3, 5, 7:8)) %>% select(state, electoral_votes)
print(tab2)

left_join(tab1,tab2) 
right_join(tab1,tab2)


left_join(tab2,tab1)
right_join(tab2,tab1)

#pipe operators can also be used for eg:
# tab1 %>% left_join(tab2)

inner_join(tab1,tab2)
full_join(tab1,tab2)


semi_join(tab1,tab2)
semi_join(tab2,tab1)
#semi join works the same for either order?

anti_join(tab1,tab2)
anti_join(tab2,tab1)



tab <- left_join(murders, results_us_election_2016, by = "state")
head(tab)

tab %>% ggplot(aes(population/10^6,electoral_votes,label = abb)) +
  geom_point() + 
  scale_x_continuous(trans = 'log2') +
  scale_y_continuous(trans = 'log2') + 
  geom_smooth(method = 'lm',se = F)
