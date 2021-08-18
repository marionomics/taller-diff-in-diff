# Table 3: Column 1-3, Row 1 (from left to right)

data %>% group_by(d_nj) %>% 
  summarise(mean.before = mean(y_ft_employment_before, na.rm=TRUE),
            mean.after = mean(y_ft_employment_after, na.rm=TRUE),
            var.before = var(y_ft_employment_before, na.rm=TRUE),
            var.after = var(y_ft_employment_after, na.rm=TRUE),
            n.before = sum(!is.na(y_ft_employment_before)),
            n.after = sum(!is.na(y_ft_employment_after))) %>%
  mutate(se.mean.before = sqrt(var.before/n.before)) %>%
  mutate(se.mean.after = sqrt(var.after/n.after))
