pacman::p_load(pacman, ggplot2, tidyverse, rio, magrittr)

df <- import("rural-econ-edit-AR.csv") %>%
  as_tibble()

otherdf <- import("veterans-edit-AR.csv") %>%
  as_tibble()

newdf <- df %>% full_join(otherdf, by="FIPS") %>%
  print()

newdf %<>% select(FIPS:County.x,Poverty_Rate_ACS, Vets18OPct, PctVetsDisabilty, PctVetsPoor, UEVetsRate)

newdf %>% colnames()

newdf %<>% rename("State" = State.x, "County" = County.x)

newdf %>% glimpse()

any(is.na(newdf))

newdf %>% write.csv("ARVetsAndPoverty.csv")