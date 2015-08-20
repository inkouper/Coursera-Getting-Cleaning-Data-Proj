##This script does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Takes the data set in step 4, and
##     creates a second, independent tidy data set with the average of each variable 
##     for each activity and each subject.

library(data.table)
library(dplyr)
work_dir <- getwd()
if (work_dir != "C:/Users/Inna/Dropbox/Coursera Data Science/GetData/project/UCI HAR Dataset copy") setwd("C:/Users/Inna/Dropbox/Coursera Data Science/GetData/project/UCI HAR Dataset copy")

## Read and merge test and train sets
xtest_col <- read.table("X_test.txt", header = FALSE, fill = TRUE)
xtrain_col <- read.table("X_train.txt", header = FALSE, fill = TRUE)
tt_merged <- rbind(xtest_col, xtrain_col)

## Check if merging had the right dimensions
if (length(tt_merged) != 561) stop('wrong number of columns in the merged dataset')

## Rename columns
features <- read.table("features.txt")
colnames(tt_merged) <- features$V2

## Select the mean and std measurements
meanstd <- c("mean()", "std()")
tt_merged_extr <- tt_merged[, grep(paste(meanstd, collapse = '|'), names(tt_merged))]
tidyset <- tt_merged_extr[, !grepl("meanFreq", names(tt_merged_extr))]

## Provide activity labels
activity_numbers <- rbind(read.table("y_test.txt"), read.table("y_train.txt"))
activity_labels <- read.table("activity_labels.txt")
a <- activity_labels$V2[activity_numbers$V1]
tidyset_final1 <- cbind(a, tidyset)
setnames(tidyset_final1, "a", "activity")

## write.csv(tidyset_final1, file = "mean_std_measures.csv")

## group by activity and subject and create a final dataset
subjcomb <- rbind(read.table("subject_test.txt"), read.table("subject_train.txt"))
dt <- cbind(subjcomb, tidyset_final1)
dt[,2] = NULL
dtp <- tbl_df(dt)
dtp_grouped %>% group_by(activity, V1) %>% summarise_each(funs(mean))

## save into a file
write.table(dtp_grouped, "tidy.txt", sep="\t", row.name=FALSE)

