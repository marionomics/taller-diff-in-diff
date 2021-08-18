library(dplyr)
library(ggplot2)
library(reshape2)


#FIGURE 1: Before
b <- data[c("x_st_wage_before", "d_nj", "d_pa")] %>%
  melt(id.vars="x_st_wage_before")

b <- b[b$value != 0, -3]

b %>%
  ggplot(aes(x = x_st_wage_before,
             fill = variable))+
  geom_histogram(bins = 70, binwidth = .1, position = "dodge")


# FIGURE 2: After
a <- data[c("x_st_wage_after", "d_nj", "d_pa")] %>%
  melt(id.vars="x_st_wage_after")

a <- a[a$value != 0, -3]

a %>%
  ggplot(aes(x = x_st_wage_after,
             fill = variable))+
  geom_histogram(bins = 70, binwidth = .1, position = "dodge")
