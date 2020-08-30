library(forcats)
library(tidyverse)
library(dplyr)
library(ggplot2)

scotland <- read.csv("~/Desktop/Scotland-2020/Scotland 2020 - Sheet1.csv")

scotland$Name <- as.factor(scotland$Name)

person_totals <- scotland %>%
  group_by(Name) %>%
  summarize(sum(Amount))
person_totals

as.data.frame(person_totals)
colnames (person_totals) <- c("name", "amount_spent")

num_people <- 3

expense_per_head <- sum(person_totals$amount_spent)/ num_people

person_totals <- person_totals %>%
  mutate("balance" = (expense_per_head - amount_spent))
person_totals
