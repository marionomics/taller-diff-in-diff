library(stargazer)

# Directly import data from shared google folder into R
data <- readr::read_csv("https://docs.google.com/uc?id=10h_5og14wbNHU-lapQaS1W6SBdzI7W6Z&export=download")
# Or download and import: data <- readr::read_csv("data-difference-in-differences.csv")
stargazer(data.frame(data), type = "html", summary = TRUE, out = "./www/public.html")
write.csv(data, "./data/card_and_krueger_1994.csv")
