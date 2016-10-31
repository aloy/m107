# SLR Example 1
# Math 107

mpg <- read.table("https://dl.dropboxusercontent.com/u/5094866/m217/data/MPGdata.txt", header = TRUE)

## Take a look at the data to make sure everything is OK
head(mpg) # first 6 rows
dim(mpg)  # no. rows, no. columns


## Load the ggplot2 package for graphics
library(ggplot2)

## EDA
## Plot the data and calculate the correlation 
mpg_scatter <- 
  ggplot(data = mpg, mapping = aes(x = Weight, y = MPG)) +
  geom_point() + 
  labs(x = "Weight (lbs)", y = "Fuel economy (mpg)") +
  theme_minimal()

ggsave(mpg_scatter, filename = "mpg_scatterplot.pdf", width = 5, height = 3)

## Calculating the correlation
library(mosaic)
cor(MPG ~ Weight, data = mpg)


## Fit the SLR model
mod <- lm(MPG ~ Weight, data = mpg)
summary(mod)

## Illustrating least squares
fit <- fitted(mod)

ls.df <- data.frame(y.hat = as.numeric(fit), y = mpg$MPG, x = mpg$Weight)
ls.df$ymin <- as.numeric(apply(ls.df, 1, FUN = function(x) min(x["y.hat"], x["y"])))
ls.df$ymax <- as.numeric(apply(ls.df, 1, FUN = function(x) max(x["y.hat"], x["y"])))

least_squares <-
  ggplot(data = mpg, aes(x = Weight, y = MPG)) +  
  geom_linerange(aes(ymin = ymin, ymax = ymax, x = x), data = ls.df, inherit.aes = FALSE, colour = I("gray60")) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Weight (lbs)", y = "Fuel economy (mpg)") +
  theme_minimal()

ggsave(least_squares, filename = "least_squares.pdf", width = 5, height = 3)

## Plot the fitted model
mpg_fitted <- 
  ggplot(data = mpg, mapping = aes(x = Weight, y = MPG)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Weight (lbs)", y = "Fuel economy (mpg)") +
  theme_minimal()

ggsave(mpg_fitted, filename = "mpg_fitted_scatterplot.pdf", width = 5, height = 3)


## Plotting the intercept
intercept <- 
  ggplot(data = mpg, mapping = aes(x = Weight, y = MPG)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE, fullrange=TRUE) +
  geom_point(data = data.frame(Weight = 0, MPG = coef(mod)[1]), shape = 1, size = 4, color = "red") +
  labs(x = "Weight (lbs)", y = "Fuel economy (mpg)") +
  theme_minimal() +
  xlim(-10, 4000)

ggsave(intercept, filename = "intercept.pdf", width = 5, height = 3)


## Extrapolation for the semi

extrapolation <- 
  ggplot(data = mpg, mapping = aes(x = Weight, y = MPG)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE, fullrange=TRUE) +
  labs(x = "Weight (lbs)", y = "Fuel economy (mpg)") +
  theme_minimal() +
  xlim(1500, 20000)

ggsave(extrapolation, filename = "extrapolation.pdf", width = 5, height = 3)



## Using the model for prediction
predict(mod, newdata = data.frame(Weight = 2500))
predict(mod, newdata = data.frame(Weight = 20000))