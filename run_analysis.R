library(dplyr)

    ## 1. Merge training and test sets into one dataset -----

##  Read in testing data
subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")

## Make full testing set
all_test <- cbind(subj_test, y_test, x_test)


##  Read in training data
subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

## Make full training set

all_train <- cbind(subj_train, y_train, x_train)


##  Merge data
merge_dat <- rbind(all_test, all_train)

##  Properly label data
colnames(merge_dat) <- c(c("subject", "activity"), features$V2)
##  Read in features.txt
features <- read.table("UCI HAR Dataset/features.txt", row.names = 1)

#colnames(merge_dat)[1:2] <- c("subject", "activity")

    ## 2. Extract only measurments on the mean and standard deviation 
    ##  for each measurement.

dat_filt <- merge_dat[,grepl("mean[(]|std|subject|activity",colnames(merge_dat))]


    ## Use descriptive activity names to name the activities in the data set

##  Read activity labels
act_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt")
#Use match to get an index to replace labels with
map <- match(dat_filt$activity, act_labels$V1)
#Replace
dat_filt$activity <- act_labels$V2[map]

    ## Appropriately labels the data set with descriptive variable names. 
#Use janitor clean names to clean up variable names
dat_filt %>% clean_names()
