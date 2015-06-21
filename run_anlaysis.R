## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

#  Step 01. File Download and Save It
if(!file.exists("./data")) {dir.create("./data")}

remote_file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(remote_file, "./data/galaxy.zip", method="curl")
## after downloading this .zip file, extracted it manually.

#  Step 02. Load realated files and make datasets
library(dplyr)
library(tidyr)
dataTest    <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
dataTrain   <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)

#  Step 03. Q.01: Merges the trating and the test sets to create one dataset.
data        <- bind_rows(dataTrain, dataTest)
rm(dataTrain); rm(dataTest)

#  Step 04. Q.02: Extracts only the measurements on the mean and standard deviation 
#                 for each measurement. 
features    <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE)
colFind     <- grep("mean()|std()", features[,2])
selectData  <- select(data, colFind)
rm(data)

## Step 05. Q.03: Uses descriptive activity names to name the activities in the data set
actTest     <- read.table("./data/UCI HAR Dataset/test/Y_test.txt", header = FALSE)
actTrain    <- read.table("./data/UCI HAR Dataset/train/Y_train.txt", header = FALSE)
actDesc     <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header=FALSE)
actCode     <- rbind(actTrain, actTest)
actName     <- factor(actCode[,1], levels = actDesc[,1], labels = actDesc[,2])
selectData  <- cbind(actName, selectData)
rm(actTrain); rm(actTest); rm(actDesc)

#  Step 06. Q.04: Appropriately labels the data set with descriptive variable names. 
selectFeatures <- features[colFind, 2]
varName      <- c("Activity", as.character(selectFeatures))
colnames(selectData) <- varName
selectData   <- tbl_df(selectData)
rm(colFind); rm(varName)

write.table(selectData, file="./selectData.txt", row.names = FALSE, col.names=TRUE)


#  Step 07. Q.05: From the data set in step 4 (Q.05), creates a second, independent tidy data set 
#                 with the average of each variable for each activity and each subject.

tidyResult <- selectData %>%
        gather(type_mean_std, val, -Activity) %>%
        separate(type_mean_std, into=c("Variable", "Subject", "dir")) %>%
        group_by(Activity, Variable, Subject, dir) %>%
        summarize(Value = mean(val)) %>%
        spread(Subject, Value) %>%
        arrange(desc(Activity)) %>%
        print

write.table(selectData, file="./data/tidyResult.txt", row.names = FALSE)
