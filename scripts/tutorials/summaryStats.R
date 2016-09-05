# loading the data set
HollywoodMovies2011 <- read.csv("HollywoodMovies2011.csv")

# Calculating summary stats for all columns of a data set
summary(HollywoodMovies2011)

# Calculating summary stats for an individual column
summary(HollywoodMovies2011$RottenTomatoes)

# Calculating specific summary statistics

# mean
mean(HollywoodMovies2011$RottenTomatoes)
mean(HollywoodMovies2011$RottenTomatoes, na.rm = TRUE)

# median
median(HollywoodMovies2011$RottenTomatoes, na.rm = TRUE)

# standard deviation
sd(HollywoodMovies2011$RottenTomatoes, na.rm = TRUE)

# quantiles/percentiles
quantile(HollywoodMovies2011$RottenTomatoes, probs = c(.25, .75), na.rm = TRUE)
