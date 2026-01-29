@echo off
REM Load environment variables from .secret file
for /f "delims== tokens=1,2" %%A in (.secret) do set %%A=%%B

@REM REM Run the build and serve commands
@REM Rscript _preprocess.R && Rscript -e "blogdown::build_site(build_rmd = TRUE)" && Rscript -e "blogdown::serve_site()"