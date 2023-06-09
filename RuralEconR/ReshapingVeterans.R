pacman::p_load(pacman, ggplot2, tidyverse, rio, magrittr)

df <- import("Rural_Atlas_Update24/Veterans.csv") %>%
  as_tibble() %>%
  print()

df %<>% filter(State == "AR")

df %>%
  print()

df %<>% spread(key = Attribute, value = Value)
df %>% write.csv("veterans-edit-AR.csv")
