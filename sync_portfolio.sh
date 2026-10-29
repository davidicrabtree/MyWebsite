#!/bin/bash
# Portfolio reports, PDFs, and the figures on each case-study page are served
# from each project's GitHub Pages site, so they update whenever the project is
# pushed. The only local copies are the card thumbnails on the Data Science page
# (featured.png). If a thumbnail figure changes, run this, then commit and push
# the website.
#
#   ./sync_portfolio.sh

set -euo pipefail

PROJ="$HOME/Project Portfolio"
SITE="$(cd "$(dirname "$0")" && pwd)"

cp "$PROJ/oregon-medicaid-experiment/output/figures/main_effects.png" \
   "$SITE/content/portfolio/oregon-medicaid/featured.png"
cp "$PROJ/gss-panel-attrition/output/figures/bias_summary.png" \
   "$SITE/content/portfolio/gss-panel-attrition/featured.png"

cd "$SITE"
git status --short content/portfolio
