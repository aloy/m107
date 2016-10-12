# load packages -----------------------------------------------------
library(openintro)
library(dplyr)
library(xtable)
library(ggplot2)

# load data ---------------------------------------------------------
d = read.csv("teach_stu_rat.csv")

# format data -------------------------------------------------------
# round student-faculty ratio
# relabel public / private

d$rat = round(d$studentfacultyratio, 2)
d$type[d$Private == 1] = "private"
d$type[d$Private == 0] = "public"
d$type = factor(d$type, levels = c("private", "public"))

# summary stats -----------------------------------------------------
sum_tab <- d %>%
  group_by(type) %>%
  summarize(min = round(min(rat), 2),
            Q1 = round(quantile(rat, .25), 2),
            median = round(median(rat), 2),
            Q3 = round(quantile(rat, .75), 2),
            max = round(max(rat), 2),
    mean = round(mean(rat), 2), 
            SD = round(sd(rat), 2), n = n())

print(xtable(sum_tab), include.rownames = FALSE)

# side-by-side box plots of ratio vs. type ---------------------------
ratio_box <- ggplot(data = d, aes(x = factor(type), y = rat)) +
  geom_boxplot() +
  xlab("Type of school") +
  ylab("Student to faculty ratio") +
  coord_flip()

ggsave(ratio_box, file = "ratio_box.pdf", width = 6, height = 3)

ratio_density <- ggplot(data = d, aes(x = rat, fill = factor(type))) +
  geom_density(alpha = 0.5) +
  xlab("Student to faculty ratio") +
  scale_fill_viridis("Type", discrete=TRUE)

ggsave(ratio_density, file = "ratio_density.pdf", width = 6, height = 3)


# load inference function -------------------------------------------

library(CarletonStats)

# randomization -----------------------------------------------------

set.seed(9221632)
perm_dist <- permTest(rat ~ type, data = d)

rand_dist_dot <- ggplot(data = data.frame(x = perm_dist), aes(x = x)) +
  geom_histogram(binwidth = 0.1, fill = "steelblue") +
  xlab("Distribution of simulated differences (public - private)") +
  geom_vline(xintercept = c(-3.75535, 3.75535)) +
  scale_x_continuous(limits = c(-5, 5), breaks = seq(-5, 5, 1)) +
  theme_bw()

ggsave(rand_dist_dot, file = "rand_dist_dot.pdf", width = 5, height = 3)
