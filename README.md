# Getting_Cleaning_Data Course Project Assignment

The run_analysis.R script works on files downloaded from the UCI HAR Dataset zip file, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .  
These files should be downloaded and placed in the local R working directory.
The pertinent files are loaded and merged and lookup values for variables are added.
A 'tidy' dataset is then written out as tidyData.txt.

There are detailed comments included in the R script decsribing each step of the loading, cleaning and merging of the data files used.  The data in the Inertial folders is ignored as it is not pertinent to the assignment requirements.

A codebook detailing the experiment data elements and the specific details of the experiemnt is included in this repository.
