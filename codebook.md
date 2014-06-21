# CodeBook.md

3) a codebook that describes the variables, the data, and any transformations or work that you performed to clean
up the data called CodeBook.md.

## Data
Data of various types can be found in this dataset.  Except for SUBJECT and ACTIVITY data, all remaining variables have numeric data bounded between -1 and 1.  SUBJECT data are integer values corresponding to each of the 30 testing and training subjects.  ACTIVITY data are character vectors for names of activities.  The names of the remaining variables are either prefixed with a 't' to denote a measurement in the time domain, or prefixed with an 'f' to denote a measurement in the frequency domain.  'Acc' is abbreviated for accelerometer, and 'Gyro' is short for gyroscope.  Each variable will contain either 'mean' or 'std' in its name to specify whether it is a mean or standard deviation value.  Some variables will be suffixed with a '.X', '.Y' or '.Z' to describe the signal sample in the X, Y or Z direction.

## Variables
For each pattern: .XYZ denotes 3-axial signals in each X, Y and Z direction.
* SUBJECT
* ACTIVITY
* tBodyAcc.mean.XYZ
* tGravityAcc.mean.XYZ
* tBodyAccJerk.mean.XYZ
* tBodyGyro.mean.XYZ
* tBodyGyroJerk.mean.XYZ
* tBodyAccMag.mean
* tGravityAccMag.mean
* tBodyAccJerkMag.mean
* tBodyGyroMag.mean
* tBodyGyroJerkMag.mean
* fBodyAcc.mean.XYZ
* fBodyAccJerk.mean.XYZ
* fBodyGyro.mean.XYZ
* fBodyAccMag.mean
* fBodyAccJerkMag.mean
* fBodyGyroMag.mean
* fBodyGyroJerkMag.mean
* tBodyAcc.std.XYZ
* tGravityAcc.std.XYZ
* tBodyAccJerk.std.XYZ
* tBodyGyro.std.XYZ
* tBodyGyroJerk.std.XYZ
* tBodyAccMag.std
* tGravityAccMag.std
* tBodyAccJerkMag.std
* tBodyGyroMag.std
* tBodyGyroJerkMag.std
* fBodyAcc.std.XYZ
* fBodyAccJerk.std.XYZ
* fBodyGyro.std.XYZ
* fBodyAccMag.std
* fBodyAccJerkMag.std
* fBodyGyroMag.std
* fBodyGyroJerkMag.std

## Transformations and cleaning operations
To read how the data was normalized and transformed (using Fast Fourier) before it was compiled in the data files, read feature_info within the UCI HAR Dataset folder.

My data cleaning operations include:
* removing the number column from the features file.
* carefully row binding similar data (X with X, y with y, subject with subject) before column binding all into one data set.
* X data was named by the given features list.
* y data was named "ACTIVITY", and later given meaningful observation names.
* subject data was named "SUBJECT".
* subsetting the data for exact matches of "mean()" and "std()" to find the columns of mean and standard deviation data.  This was done so to keep variable info like "MeanFreq()" out of my tidy data set.
* merging data into a single tabular data object using rbind and cbind in an effort to minimize sorting problems.
* removing punctuation symbols "()" and "-" from feature names, and inserting "." to help separate name components.
* averaging all mean and standard deviation columns.
* updating the first and second columns with names "SUBJECT" and "ACTIVITY"
* removing columns duplicated from use of aggregate function.
* ordering the data table by SUBJECT ID