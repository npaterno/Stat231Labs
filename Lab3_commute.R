library(tidyverse)
library(ggthemes)
library(ggdark)

commute_mode <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-11-05/commute.csv")

wash_mode <- commute_mode %>% 
  filter(state == "Washington") %>% 
  filter(n < 10000)

ggplot(wash_mode, 
       aes(n))+
  geom_histogram(binwidth = 500,
                 color = "white", 
                 fill = "firebrick")+
  facet_wrap(~mode)+
  dark_mode(theme_solarized_2())+
  labs(title = "Biking and Walking to Work",
       subtitle = "Washington State",
       x = "Number of Commuters",
       y = "Number of Cities",
       caption = "Source: ACS Survey")

             