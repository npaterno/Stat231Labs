library(tidyverse)
library(ggthemes)
library(ggdark)

# Load Data
tournament <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-06/tournament.csv')

# Created tourney win percent variable
tournament <- tournament %>% 
  mutate(tourney_percentage = tourney_w / (tourney_w+tourney_l))

# Created test data set with number of appearances variable
test <- tournament %>% 
  group_by(school) %>% 
  mutate(num_tourney = n()) %>% 
  ungroup()

#Base graph
ggplot(test, 
       aes(num_tourney))+
  geom_histogram()

# Make it pretty
ggplot(test, 
       aes(num_tourney))+
  geom_histogram(color = "lightgreen", fill = "hotpink", binwidth = 3,
                 aes(size = 0.5))+
  dark_theme_classic()+
  labs(title = "Number of NCAA Tourney Appearanes", 
       substite = "Women's 1982-2018",
       x = "Number Appearances",
       y = "Number of Teams",
       caption = "Source: FiveThirtyEight")+
  guides(size = FALSE)+
  facet_wrap(~seed)
  
