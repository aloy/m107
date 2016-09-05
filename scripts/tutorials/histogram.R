# Loading the data
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# loading ggplot2
library(ggplot2)

# drawing a histogram
ggplot(data = HollywoodMovies2011, mapping = aes(x = Budget)) + 
  geom_histogram(binwidth = 10, color = "gray20") +
  labs(x = "Budget (millions)")