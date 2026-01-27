
### R Script for Installing Packages
This script installs the required R packages, including those from GitHub. Save it as `install_packages.R` in the repo root.

```r
# Install required R packages for the ACCESS-2026 website

# Core packages
install.packages(c(
  "rmarkdown",
  "blogdown",
  "googlesheets4",
  "glue",
  "dplyr",
  "RefManageR",
  "kableExtra",
  "bibtex",
  "rjson",
  "data.table",
  "remotes"
))

# Install slickR from GitHub
remotes::install_github("yonicd/slickR")

# Optional: Install renv for package management
install.packages("renv")
renv::activate()  # Run renv::restore() if renv.lock exists