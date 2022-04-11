---
output:
  pdf_document: default
  html_document: default
---
---
title: "README.md"
author: "Kevin Glass"
date: "3/30/2022"
output:
  pdf_document: default
  html_document: default

# R files required to run_analysis

The following scripts are used to perform the analyses on the UCI HAR Dataset.

  Script name             | Script Purpose
------------------------- | -------------------------
scripts/run_analysis.R    | This script runs the data analysis pipeline. Calls functions to rename the original variable names, merge the training and testing data into a single table, and creates the tidied Mean and STD table. This data is printed to generated_files/mean_std_files.csv
scripts/parse_features.R  | This script performs the varialbe renaming functions. At this point, it only implements a portion of the renaming scheme defined in the Code Book. But it does demonstrate how I renamed variable names.
scripts/utilities.R       | The utilities.R file contains some support mechanisms, like generating a vector of file names needed for the project and renaming the Activity encodings to text
scripts/merge_complete.R  | This script reads and merges the training and test data sets.


# Tidy Data
The completed data file is stored in generated_files/mean_std_files.csv

### Execute the code
To execute the code, types data <- pipeline("UCI HAR Dataset/")
