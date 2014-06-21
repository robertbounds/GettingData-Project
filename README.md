# README.md

## What's contained in this repository
* UCI HAR Dataset (directory of data files)
* run_analysis.R
* tidyData.txt
* CodeBook.md
* README.md

## How the script works
The R script, run_analysis.R, requires the directory titled "UCI HAR Dataset" (as well as its original, unmodified contents) to run through to completion.

1. The first order of business for run_analysis.R is to parse the directory and read the following data files:
  * activity_labels.txt
  * features.txt
  * subject_test.txt
  * X_test.txt
  * y_test.txt
  * subject_train.txt
  * X_train.txt
  * y_train.txt
2. Next the script merges the obtained X data, y data, and subject data. After that, the y and subject data are labeled with appropriate variable names ("ACTIVITY" and "SUBJECT", respectively), and activities are given meaningful names.
3. For the next step, mean and standard deviation information are subset from the merged X data.
4. Then all the data is merged into a single data table, on which some variable name scrubbing occurs.
5. For each activity for each subject, the average of all mean and standard deviation information is taken.  The compact data set just produced forms the tidy data set.
6. Lastly, the run_analysis script writes the tidy data set to the file "tidyData.txt".