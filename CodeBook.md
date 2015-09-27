---
title: "CodeBook"
output: html_document
---
This code book describes the data used in this project, as well as the processing required to create the resulting tidy data set.

### Data Overview
The data are listed in hte Human Activity Recognition database built from the recordings of 30 subjects performing six activities of daily living (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while carrying a waist-mounted smartphone (Samsung Galaxy S smartphone) with embedded inertial sensors.  
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Dataset information:

For each record in the dataset it is provided: 


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:


- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features. Features are normalized and bounded within [-1,1]. Each feature vector is a row on the text file.
- 'activity_labels.txt': Links the class labels with their activity name (6 levels).
- 'train/X_train.txt': Training set (7352 obs. of 561 variables).
- 'train/y_train.txt': Training labels (7352 obs. of 2 variables).
- 'test/X_test.txt': Test set (2947 obs. of 561 variables).
- 'test/y_test.txt': Test labels (2947 obs. of 2 variables).

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt', 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals' and 'test/Inertial Signals' contain raw data that were not used in the script.

### Processing steps

1. All of the relevant data files were read into data frames, appropriate column headers were added, and the training and test sets were combined into a single data set.
2. All feature columns that did not contain the exact string "mean()" or "std()" were removed. This left 66 feature columns, plus 3 ID columns, namely the Subject_ID, Activity_ID, Activity_Label (descriptive label) columns.
3. A tidy data set was created containing the mean of each feature for each subject and each activity. Thus, each subject has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination.
4. The tidy data set was output to a CSV file named tidy_data.csv .
