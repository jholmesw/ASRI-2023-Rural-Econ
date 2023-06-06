pacman::p_load(pacman, ggplot2, tidyverse, rio, magrittr)

df <- import("rural-econ.csv") %>%
  as_tibble() %>%
  print()


df %<>% spread(key = Attribute, value = Value)

df %>% print()
df %>% glimpse()

df %>% write.csv("rural-econ-edit.csv")
