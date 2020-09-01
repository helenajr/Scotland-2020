library(forcats)
library(tidyverse)
library(dplyr)
library(ggplot2)

scotland <- read.csv("~/Desktop/Scotland-2020/Scotland 2020 car ride - Sheet1.csv")

scotland$Name <- as.factor(scotland$Name)

#Summarises the amount each person spent#
person_totals <- scotland %>%
  group_by(Name) %>%
  summarize(sum(Amount))
person_totals

as.data.frame(person_totals)
colnames (person_totals) <- c("name", "amount_spent")

num_people <- 3

#Cost of the trip per person#
expense_per_head <- sum(person_totals$amount_spent)/ num_people
expense_per_head

#Add the balance column, positive value is amount person in debt to
#central pool. Negative value means that person is owed money#
person_totals <- person_totals %>%
  mutate("balance" = (expense_per_head - amount_spent))
person_totals
