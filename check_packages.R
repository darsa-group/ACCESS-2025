# Check for required R packages

# Load renv
library(renv)

# # Record the current version of renv in the lockfile
# renv::record("renv@1.1.6")

# # Restore renv to ensure it's installed in the project library
# renv::restore(packages = "renv")

# List of required packages
required_packages <- c("rmarkdown", "blogdown", "googlesheets4", "glue", 
                       "dplyr", "RefManageR", "kableExtra", "bibtex", 
                       "rjson", "data.table", "remotes", "slickR", "renv")

# Check if packages are installed
installed_packages <- installed.packages()[, "Package"]
missing_packages <- setdiff(required_packages, installed_packages)

if (length(missing_packages) > 0) {
  cat("Missing packages:\n")
  print(missing_packages)
} else {
  cat("All required packages are installed.\n")
}