# Investigating probability of making a type I error.

library(CarletonStats)
library(ggplot2)
library(dplyr)
library(viridis)
library(ggthemes)

sfratio_df <- read.csv("teach_stu_rat.csv")
sfratio_df$rat = round(d$studentfacultyratio, 2)
sfratio_df$type[d$Private == 1] = "private"
sfratio_df$type[d$Private == 0] = "public"
sfratio_df$type = factor(d$type, levels = c("private", "public"))


observed_diff <- sfratio_df %>%
  group_by(type) %>%
  summarize(mean = mean(rat)) %>% 
  arrange(desc(type))

observed <- diff(observed_diff$mean)

set.seed(9221632)
null_distribution <- permTest(rat ~ type, data = sfratio_df)

null_df <- data.frame(diff = null_distribution) %>%
  mutate(alpha.1 =  diff <= quantile(diff, .1),
         alpha.05 =  diff <= quantile(diff, .05),
         alpha.01 =  diff <= quantile(diff, .01))

rand_dist_hist1 <- ggplot(data = null_df, mapping = aes(x = diff, fill = alpha.1)) +
  geom_histogram(binwidth = .1) +
  xlab("Distribution of simulated differences") +
  scale_fill_viridis(discrete = TRUE) +
  theme_minimal() +
  ggtitle(expression(paste("Using ",alpha,"= 0.1"))) +
  theme(legend.position="none")
  

rand_dist_hist2 <- ggplot(data = null_df, mapping = aes(x = diff, fill = alpha.05)) +
  geom_histogram(binwidth = .1) +
  xlab("Distribution of simulated differences") +
  scale_fill_viridis(discrete = TRUE) +
  theme_minimal() +
  ggtitle(expression(paste("Using ",alpha,"= 0.05"))) +
  theme(legend.position="none")

rand_dist_hist3 <- ggplot(data = null_df, mapping = aes(x = diff, fill = alpha.01)) +
  geom_histogram(binwidth = .1) +
  xlab("Distribution of simulated differences") +
  scale_fill_viridis(discrete = TRUE) +
  theme_minimal() +
  ggtitle(expression(paste("Using ",alpha,"= 0.01"))) +
  theme(legend.position="none")

ggsave(rand_dist_hist1, file = "rand_dist_hist1.pdf", width = 5, height = 3)
ggsave(rand_dist_hist2, file = "rand_dist_hist2.pdf", width = 5, height = 3)
ggsave(rand_dist_hist3, file = "rand_dist_hist3.pdf", width = 5, height = 3)

  