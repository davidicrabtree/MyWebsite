#!/bin/bash
# Copy the latest Oregon Medicaid report and figures from the project folder
# into the website. Run after re-rendering the report, then commit and push.
#
#   ./sync_portfolio.sh

set -euo pipefail

SRC="$HOME/Project Portfolio/oregon-medicaid-experiment"
SITE="$(cd "$(dirname "$0")" && pwd)"

cp "$SRC/report.html" "$SRC/report.pdf" "$SITE/static/portfolio/oregon-medicaid/"
cp "$SRC/output/figures/main_effects.png" "$SITE/content/portfolio/oregon-medicaid/featured.png"
cp "$SRC/output/figures/power_curve.png" "$SITE/content/portfolio/oregon-medicaid/power_curve.png"

cd "$SITE"
git status --short static/portfolio content/portfolio
