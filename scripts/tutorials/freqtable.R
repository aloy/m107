# Load the data
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# loading dplyr
library(dplyr)

# calculate a frequency table
HollywoodMovies2011 %>%
  group_by(Genre) %>%
  summarize(freq = n()) %>%
  arrange(desc(freq))

# calculate a relative frequency table
HollywoodMovies2011 %>%
  group_by(Genre) %>%
  summarise(freq = n()) %>%
  mutate(rel.freq = freq / sum(freq))
