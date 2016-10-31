# [fit] Correlation &
# [fit] Regression

---

# Fuel economy data

Many factors go into determining what gas mileage a car will achieve

<br>

It's generally understood that heavier cars will get worse fuel economy, but it is not clear how much of an increase in weight will lead to a decrease in
fuel economy

---

![left 175%](11-figs/mpg_scatterplot.pdf)

# Scatterplots

Direction

<br>

Strength

<br>

Form/trend

<br>

Unusual features

---

# Correlation

A numerical measure of the strength and direction of a linear association between two quantitative variables.

<br>

$$r = \sum \left(\frac{x - \overline{x}}{s_x}\right) \left(\frac{y - \overline{y}}{s_y}\right)$$

---

Using R, we find r = -0.71

![inline](11-figs/mpg_scatterplot.pdf)

		library(mosaic)
		cor(MPG ~ Weight, data = mpg)



---

![inline](11-figs/posNegCorPlots.pdf)

---

# Beware of nonlinearity

![inline](11-figs/corForNonLinearPlots.pdf)

---

# Properties

1. -1 ≤ r ≤ 1 <br>

2. Sign indicates direction <br>

3. The closer r is to $$\pm$$1, the stronger the association <br>

4. Unitless <br>

5. Does not depend on the units of measurement <br>

6. The correlation between x and y is the same as the correlation between y and x

---

# Calibrating your eyes


[mih5.github.io/statapps/correlation_game/correlation_game.html](http://mih5.github.io/statapps/correlation_game/correlation_game.html)

<br>

[guessthecorrelation.com](http://guessthecorrelation.com/)

---

# Cautions

1. Correlation can be heavily influenced by outliers. Don’t just look at the correlation! Always plot your data! <br>

2. r = 0 indicates that there is no linear association between the two variables, but the variables could still be associated! Always plot your data! <br>

3. Correlation does not imply causation! Remember to think!

---

# Analytic goal

1. Describe the relationship between weight and fuel economy
<br> <br>

2. Predict fuel economy based on a vehicle's weight


---

# Fitted regression equation

$$\widehat{y} = b_0 + b_1 x$$


---

# Least squares (LS) regression line

Residuals are the leftovers from the model fit: 

$$e_i = y_i - \widehat{y}_i$$


The LS regression line minimizes the sum of the squared residuals: 

$$\sum e_i^2 = \sum \left( y_i - \widehat{y}_i \right)^2$$

---

![](11-figs/least_squares.pdf)

---
		mod <- lm(MPG ~ Weight, data = mpg)
		summary(mod)


		Call:
		lm(formula = MPG ~ Weight, data = mpg)

		Residuals:
		     Min       1Q   Median       3Q      Max 
		-12.7011  -3.3404  -0.5987   2.3588  16.0605 

		Coefficients:
		              Estimate Std. Error t value Pr(>|t|)    
		(Intercept) 51.5871689  1.4835394   34.77   <2e-16 ***
		Weight      -0.0098334  0.0005749  -17.11   <2e-16 ***
		---
		Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

		Residual standard error: 4.723 on 287 degrees of freedom
		Multiple R-squared:  0.5048,	Adjusted R-squared:  0.5031 
		F-statistic: 292.6 on 1 and 287 DF,  p-value: < 2.2e-16

---

# Interpreting the slope

For each unit increase in x, y is expected to be higher/lower on average by the slope.

---

# Interpreting the intercept

When x = 0, y is expected to equal the intercept.

---

# The LS regresion line **always** passes through $$(\overline{x}, \overline{y})$$

![inline](11-figs/mean.pdf)

---

# Predict

How would we use the model to predict the fuel economy for a car weighing 2,500 lbs?

<br>

How do we interpret this number?

---

# Predict

How would we use the model to predict the fuel economy for a semi weighing 20,000 lbs? 

<br>

Does this prediction make sense?

---

# Don't extrapolate

![inline](11-figs/extrapolation.pdf)

---

Sometimes the intercept might be an extrapolation: useful for adjusting the height of the line, but meaningless in the context of the data.

![inline](11-figs/intercept.pdf)