data2 <- dplyr::select(data, 
                       y_ft_employment_after,
                       y_ft_employment_before,
                       d_nj,
                       x_burgerking,
                       x_kfc,
                       x_roys,
                       x_co_owned,
                       x_st_wage_before,
                       x_st_wage_after,
                       x_closed_permanently,
                       x_southern_nj,
                       x_central_nj,
                       x_northeast_philadelphia,
                       x_easton_philadelphia) %>%
  mutate(x_st_wage_after = case_when(x_closed_permanently == 1 ~ NA_character_, # these stores get an NA
                                     TRUE ~ as.character(x_st_wage_after)),
         x_st_wage_after = as.numeric(x_st_wage_after)) %>%
  na.omit()

data2
