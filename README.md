# ACCESS-2026 Website

This repository contains the source for the ACCESS-2026 website, built with Hugo and blogdown.

## Local Installation and Build

### Prerequisites
- Install R (latest stable version from [cran.r-project.org](https://cran.r-project.org/)).
- Install Hugo (version 0.101.0; run `Rscript -e 'blogdown::install_hugo("0.101.0")'` after R setup).
- Install system dependencies (see below for OS-specific instructions).
- Set up environment variables (see explanation below).

### Install Dependencies
1. Run the provided R script to install packages: `Rscript install_packages.R`
2. Install system dependencies using the CLI instructions below.

#### Linux (Ubuntu/Debian)
Run these commands in a terminal:
```sh
sudo apt-get update
sudo apt-get install -y libcurl4-openssl-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev pandoc
```

#### Windows
-  Install pandoc: Download the installer from pandoc.org/installing.html and add it to your PATH.
- For system libraries: These are typically handled by R during package installation. Ensure Rtools is installed (download from cran.r-project.org/bin/windows/Rtools) for compilation support. 

#### Environment Variables
 - `GOOGLE_SERVICE_JSON_KEY`: This is the JSON content of a Google Cloud service account key. To get it:
    - Go to the Google Cloud Console.
    - Create or select a project. 
    - Enable the Google Sheets API. 
    - Create a service account (IAM & Admin > Service Accounts).
    - Generate a JSON key for the service account.- - Copy the JSON content and set it as the env var (e.g., in a .secret file or system env).
- `PEOPLE_GOOGLE_SHEET_ID`: The ID of the Google Sheet containing people data. To get it:
    - Open the Google Sheet in your browser.
    - The ID is the long string in the URL (e.g., after /d/ and before /edit).
    - Share the sheet with the service account email (from the key above) with read access.
    - Set the ID as the env var.

Store these in a `.secret` file (sourced via `source .secret`) to avoid committing sensitive data. Ensure the service account has read-only access to the sheet.

### Build and Serve Locally
``` shell
source .secret && Rscript _preprocess.R && Rscript -e 'blogdown::build_site(build_rmd = TRUE)' && Rscript -e 'blogdown::serve_site()'
``` 

