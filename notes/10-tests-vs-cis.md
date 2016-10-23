# [fit] Percentile
# [fit] Bootstrap CIs

---

# Arsenic in groundwater

Occurs naturally in the groundwater in Bangladesh
<br>

Groundwater is often used for drinking water in rural areas
<br>

Arsenic poisoning is a serious public health issue

---

# The data

![left inline](10-figs/arsenic_hist.pdf)

		min Q1 median  Q3  max     mean       sd   n
		0.5  6     22 109 2400 125.3199 297.9755 271
		

---

# Bootstrapping arsenic concentrations

![right 180%](10-figs/arsenic_boot.pdf)

Observed  sample mean : 125.3199 

Mean of bootstrap distribution: 125.2212 

Standard error of bootstrap distribution: 18.24569 


---

# Percentile method for bootstrap CIs

To form P•100% bootstrap confidence intervals use the following endpoints:
<br>

Lower endpoint: $$(1 - P)/2$$ percentile
<br>

Upper endpoint: $$1 - (1 - P)/2$$ percentile

---

![300%](10-figs/arsenic_ci90.pdf)

---

![300%](10-figs/arsenic_ci95.pdf)

---

![300%](10-figs/arsenic_ci99.pdf)

---

### 99% CI for $$\mu$$:  82.78694 to 179.2097 $$\mu$$g/L

### A. We are 99%  sure that all arsenic levels will be between 82.79 and 179.21 $$\mu$$g/L.

### B. 99%  of arsenic levels will be between 82.79 and 179.21 $$\mu$$g/L.

### C. We are 99%  sure that the average arsenic levels for this sample will be between 82.79 and 179.21 $$\mu$$g/L.

---

### 99% CI for $$\mu$$:  82.78694 to 179.2097 $$\mu$$g/L

### D. We are 99%  sure that the mean arsenic concentration in the groundwater is between 82.79 and 179.21 $$\mu$$g/L.

### E. We are 99%  sure that the confidence interval for the mean arsenic concentration in the groundwater will be between 82.79 and 179.21 $$\mu$$g/L.

### F. There is a 99% chance that the mean arsenic concentration is between 82.79 and 179.21 $$\mu$$g/L.

---

# Cautions

Percentile intervals should not be used for small samples 
<br>

Rule of thumb: bootstrap distribution should appear to be smooth 
<br>

Applies to the bootstrap in general


---

# [fit] Estimation
# vs
# [fit] Testing

---

# Philosophical differences

Hypothesis testing: goal is to **make a specific decision** about a parameter

<br>

Confidence intervals: goal is to **estimate** a parameter

---

# Connections

Hypothesis tests and confidence intervals at equivalent significance/confidence levels should agree

---

### Connections

---

# 99% CI for $$\mu$$:  82.78694 to 179.2097 $$\mu$$g/L

Consider H<sub>0</sub> = 50 $$\mu$$g/L vs. H<sub>0</sub> ≠ 50

<br><br><br><br>

Consider H<sub>0</sub> = 50 $$\mu$$g/L vs. H<sub>0</sub> > 50