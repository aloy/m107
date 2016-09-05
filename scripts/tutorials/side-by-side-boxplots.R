# Loading the data
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# loading ggplot2
library(ggplot2)

# drawing a boxplot
ggplot(data = HollywoodMovies2011, mapping = aes(x = Genre, y = Budget)) + 
  geom_boxplot() +
  labs(y = "Budget (millions)")

# drawing a boxplot - reordered
ggplot(data = HollywoodMovies2011, 
       mapping = aes(x = reorder(Genre, Budget, median, na.rm = TRUE), y = Budget)) + 
  geom_boxplot() +
  labs(x = "Genre", y = "Budget (millions)")

# drawing a boxplot - reordered + coordinates flipped
ggplot(data = HollywoodMovies2011, 
       mapping = aes(x = reorder(Genre, Budget, median, na.rm = TRUE), y = Budget)) + 
  geom_boxplot() +
  labs(x = "Genre", y = "Budget (millions)") +
  coord_flip()