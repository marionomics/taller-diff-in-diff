mlda <- haven::read_dta("data/deaths.dta")

head(mlda)

library(dplyr)

# Modelo sencillo con Alabama y Arkansas
df1 <- mlda %>%
  filter(year %in% 1970:1983, age >=18,
         age <= 20, state %in% c(1,5))
df1 <- df1 %>%
  mutate(tratamiento = ifelse(state == 1, 1, 0),
         post = ifelse(year >= 1975, 1, 0))
modelodd1 <- lm(mrate ~ tratamiento + 
                  post + tratamiento:post, df1)

summary(modelodd1)


#########################################
