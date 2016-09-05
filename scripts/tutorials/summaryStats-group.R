# loading the data set
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# loading dplyr
library(dplyr)

# Calculating summary statistics by group
HollywoodMovies2011 %>%
  group_by(Genre) %>%
  summarize(mean = mean(RottenTomatoes, na.rm = TRUE),
            median = median(RottenTomatoes, na.rm = TRUE),
            sd = sd(RottenTomatoes, na.rm = TRUE),
            iqr = IQR(RottenTomatoes, na.rm = TRUE))
