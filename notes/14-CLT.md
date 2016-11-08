#[fit] Normal-based
#[fit] Inference for
#[fit] Population Means

---

# [fit] The Central
# [fit] Limit Theorem

---

# The Central Limit Theorem (CLT)

For a "sufficiently large" random sample, n, the sample mean is well approximated by a normal model:

$$\overline{x} \sim \mathcal{N} \left( \mu, \ \frac{\sigma}{\sqrt{n}} \right)$$

---

# How large is large enough?

It depends on the population distribution...

- If the population distribution is normal, then any sample size works <br><br>

- If the population distribution is not severley skewed, then n > 30 is a good rule of thumb <br><br>

- If the population distribution is severley skewed, then a larger sample size is needed

---

# [fit] Inference
# [fit] using the CLT

---

# Estimating a population mean

$$ \text{statistic} \pm z^* \text{SE}$$

If the parameter of interest is the population mean this becomes

---

# Finding critical values


---



---

# Testing a population mean

Step 1. Set the hypotheses
	H<sub>0</sub>: µ = *null value*
	H<sub>a</sub>: µ < or > or ≠ *null value* <br>

Step 2. Check whether we can use the CLT
Independence: Do we have a random sample?
Sample size/skew: n ≥ 30 (or larger if sample is skewed)

---

# Testing a population mean

Step 3. Calculate a test statistic and a p-value 

$$Z = \frac{\overline{x} - \mu}{SE}$$ , where $$SE = \frac{\sigma}{\sqrt{n}}$$

---

# Testing a population mean

Step 4. Make a decision and interpret it in context of the research question

Use a p-value as strength of evidence against H<sub>0</sub>

If you are working with a set significance level, use the rejection rule

---

# [fit] Inference when 
# [fit] $$\sigma$$ is unknown 

---

Problem:

$$\overline{x} \sim \mathcal{N} \left( \mu, \ \frac{\sigma}{\sqrt{n}} \right)$$

In practice, we usually don't know $$\sigma$$!
 <br>

Solution: 

Plug in an estimate for $$\sigma$$

---

Problem:

Plugging in an estimate introduces additional uncertainty.
<br> <br>

Solution:

We make up for this by using a more “conservative” distribution than the normal distribution.

---

![right 200%](14-clt/tDistCompareToNormalDist.pdf)

# t-distribution

Observations more likely to fall beyond two SDs from the
mean than under the normal distribution

<br> 

Extra thick tails help mitigate effect of a less reliable estimate
for the SE

---

# Properties of the t-distribution

Always centered at 0
<br>

Requires a single parameter to be specified, the degrees of freedom

- one sample: df = n - 1 <br>
- two (independent) samples: 
df = min(n<sub>1</sub> - 1, n<sub>2</sub> - 1)


![right 190%](14-clt/tDistConvergeToNormalDist.pdf)

---

# Estimating a population mean

$$ \overline{x} \pm t^*_{n-1} \frac{\sigma}{\sqrt{n}}$$

---

# Finding critical values


---

# Testing a population mean

1. State the hypotheses <br><br><br>

2. Check the conditions necessary to use the t distribution <br><br><br>

3. Compute the test statistic and p-value  <br><br><br>

4. Make a decision and interpret it in context of the research question


---