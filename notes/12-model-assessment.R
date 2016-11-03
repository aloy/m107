
library(alr4)
library(ggplot2)
library(car)
library(mosaic)
data(UBSprices)

# EDA
scatter <- 
  ggplot(data = UBSprices, mapping = aes(x = bigmac2003, y = bigmac2009)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Price in 2003 (min. labor)", y = "Price in 2009 (min. labor)") +
  theme_minimal()
ggsave(scatter, filename = "12-figs/ubs-scatterplot.pdf", heigh = 3, width = 5)

cor(bigmac2009 ~ bigmac2003, data = UBSprices)


# Model fitting
bigmac.lm <- lm(bigmac2009 ~ bigmac2003, data = UBSprices)
summary(bigmac.lm)


# Bootstrapping the slope
bigmac.boot <- Boot(bigmac.lm, R = 999)
summary(bigmac.boot)
confint(bigmac.boot, type = "perc", level = .95)

pdf(file = "12-figs/bootstrap-hist.pdf", width = 8, height = 4)
hist(bigmac.boot, col = "gray")
dev.off()

# Residual plot

resid_plot <- 
  ggplot(data = bigmac.lm, mapping = aes(x = .fitted, y = .resid)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_point() +
  labs(x = "Fitted values", y = "Residuals") +
  theme_minimal()

ggsave(resid_plot, filename = "12-figs/ubs_resid_plot.pdf", heigh = 3, width = 5)

resid_hist <-
  ggplot(data = bigmac.lm, mapping = aes(x = .resid)) +
  geom_histogram(bins = 15, fill = "steelblue") +
  labs(x = "Residuals") +
  theme_minimal()

ggsave(resid_hist, filename = "12-figs/ubs_resid_hist.pdf", heigh = 3, width = 5)


