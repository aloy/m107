# [fit] The Normal
# [fit] Distribution

---

## Let’s quickly look back at many of the randomization and bootstrap distributions that we have seen thus far in the course...

## Think about what these distributions have in common.

---

![](13-figs/mosquitoes_perm_dsn.pdf)

---

![](13-figs/yawning_perm_dsn.pdf)

---

![](13-figs/basic_tv_boot.pdf)

---

![](13-figs/tv_boot.pdf)

---

![](13-figs/arsenic_boot.pdf)

---

# The normal distribution, $$\mathcal{N}(\mu, \sigma)$$

![left 170%](13-figs/normal_density.pdf)

Unimodal and symmetric 
(bell shaped) 
<br>

Total area under the curve is 1

<br>

Follows very strict guidelines about how the data are distributed around the mean

---

# 68-95-99.7 Rule

About 68% of the distribution falls within 1 SD of the mean

![inline](13-figs/normal_density.pdf)

---

# 68-95-99.7 Rule


About 95% falls within 2 SD of the mean

![inline](13-figs/normal_density.pdf)

---


# 68-95-99.7 Rule


About 99.7% falls within 3 SD of the mean

![inline](13-figs/normal_density.pdf)

---

# 68-95-99.7 Rule


It is possible for observations to fall 4, 5, or more standard deviations away from the mean, but this is very rare if the data are nearly normal

![inline](13-figs/normal_density.pdf)

---

![](13-figs/mosquitoes_density.pdf)

---

![](13-figs/basic_tv_density.pdf)

---

![](13-figs/tv_density.pdf)

---

![](13-figs/arsenic_density.pdf)

---

# Working with $$\mathcal{N}(\mu, \sigma)$$

Knowing the mean and standard deviation of a normal distribution allows us to determine

1. What proportion of individuals fall in a specified range <br>

2. What percentile a given individual falls at if you know their data value <br>

3. What data value corresponds to a given percentile

---

Example: Scores on the Stanford-Binet IQ test follow a $$\mathcal{N}(\mu = 100, \sigma = 16)$$

Identify the central 95% of IQ scores.
<br>
<br>
<br>


What proportion of people have an IQ below 52?
<br>
<br>
<br>

---

What is the probability that a randomly selected person has an IQ of at least 100? Of at least 116?

---

What proportion of individuals have IQs between 100 and 132?
<br>
<br>
<br>

What is the 97.5<sup>th</sup> percentile of IQ scores?

---

# Z scores

Formula: $$Z = \frac{\text{observation} - \text{mean}}{\text{SD}}$$
<br>

Interpretation: The number of SDs the observations falls above/below the mean
<br>

When the distribution is normal can we use Z scores to calculate proportions/probabilities/percentiles

---

# Z scores

If $$X \sim \mathcal{N}(\mu, \sigma)$$ and $$Z = \frac{\text{observation} - \text{mean}}{\text{SD}}$$, 

then $$Z \sim \mathcal{N}(0, 1)$$

---

Example: SAT Verbal scores for applicants at a college follow a $$\mathcal{N}(580, 70)$$

What percentage of applicants have a score higher than 650?

---

What percentage of applicants have a score lower than 440?
<br>
<br>
<br>

What percentage of applicants have a score higher than 700?

---

# Normal probabilities in R

![175% right](13-figs/pnorm_area.pdf)

We can calculate lower tail probabilities in R using 

<br>

		pnorm(q, mean, sd)

---

Government data indicate that the average hourly wage for manufacturing workers in the United States is approximately $$\mathcal{N}($18.61, $1.35)$$.

What proportion of manufacturing workers make more than $20/hour?

---

What proportion of manufacturing workers make between $18 and $20/hour?

---

# Normal percentiles in R

![175% right](13-figs/qnorm_sketch.pdf)

We can find percentiles for normal distributions in R using

<br>

		qnorm(p, mean, sd)

---

Government data indicate that the average hourly wage for manufacturing workers in the United States is approximately $$\mathcal{N}($18.61, $1.35)$$.

Find the 90<sup>th</sup> percentile of hourly wages.

---

Find the IQR of hourly wages.