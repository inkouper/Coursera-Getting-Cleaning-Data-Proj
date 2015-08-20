# Coursera: Getting and Cleaning Data Project
This repository is for the course project from "Coursera: Getting &amp; Cleaning Data".

# Source dataset
The data for the project came from the Human Activity Recognition Using Smartphones Data Set
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The two main files are X_test.txt and X_train.txt, with each line in both files containing a set of 561 features.
There are 2947 lines in file X_test and 7352 lines in file X_train.

Other files that are needed:
y_test.txt and y_train.txt - each row represents a type of activity (1-6)
subject_test.txt and subject_train.txt - each row represents a subject (1-30)


#Script
The script run_analysis.R does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Takes the data set in step 4, and creates a second, independent tidy data set with the average of each variable
for each activity and each subject.

The script works with a flat folder structure. All files were copied into one folder "UCI HAR Dataset copy".

The resulting set is a table with all observations (test and training) with measurements on the mean and standard deviation (66 variables).
Each column represents a variable from the features set named with a label for that feature and activity names instead of the numbers.
The final resulting set "tidy.txt" is a table that contains averages of each variable for each activity and each subject.

