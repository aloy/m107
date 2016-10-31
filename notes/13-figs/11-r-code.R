# R code for note set 10 - %-tile CIs and CIs vs. testing

# devtools::install_github("rudeboybert/resampledata")
library(ggplot2)
library(dplyr)
library(resampledata)
library(CarletonStats)
library(viridis)
library(resample)
data("Bangladesh")
data("TV")

# Permutation test for mosquitoes
mosquitoes <- read.csv("data/mosquitos.csv")
mosquitoes_perm <- permTest(count ~ treatment, data = mosquitoes, alternative = "less")

mosquitoes_perm_dsn <- 
  ggplot(data = data.frame(stats = mosquitoes_perm), mapping = aes(x = stats)) +
  geom_histogram(fill = "SteelBlue", bins = 30) +
  labs(x = "mean difference (beer - water)") + 
  theme_minimal()

# Permutation test for yawning
yawning <- read.csv("data/yawning.csv")
yawn_perm <- permTest(as.numeric(Response == "Yawn") ~ YawnSeed, data = yawning, alternative = "less")

yawning_perm_dsn <-
  ggplot(data = data.frame(stats = yawn_perm), mapping = aes(x = stats)) +
  geom_histogram(fill = "SteelBlue") +
  labs(x = "difference in proportions (control - seeded)") +
  theme_minimal()

# Bootstrapping basic cable commerical durations
boot_basic_cable <- bootstrap(data = filter(TV, Cable == "Basic"), statistic = mean(Time), R = 10000)
basic_tv_boot <- 
  ggplot(data = as.data.frame(boot_basic_cable$replicates), mapping = aes(x = `mean(Time)`)) +
  geom_histogram(fill = "SteelBlue", bins = 60) +
  labs(x="Sample mean commercial duation") +
  theme_minimal()

# Bootstrapping differences in commercial durations
boot_tv_diff <- bootstrap2(data = TV, statistic = mean(Time), treatment = Cable, R = 10000)

tv_boot <- 
  ggplot(data = as.data.frame(boot_tv_diff$replicates), mapping = aes(x = `mean(Time): Basic-Extended`)) +
  geom_histogram(fill = "SteelBlue", bins = 60) +
  labs(x="Sample mean difference (basic - extended)") +
  theme_minimal()

# Bootstrapping arsenic in groundwater

boot_arsenic <- resample::bootstrap(data = Bangladesh, statistic = mean(Arsenic), R = 10000)

arsenic_boot <- 
  ggplot(data = as.data.frame(boot_dsn$replicates), mapping = aes(x = `mean(Arsenic)`)) +
  geom_histogram(fill = "SteelBlue", bins = 60) +
  labs(x="Sample mean arsenic concentration") +
  theme_minimal()

ggsave(mosquitoes_perm_dsn, file="mosquitoes_perm_dsn.pdf", width = 5, height = 3)
ggsave(yawning_perm_dsn, file="yawning_perm_dsn.pdf", width = 5, height = 3)
ggsave(basic_tv_boot, file="basic_tv_boot.pdf", width = 5, height = 3)
ggsave(tv_boot, file="tv_boot.pdf", width = 5, height = 3)
ggsave(arsenic_boot, file="arsenic_boot.pdf", width = 5, height = 3)


# Adding normal approximations


mosquitoes_density <- 
  ggplot(data = data.frame(stats = mosquitoes_perm), mapping = aes(x = stats)) +
  geom_histogram(fill = "SteelBlue", bins = 30, mapping = aes(x = stats, y = ..density..)) +
  stat_function(fun = dnorm, color = "#ff7f00",
                args = list(mean=mean(mosquitoes_perm), sd=sd(mosquitoes_perm))) + 
  labs(x = "mean difference (beer - water)") + 
  theme_minimal()

yawning_density <-
  ggplot(data = data.frame(stats = yawn_perm), mapping = aes(x = stats)) +
  geom_histogram(fill = "SteelBlue", bins = 30, mapping = aes(x = stats, y = ..density..)) +
  stat_function(fun = dnorm, color = "#ff7f00",
                args = list(mean=mean(yawn_perm), sd=sd(yawn_perm))) + 
  labs(x = "difference in proportions (control - seeded)") +
  theme_minimal()

basic_tv_density <- 
  ggplot(data = as.data.frame(boot_basic_cable$replicates), mapping = aes(x = `mean(Time)`)) +
  geom_histogram(fill = "SteelBlue", bins = 60, mapping = aes(x = `mean(Time)`, y = ..density..)) +
  stat_function(fun = dnorm, color = "#ff7f00",
                args = list(mean=mean(boot_basic_cable$replicates), sd=sd(boot_basic_cable$replicates))) +
  labs(x="Sample mean commercial duation") +
  theme_minimal()

tv_density <- 
  ggplot(data = as.data.frame(boot_tv_diff$replicates), mapping = aes(x = `mean(Time): Basic-Extended`)) +
  geom_histogram(fill = "SteelBlue", bins = 60, mapping = aes(x = `mean(Time): Basic-Extended`, y = ..density..)) +
  stat_function(fun = dnorm, color = "#ff7f00",
                args = list(mean=mean(boot_tv_diff$replicates), sd=sd(boot_tv_diff$replicates))) +
  labs(x="Sample mean difference (basic - extended)") +
  theme_minimal()

arsenic_density <- 
  ggplot(data = as.data.frame(boot_dsn$replicates), mapping = aes(x = `mean(Arsenic)`)) +
  geom_histogram(fill = "SteelBlue", bins = 60, mapping = aes(x = `mean(Arsenic)`, y = ..density..)) +
  stat_function(fun = dnorm, color = "#ff7f00",
                args = list(mean=mean(boot_dsn$replicates), sd=sd(boot_dsn$replicates))) +
  labs(x="Sample mean arsenic concentration") +
  theme_minimal()

ggsave(mosquitoes_density, file="mosquitoes_density.pdf", width = 5, height = 3)
ggsave(yawning_density, file="yawning_density.pdf", width = 5, height = 3)
ggsave(basic_tv_density, file="basic_tv_density.pdf", width = 5, height = 3)
ggsave(tv_density, file="tv_density.pdf", width = 5, height = 3)
ggsave(arsenic_density, file="arsenic_density.pdf", width = 5, height = 3)


### GENERAL NORMAL DISTRIBUTION

normal_dsn <-
  ggplot(data.frame(x = c(-4, 4)), aes(x)) + 
  stat_function(fun = dnorm) +
  theme_minimal() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  labs(y = "density")

ggsave(normal_dsn, file = "normal_density.pdf", width = 5, height = 3)
