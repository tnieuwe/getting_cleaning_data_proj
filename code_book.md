# Code Book for tidy_data.txt


## Variable names are based on the original raw data factor names, the below section is taken directly from the raw codebook

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*note:* These are all normalized numerics with values between -1 and 1.

+ tBodyAcc-XYZ
+ tGravityAcc-XYZ
+ tBodyAccJerk-XYZ
+ tBodyGyro-XYZ
+ tBodyGyroJerk-XYZ
+ tBodyAccMag
+ tGravityAccMag
+ tBodyAccJerkMag
+ tBodyGyroMag
+ tBodyGyroJerkMag
+ fBodyAcc-XYZ
+ fBodyAccJerk-XYZ
+ fBodyGyro-XYZ
+ fBodyAccMag
+ fBodyAccJerkMag
+ fBodyGyroMag
+ fBodyGyroJerkMag

## Variables estimated from the signals are below
+ *mean()*: Refers to the mean value of the readings
+ *std()*: Refers to the standard deviation of the readings

## Differences from original codebook below
Other added codes:
+ *subject*: The number that represents the subjects ID
    + ranges from 1-30, should be considered a factor
+ *activity*: The activity the individual was performing which could be:
    + LAYING
    + SITTING
    + STANDING
    + WALKING
    + WALKING_DOWNSTAIRS
    + WALKING_UPSTAIRS


The codebook for `tidy_data.txt` is the same as above, but for each individual in each activity we took the average of their value, for example, tBodyAcc-std()-X is the average standard deviation time domain body acceleration signals for the X axis of the given sample individual and activity. Therefore any value is the average of that value for the individual and activity.
