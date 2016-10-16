# Demo creating a sampling distribution

library(ggplot2)
library(dplyr)
library(mosaic)
library(ggthemes)

colleges <- read.csv("colleges2015.csv")

sample1 <- sample_n(colleges, size = 100)


sampling_dsn50 <- 
  do(5000) * {
    sample_n(colleges, size = 50) %>%
      summarize(mean = mean(cost, na.rm = TRUE))
  }

dsn1_mean <- ggplot(data = sampling_dsn50, mapping = aes(x = mean)) +
  geom_histogram(fill = "steelblue", binwidth=250) +
  labs(x = "Average cost of attendance") +
  theme_minimal() +
  xlim(25000, 38000)  + 
  ggtitle("Sampling distribution, n = 50") + 
  geom_vline(xintercept = mean(colleges$cost, na.rm = TRUE))

dsn1 <- ggplot(data = sampling_dsn50, mapping = aes(x = mean)) +
  geom_histogram(fill = "steelblue", binwidth=250) +
  labs(x = "Average cost of attendance") +
  theme_minimal() +
  xlim(25000, 38000)  + 
  ggtitle("Sampling distribution, n = 50")

sampling_dsn100 <- 
  do(5000) * {
    sample_n(colleges, size = 100) %>%
      summarize(mean = mean(cost, na.rm = TRUE))
  }

dsn2 <- ggplot(data = sampling_dsn100, mapping = aes(x = mean)) +
  geom_histogram(fill = "steelblue", binwidth=250) +
  labs(x = "Average cost of attendance") +
  theme_minimal() +
  xlim(25000, 38000) + 
  ggtitle("Sampling distribution, n = 100")


sampling_dsn250 <- 
  do(5000) * {
    sample_n(colleges, size = 250) %>%
      summarize(mean = mean(cost, na.rm = TRUE))
  }

dsn3 <- ggplot(data = sampling_dsn250, mapping = aes(x = mean)) +
  geom_histogram(fill = "steelblue", binwidth=250) +
  labs(x = "Average cost of attendance") +
  theme_minimal() +
  xlim(25000, 38000) + 
  ggtitle("Sampling distribution, n = 250")

ggsave(dsn1_mean, file = "samp_dsn50_mean.pdf", width = 5, height = 3)
ggsave(dsn1, file = "samp_dsn50.pdf", width = 5, height = 3)
ggsave(dsn2, file = "samp_dsn100.pdf", width = 5, height = 3)
ggsave(dsn3, file = "samp_dsn250.pdf", width = 5, height = 3)


# 95% Plug-in interval for n=50
mean(sampling_dsn50$mean)
sd(sampling_dsn50$mean)

