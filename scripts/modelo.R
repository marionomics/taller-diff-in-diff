# Modelo

fit2 <- lm((y_ft_employment_after-y_ft_employment_before) ~ 
             d_nj + x_burgerking + x_kfc + x_roys + x_co_owned, 
           data = data2)
summary(fit2)
