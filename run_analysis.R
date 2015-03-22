###############################################################
# Getting and cleaning data: Course project
# Author: Har Yash Bahadur
# Short Summary: This script processed the data from wearables.
###############################################################

library(dplyr)
library(tidyr)
library(reshape)

# Download files from: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Description of data here: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" 

# The following files/folders extracted from the UCI dataset, should be in the working directory for script to work.
# "activity_labels.txt" "features.txt"        "features_info.txt"  
# "README.txt"          "test" (dir)               "train" (dir)

# Reads the labels and their respective number 
activity_label_list <- read.table("activity_labels.txt")

# Read featurenames (called features in documentation)
featurenames <- read.table("features.txt")
# Removes unnecessary first column with rownumber
featurenames <- featurenames[,2]


### Reads the test folder ###
# Reads the test-data set into R
testx <- read.table("test/X_test.txt")

# Reads the label number (activity type) for test group
label_test <- read.table("test/y_test.txt")

# Reads the subject number for test group
subjtest <- read.table("test/subject_test.txt")

### Reads the train folder ###
# Reads the train data set into R
trainx <- read.table("train/X_train.txt")

# Reads the subject numbers for train group
subjtrain <- read.table("train/subject_train.txt")

# Reads the activity type for train
label_train <- read.table("train/y_train.txt")

# Attach the vector of /featurenamesfeatures as column-names
# on the data and name the subject and activity vectors

# Removes hyphen from featurenames
featurenames2 <- make.names(featurenames, unique = TRUE)
#head(featurenames2)

# names the variables in train and test
colnames(testx) <- featurenames2
colnames(trainx) <- featurenames2

# rename variables for the activity and subject vectors
names(subjtest) <- "subject"
names(subjtrain) <- "subject"
names(label_test) <- "activity"
names(label_train) <- "activity"

# Puts together data with activity and subjects
testmain <- cbind(subjtest, label_test, testx)
trainmain <- cbind(subjtrain, label_train, trainx)

# Combines the "train" and "test" datasets into one
datacombined <- rbind(testmain, trainmain)

### We now have the entire dataset in datacombined
# select only the variables 'activity', 'subject', and variables with 'mean' and 'std' in their name
sdata <- select(datacombined, activity, subject, contains("mean"), contains("std"))

# label the activities
sdata$activity <- factor(sdata$activity, levels = activity_label_list$V1, labels = activity_label_list$V2)

# Create a new dataset, first group on subject
# then group activity within the subject

gdata <- group_by(sdata, subject, activity)

# Creates the mean for all subjects six different activities.
tidydata <- summarise_each(gdata, funs(mean))

# 30 subjects * 6 activities = 180 rows
# 88 columns containing measurement variables.

# This is the tidy dataset written to a .txt-file
#View(tidydata)
write.table(tidydata, file = "tidyset.txt", row.names = FALSE, sep="\t\t\t\t")
list.files()

# Code to get the variable names for the codebook
varlist <- names(tidydata)
varlist
write.table(names(tidydata))
