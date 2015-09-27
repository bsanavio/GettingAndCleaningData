---
title: "README - Course Project for "Getting and Cleaning Data""
author: "Barbara"
---

The course project for Getting and Cleaning Data requires to read in the "Human Activity Recognition Using Smartphones" data set, perform an analysis on the data set, and provide as output a tidy data set, following these instructions:

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

1. Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the file, place the folder "UCI HAR Dataset"" in the preferred location, and set the folder "UCI HAR Dataset" as the working directory .
3. Move the R script named run_analysis.R into the "UCI HAR Dataset" folder:
4. run the R script ([run_analysis.R](run_analysis.R)).
Note that it requires the reshape2 and the data.table packages which can be downloaded from CRAN (the script checks for them and requires instalaltion).

The output of the R script is a tidy data set, [tidy_data.csv](tidy_data.csv).**

More Information are provided in the [code book](CodeBook.md).

