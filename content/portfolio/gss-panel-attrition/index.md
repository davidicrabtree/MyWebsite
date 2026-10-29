---
title: "Machine-Learning Attrition Weights for the 2016–2020 General Social Survey Panel"
summary: "Modeling who dropped out of the GSS panel with logistic regression and machine learning, then testing which attrition weights actually remove the bias."
date: 2026-10-28
type: project
tags:
  - Survey Methods
  - Machine Learning
  - Python
links:
  - name: Read the report
    url: https://davidicrabtree.github.io/gss-panel-attrition/report.html
    icon: file-alt
    icon_pack: fas
  - name: PDF
    url: https://davidicrabtree.github.io/gss-panel-attrition/report.pdf
    icon: file-pdf
    icon_pack: fas
  - name: Code
    url: https://github.com/davidicrabtree/gss-panel-attrition
    icon: github
    icon_pack: fab
image:
  caption: ''
  focal_point: Center
  preview_only: true
---

In 2020 the General Social Survey (GSS), run by NORC at the University of Chicago, tried to reinterview people it had first interviewed in 2016 or 2018. Only 42% of eligible respondents took part. NORC's released panel weight adjusts for that loss only by geographic area.

Because the people who left the panel still have their full baseline interview in the data, the right answer is known for any question asked before anyone left. I used that to test whether different attrition weights make the people who stayed look like everyone who started.

## Summary

- **Modeled who dropped out** of the 2016–2020 panel (N = 4,351 eligible respondents) with five models: the logistic regression used in earlier GSS work, the same model plus principal components of the attitude questions, penalized (lasso/ridge) regression, random forests, and gradient boosting, tuned with nested cross-validation.
- **Built attrition weights** from each model and compared them with NORC's released weight and with raking on demographics.
- **Tested every set of weights** on 15 benchmark measures held out of every model, with a cluster bootstrap for uncertainty.
- **Applied the weights to 2020** to see how much the choice of weight changes published estimates.

![Mean gap between the weighted panel and the full baseline sample under each weighting scheme](https://davidicrabtree.github.io/gss-panel-attrition/output/figures/bias_summary.png)

## Findings

**Weights from a machine-learning model that uses the whole questionnaire cut the attrition bias roughly in half; NORC's released weight cuts it by about a tenth.**

1. **Model-based weights beat both NORC's weight and demographic raking.** Across the 15 benchmarks, NORC's weight closes 11% of the gap, raking on demographics 29%, and weights from the five attrition models 37%–53%.
2. **The panel kept more voters, more trusting people, and more liberals.** At baseline, the people who stayed were 7.0 points more likely than all eligible respondents to say most people can be trusted, 6.7 points more likely to have voted, and 3.9 points more likely to call themselves liberal.
3. **The best predictor is not the best weight.** Random forests and gradient boosting ranked dropout best but removed less bias than penalized logistic regression.
4. **Better weights change 2020 estimates but not estimates of change.** Relative to NORC's weight, they lower the 2020 share who say most people can be trusted by 3.6 points and the share with a great deal of confidence in science by 3.1 points. Within-person change from baseline to 2020 barely moves.

![Baseline answers of panel members minus those of all eligible respondents, with and without the best weights](https://davidicrabtree.github.io/gss-panel-attrition/output/figures/benchmark_gaps.png)

## Takeaways

Choosing an attrition model by predictive accuracy alone would pick the wrong one. What matters is whether the model captures the characteristics tied to the outcomes being estimated, and a held-out benchmark test can check that directly. For GSS users, levels of trust and confidence in science from the 2020 panel are likely overstated under the released weight, while estimates of change hold up.

[Read the full report](https://davidicrabtree.github.io/gss-panel-attrition/report.html) for the full methods, model comparison, and data details.

[← Back to Data Science](/data-science/)
