# R code for note set 10 - %-tile CIs and CIs vs. testing

# devtools::install_github("rudeboybert/resampledata")
library(ggplot2)
library(dplyr)
library(resampledata)
library(CarletonStats)
library(viridis)
library(resample)

### SHADED AREAS
normal_prob_area_plot <- function(lb, ub, mean = 0, sd = 1, limits = c(mean - 3 * sd, mean + 3 * sd)) {
  x <- seq(limits[1], limits[2], length.out = 100)
  xmin <- max(lb, limits[1])
  xmax <- min(ub, limits[2])
  areax <- seq(xmin, xmax, length.out = 100)
  area <- data.frame(x = areax, ymin = 0, ymax = dnorm(areax, mean = mean, sd = sd))
  (ggplot() + 
    geom_line(data.frame(x = x, y = dnorm(x, mean = mean, sd = sd)), mapping = aes(x = x, y = y)) + 
    geom_ribbon(data = area, mapping = aes(x = x, ymin = ymin, ymax = ymax)) + 
    scale_x_continuous(limits = limits) +
    theme_minimal() +
    labs(x = "Z", y = "density"))
}

critical_values <-
  normal_prob_area_plot(-1.96, 1.96) +
  annotate("text", x = 0, y = 0.15, label = paste("1 -", expression(alpha)), size = 14, color = "white", parse = TRUE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 
  

ggsave(critical_values, file = "critical_values.pdf", width = 5, height = 3)

#### AREAS from t distribution

t_prob_area_plot <- function(lb, ub, df = 2, limits = c(-4.5, 4.5)) {
  x <- seq(limits[1], limits[2], length.out = 100)
  xmin <- max(lb, limits[1])
  xmax <- min(ub, limits[2])
  areax <- seq(xmin, xmax, length.out = 100)
  area <- data.frame(x = areax, ymin = 0, ymax = dt(areax, df = df))
  (ggplot() + 
    geom_line(data.frame(x = x, y = dt(x, df = df)), mapping = aes(x = x, y = y)) + 
    geom_ribbon(data = area, mapping = aes(x = x, ymin = ymin, ymax = ymax)) + 
    scale_x_continuous(limits = limits) +
    theme_minimal() +
    labs(x = "T", y = "density"))
}

critical_values <-
  t_prob_area_plot(-2.16, 2.16) +
  annotate("text", x = 0, y = 0.1, label = paste("1 -", expression(alpha)), size = 14, color = "white", parse = TRUE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 


ggsave(critical_values, file = "critical_values.pdf", width = 5, height = 3)


lower_pvalue <- 
t_prob_area_plot(-Inf, -2) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  ggtitle("pt(q, df)")
ggsave(lower_pvalue, file = "lower_pvalue.pdf", width = 5, height = 3)


upper_pvalue <- 
t_prob_area_plot(2, Inf) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  ggtitle("1 - pt(q, df)")
ggsave(upper_pvalue, file = "upper_pvalue.pdf", width = 5, height = 3)




# Atlanta commute times
library(Lock5Data)
data(package="Lock5Data", "CommuteAtlanta")

commute_atlanta <- 
  ggplot(data = CommuteAtlanta, mapping = aes(x = Time)) + 
  geom_histogram(fill = "steelblue") + 
  theme_minimal() + 
  labs(x = "Time (minutes)")

ggsave(commute_atlanta, file = "commute_atlanta_histogram.pdf", width = 5, height = 3)



# Sleep study
library(Lock5Data)
data(package="Lock5Data", "SleepStudy")

sleep_histogram <- 
  ggplot(data = SleepStudy, mapping = aes(x = WeekdaySleep)) + 
  geom_histogram(fill = "steelblue") + 
  theme_minimal() + 
  labs(x = "Avg. weekday hours of sleep")

ggsave(sleep_histogram, file = "sleep_histogram.pdf", width = 5, height = 3)


mean(SleepStudy$WeekdaySleep)
sd(SleepStudy$WeekdaySleep)

t.test(~WeekdaySleep, data = SleepStudy, )
