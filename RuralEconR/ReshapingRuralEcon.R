pacman::p_load(pacman, ggplot2, tidyverse, rio, magrittr)

df <- import("rural-econ.csv") %>%
  as_tibble() %>%
  print()


df %<>% spread(key = Attribute, value = Value)

df %>% print()
df %>% glimpse()


df %<>% filter(State == "AR")

df %>% write.csv("rural-econ-edit-AR.csv")
