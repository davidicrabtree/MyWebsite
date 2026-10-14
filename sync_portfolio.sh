#!/bin/bash
# The Oregon Medicaid report, PDF, and the figures on its case-study page are
# served from the project's GitHub Pages site, so they update whenever the
# project is pushed. The one local copy is the thumbnail shown on the Data
# Science page (featured.png). If the main-effects figure changes, run this,
# then commit and push the website.
#
#   ./sync_portfolio.sh

set -euo pipefail

SRC="$HOME/Project Portfolio/oregon-medicaid-experiment"
SITE="$(cd "$(dirname "$0")" && pwd)"

cp "$SRC/output/figures/main_effects.png" "$SITE/content/portfolio/oregon-medicaid/featured.png"

cd "$SITE"
git status --short content/portfolio
