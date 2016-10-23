# R code for note set 10 - %-tile CIs and CIs vs. testing

# devtools::install_github("rudeboybert/resampledata")
library(ggplot2)
library(dplyr)
library(resampledata)
library(CarletonStats)
library(viridis)
data("Bangladesh")


# Plots and summary stats
arsenic_hist <- 
  ggplot(data = Bangladesh, mapping = aes(x = Arsenic)) + 
  geom_histogram(fill = "SteelBlue") +
  theme_minimal() +
  labs(x = expression(paste("Arsenic concentration (", 
    mu, g, "/", L, ")", sep="")))
ggsave(arsenic_hist, file = "arsenic_hist.pdf", width = 5, height = 3)

summarize(Bangladesh, min = min(Arsenic),
          Q1 = quantile(Arsenic, .25), 
          median = median(Arsenic),
          Q3 = quantile(Arsenic, .75),
          max = max(Arsenic),
          mean = mean(Arsenic), 
          sd = sd(Arsenic))

boot(Bangladesh$Arsenic)

boot_dsn <- resample::bootstrap(data = Bangladesh, statistic = mean(Arsenic), R = 10000)

boot_dsn$stats

resample::CI.percentile(boot_dsn, probs = c(.005, .995))

arsenic_boot <- 
  ggplot(data = as.data.frame(boot_dsn$replicates), mapping = aes(x = `mean(Arsenic)`)) +
  geom_histogram(fill = "SteelBlue", bins = 60) +
  labs(x="Sample mean arsenic concentration") +
  theme_minimal()

ggsave(arsenic_boot, file="arsenic_boot.pdf", width = 5, height = 3)

arsenic_boot_stats <- as.data.frame(boot_dsn$replicates)
colnames(arsenic_boot_stats) <- "means"
arsenic_boot_stats <- arsenic_boot_stats %>%
  mutate(upper.90CI = means >= quantile(means, .95),
         lower.90CI = means <= quantile(means, .05), 
         upper.95CI = means >= quantile(means, .975),
         lower.95CI = means <= quantile(means, .025), 
         upper.99CI = means >= quantile(means, .995),
         lower.99CI = means <= quantile(means, .005))

arsenic_boot_stats <- arsenic_boot_stats %>%
  mutate(ci90 = ifelse(upper.90CI, TRUE, ifelse(lower.90CI, TRUE, FALSE)),
         ci95 = ifelse(upper.95CI, TRUE, ifelse(lower.95CI, TRUE, FALSE)),
         ci99 = ifelse(upper.99CI, TRUE, ifelse(lower.99CI, TRUE, FALSE)))


arsenic_ci90 <- 
  ggplot(data = arsenic_boot_stats, mapping = aes(x = means, fill = ci90)) +
  geom_histogram(bins = 60) +
  labs(x="Sample mean arsenic concentration") +
  scale_fill_viridis(discrete = TRUE) +
  theme_minimal() +
  theme(legend.position="none") +
  ggtitle("90% bootstrap CI")

arsenic_ci95 <- 
  ggplot(data = arsenic_boot_stats, mapping = aes(x = means, fill = ci95)) +
  geom_histogram(bins = 60) +
  labs(x="Sample mean arsenic concentration") +
  scale_fill_viridis(discrete = TRUE) +
  theme_minimal() +
  theme(legend.position="none") +
  ggtitle("95% bootstrap CI")

arsenic_ci99 <- 
  ggplot(data = arsenic_boot_stats, mapping = aes(x = means, fill = ci99)) +
  geom_histogram(bins = 60) +
  labs(x="Sample mean arsenic concentration") +
  scale_fill_viridis(discrete = TRUE) +
  theme_minimal() +
  theme(legend.position="none") +
  ggtitle("99% bootstrap CI")

ggsave(arsenic_ci90, file="arsenic_ci90.pdf", width = 5, height = 3)
ggsave(arsenic_ci95, file="arsenic_ci95.pdf", width = 5, height = 3)
ggsave(arsenic_ci99, file="arsenic_ci99.pdf", width = 5, height = 3)
