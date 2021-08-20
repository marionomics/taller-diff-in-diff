# marionomics.com/diff-in-diff

mlda <- haven::read_dta("data/deaths.dta")

head(mlda)

library(dplyr)
library(ggplot2)


mlda %>%
  filter(state %in% c(1,4))%>%
  group_by(year, state)%>%
  summarise(mrate = mean(mrate)) %>%
  ggplot(aes(x = year, y = mrate, color = factor(state)))+
  geom_line()+
  geom_vline(xintercept = 1975)
  


# Modelo sencillo con Alabama y Arkansas
df1 <- mlda %>%
  filter(year %in% 1970:1983, age >=18,
         age <= 20, state %in% c(1,4))

# Agregamos las Dummies
df1 <- df1 %>%
  mutate(tratamiento = ifelse(state == 1, 1, 0),
         post = ifelse(year >= 1975, 1, 0))


modelodd1 <- lm(mrate ~ tratamiento + 
                  post + tratamiento:post, df1)

summary(modelodd1)


#########################################


modelodd2 <-  lm(mrate ~ legal + state + year, mlda)
summary(modelodd2)
