# Getting-and-cleaning-Data
Course Project for Getting and Cleaning Data

## You should create one R script called run_analysis.R that does the following. 
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script procedures:
- Step 01. File Download and Save It. After downloading this .zip file, extracted it manually.
- Step 02. Load realated files and make datasets
- Step 03. Q.01: Merges the trating and the test sets to create one dataset.
- Step 04. Q.02: Extracts only the measurements on the mean and standard deviation for each measurement. 
- Step 05. Q.03: Uses descriptive activity names to name the activities in the data set
- Step 06. Q.04: Appropriately labels the data set with descriptive variable names. 
- Step 07. Q.05: From the data set in step 4 (Q.05), creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Code book
### Activity
there are 6 kinds of activities. 
- LAYING: Laying
- STANDING: Standing
- SITTING: Sitting
- WALKING_DOWNSTAIRS: Walking_downstairs
- WALKING_UPSTAIRS: Walking_upstairs
- WALKING: walking

### Variable
Every activity has 17 types of variables. Which are:
- fBodyAcc
- fBodyAccJerk
- fBodyAccMag
- fBodyBodyAccJerkMag
- fBodyBodyGyroJerkMag
- fBodyBodyGyroMag
- fBodyGyro
- tBodyAcc
- tBodyAccJerk
- tBodyAccJerkMag
- tBodyAccMag
- tBodyGyro
- tBodyGyroJerk
- tBodyGyroJerkMag
- tBodyGyroMag
- tGravityAcc
- tGravityAccMag

### dir
Some activities have 3 types of direction based on 3-D representation. 

### mean
mean of mean values by Activity, by Variable, by dir. 

## meanFreq
mean of meanFreq values by Activity, by Variable, by dir.

### std
mean of std(stanard deviation) values by Activity, by Variable, by dir.
