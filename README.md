# README.md

## What's contained in this repository
* UCI HAR Dataset (directory of data files),
* run_analysis.R
* tidyData.txt
* CodeBook.md
* README.md

## How the script works
The R script, run_analysis.R, must occupy the same directory as the directory titled "UCI HAR Dataset" to run through to completion.

1. The first order of business for run_analysis.R is to parse the directory and read the following data files:
  * features.txt (contains variable names)
  * subject_test.txt (integer subject IDs)
  * X_test.txt (variable observation data for test subjects)
  * y_test.txt (activity values, corresponding names found in activity labels)
  * subject_train.txt (integer subject IDs)
  * X_train.txt (variable observation data for training subjects)
  * y_train.txt (activity values)
2. Next the script merges the obtained X data, y data, and subject data. After that, the y and subject data are labeled with appropriate variable names ("ACTIVITY" and "SUBJECT", respectively), and activities are given meaningful names.
3. For the next step, mean and standard deviation information are subset from the merged X data.
4. Then all the data is merged into a single data table, on which some variable name scrubbing occurs.
5. For each activity for each subject, the average of all mean and standard deviation information is taken.  The compact data set just produced forms the tidy data set.
6. Lastly, the run_analysis script writes the tidy data set to the file "tidyData.txt".

### Dataset source:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[Link to data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)