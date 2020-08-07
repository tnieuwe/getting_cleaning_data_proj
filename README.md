# getting_cleaning_data_proj
The final project to the getting and cleaning data coursera course.

# Files
+ *run_analysis.R*: The code used to run a tidy analysis on the UCI HAR Dataset
Code works by reading in the data from the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), if you extract the [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the working directory the code script should be able to run without error. The script does the following:
    + Reads in the subject data, x_data, and y_data for training and test datasets.
    + It merges said datasets together
    + It uses the features from `features.txt` to label the columns giving them descriptive names
    + It removes all data except the mean and standard deviation of the features
    + It changes the numeric "activity" into a descriptive characters using `activity_labels.txt`
    + It creates a new tidy dataset, `tidy_data.txt`, which is the average for each factor for each given activity of an individual.
+ *code_book.md*: A codebook for the variables used in `tidy_data.txt`
+ *output*: The folder of the analysis output
    + *tidy_data.txt*: The result of the final step of the analysis