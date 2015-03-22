# Getting Cleaning Data Course Project Assignment

This repository contains a run_analysis.R script that works on files downloaded from the UCI HAR Dataset zip file, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .  
These files should be downloaded and placed in the local R working directory.
The pertinent files are loaded and merged and lookup values for variables are added as necessary for a clearer understanding of the data.  A 'tidy' dataset is then written out as tidyData.txt.  This file can then be read back into R as a table with read.table("tidyData.txt", header= TRUE).

There are detailed comments included in the R script describing each step of the loading, cleaning and merging of the data files used.  The data in the Inertial folders is ignored as it is not pertinent to the assignment requirements.

A code book detailing the Samsung phone accelerometer and gyroscope experiment data and the work done on the experiment data by the run_analysis.R script is included in the codeBook.txt file.
