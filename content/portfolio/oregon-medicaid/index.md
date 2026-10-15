---
title: "What Did Medicaid Do? Re-examining the Oregon Health Insurance Experiment"
summary: "A rebuild of a landmark randomized study of health insurance (NEJM, 2013) in Python and R, plus a check of how well its evidence supports its headline claims."
date: 2026-10-14
type: project
tags:
  - Causal Inference
  - Python
  - R
links:
  - name: Read the report
    url: https://davidicrabtree.github.io/oregon-medicaid-experiment/report.html
    icon: file-alt
    icon_pack: fas
  - name: PDF
    url: https://davidicrabtree.github.io/oregon-medicaid-experiment/report.pdf
    icon: file-pdf
    icon_pack: fas
  - name: Code
    url: https://github.com/davidicrabtree/oregon-medicaid-experiment
    icon: github
    icon_pack: fab
image:
  caption: ''
  focal_point: Center
  preview_only: true
---

In 2008, Oregon expanded Medicaid by lottery, creating one of the few randomized tests of what health insurance does. The study's best-known paper (Baicker et al. 2013, *New England Journal of Medicine*) found that Medicaid reduced depression and catastrophic medical spending but had no detectable effect on blood pressure, and it has been widely cited in debates over health policy.

I rebuilt that analysis from the public-use data, reproduced its headline estimates, and asked how well the evidence supports the way the results are described.

## Summary

- **Reproduced the published results** in Python (pandas, statsmodels, linearmodels), with a parallel implementation in R that matches the Python results on every table.
- **Followed the original design:** lottery-based instrumental variables, survey weights, and household-clustered standard errors.
- **Checked the experiment:** response rates and covariate balance between lottery winners and losers.
- **Extended the analysis** with power calculations, minimum detectable effects, and checks of specific claims in the paper.

![Effects of Medicaid coverage on three outcomes, with 95% confidence intervals](https://davidicrabtree.github.io/oregon-medicaid-experiment/output/figures/main_effects.png)

## Findings

**Some of the paper's summary claims go further than its evidence.**

1. **The blood pressure "null" can't tell no effect from a meaningful one.** The study had a 67% chance of detecting a reduction the authors themselves call clinically significant. Its 95% confidence interval runs from a 44% reduction to a 27% increase.
2. **The positive findings are stated more precisely than the data allow.** "Nearly eliminated" catastrophic spending describes a point estimate whose interval is consistent with a reduction as small as 13%.
3. **The paper misstates its own definition of elevated blood pressure.** The published results use systolic *or* diastolic thresholds; the table footnote says *and*. Under the stated definition the control-group rate would be 7.0%, not 16.3%.
4. **Covariate adjustment can't recover the lost precision.** Pre-lottery characteristics shrink standard errors by only about 1%.

![Statistical power to detect reductions in elevated blood pressure](https://davidicrabtree.github.io/oregon-medicaid-experiment/output/figures/power_curve.png)

## Takeaways

A null result from an underpowered study is not evidence of no effect, and a significant result is not evidence of an effect as large as its point estimate.

[Read the full report](https://davidicrabtree.github.io/oregon-medicaid-experiment/report.html) for the full methods, balance checks, and replication details.

[← Back to Data Science](/data-science/)
