# set wd to data folder before running
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# Load ggplot2 package
library(ggplot2)

# Create a bar chart for Genre
ggplot(data = HollywoodMovies2011, mapping = aes(x = Genre)) + 
  geom_bar()

# Order the bars
ggplot(data = HollywoodMovies2011, mapping = aes(x = reorder(Genre, Genre, length))) + 
  geom_bar() +
  labs(x = "Genre")

# Rotate the plot
ggplot(data = HollywoodMovies2011, mapping = aes(x = reorder(Genre, Genre, length))) + 
  geom_bar() + 
  labs(x = "Genre") +
  coord_flip()