## Course project - Getting and Cleaning Data
## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## As indicated in the Readme.md file, this script should be located in the "UCI HAR Dataset" directory (set as the working directory)

## Install required packages if missing and load them
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

## 1. Merges the training and the test sets to create one data set.

## Load: activity labels
activity_labels <- read.table("activity_labels.txt")[,2]

## Load: data column names
features_labels <- read.table("features.txt")[,2]

##Load test related Data, add column name for subject file, add column name for features and activity labels -also descriptive label for activities
subject_test <- read.table("test/subject_test.txt")
names(subject_test) <- "Subject_ID"
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
names(X_test) <- features_labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")


##Load train related Data, add column name for subject file, add column name for features and activity labels -also descriptive label for activities
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
names(subject_train) <- "Subject_ID"
names(X_train) <- features_labels
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")

# Bind data: first bind test data and train data separately, then combine altogether test and train data
test_dt<- cbind(subject_test, y_test, X_test)
train_dt <- cbind(subject_train, y_train, X_train)
combined_dt <- rbind(test_dt, train_dt)

## Extracted features containing both MEAN and STD data
relevant <- grepl("mean\\(\\)|std\\(\\)", names(combined_dt))
##Keep the Subject_ID and the descriptive activity label column in the extracted data
## so to have Subject_ID, Activity_ID (numeric) and the descriptive Activity_label
relevant[1:3]<-TRUE
## Extract only the measurements on the mean and standard deviation for each measurement in the combined datatable.
extracted_combined_dt <- combined_dt[, relevant]


## 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##create id for labels
id_labels   = c("Subject_ID", "Activity_ID", "Activity_Label")
##create the labales for the remainding data
labels = setdiff(colnames(extracted_combined_dt), id_labels)

melted_data <- melt(extracted_combined_dt, id = id_labels, measure.vars = labels)
tidy_data <- dcast(melted_data, Subject_ID+Activity_Label ~ variable, mean)

# write the tidy data set to a csv file
write.csv (tidy_data, "tidy_data.csv", row.names=FALSE)







