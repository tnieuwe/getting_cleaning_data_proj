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

    
    ##Step 4 occurs here, but moving this step earlier helps step 2    
    
##  Read in features.txt
features <- read.table("UCI HAR Dataset/features.txt", row.names = 1)    
    
##  Properly label data
colnames(merge_dat) <- c(c("subject", "activity"), features$V2)



    ## 2. Extract only measurements on the mean and standard deviation 
    ##  for each measurement.

##  Use grepl to pick out mean (note note frequency), standard deviation (std), 
##  the subject name I've given and activity name
dat_filt <- merge_dat[,grepl("mean[(]|std|subject|activity",colnames(merge_dat))]


    ## 3. Use descriptive activity names to name the activities in the data set----

##  Read activity labels
act_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt")
#Use match to get an index to replace labels with
map <- match(dat_filt$activity, act_labels$V1)
#Replace
dat_filt$activity <- act_labels$V2[map]

    ## 4. Appropriately labels the data set with descriptive variable names.---- 

    ## Please see lines 28-34, this code was moved early for ease of grep usage


    ##  5. From the data in the previous step, make an independent tidy data ----
    ##  set with the average of each variable for each activity and each subject

##  I'm not sure if I correctly understand the question, the way I am going to
##  answer it is by making mean for each variable by grouping by both subject
##  and activity, my pardons if this is the wrong interpretation. 


tidy_dat  <- dat_filt %>%
    group_by(subject, activity) %>%
    summarise_all(mean)

write.csv(tidy_dat, file = "tidy_data.csv")
