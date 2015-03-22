---
title: "Codebook for Wearable Data Analysis"
author: "haryash"
date: "Sunday, March 22, 2015"
output: html_document
---

##Data source

This dataset is derived from the **"Human Activity Recognition Using Smartphones Data Set"** which was originally made available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data gathering

The variables are gathered by letting 30 persons carry a smartphone for a certain amount of time. The accelerometer and gyroscope in the phone recorded the movements, accelerations and directions 50 times per second. The information was then filtered in order to get useful measures of body movement. For a better technical description see the file features_info.txt as specified in README.txt associated with the dataset.

## Data organization into large dataset

There are two main datasets containing the feature vectors derived from interial measurements. They are held in the two files as below:   
>X_test  - actual data, feature vectors.
>X_train - actual data, feature vectors.

In addition to these datasets there are small datasets that  contain information needed to identify the individuals and activities in the main datasets. These are:
>y_test.txt
>subject_test.txt
>y_train.txt
>subject_train
(See details in README.txt associated with the dataset)

- There is a one-to-one correspondence between the rows of X_test.txt, y_test.txt and subject_test.txt. These are combine using cbind.
- Similarly there is 1-1correspondence between  X_train.txt, y_train.txt and subject_train.txt. These two are combined using cbind.

Finally the two datasets obtained in steps above are combined into one huge dataset using rbind.

The feature vectors are specified in 'features.txt' and more details are given in 'features_info.txt'.
These feature vectors form the column variables of the main datasets, X_test.txt and X_train.txt, and thus also of the combined dataset.

The combined large dataset is a data frame where each feature is named properly as a variable and each row contains information on who (subject) carried the phone and what activity that gave rise to the information.

## Tidy Data creation

### Select 'mean and 'std' variables
Once the data is manipulated into the form of a single large data frame it contains 10299 observations on the 30 subjects having done 6 different activities. The different measures provided are 561 and we are not interested in all of those. Instead we drop all variables that are neither the mean nor the standard deviation of a certain measure at a certain time. We then end up with 86 variables and 10299 observations.

### The small and final data frame
The large dataframe contains information on the 30 subjects, their activities (6 different) and the measurements (86 different). There is multiple measurements for all subjects when they are for example sitting or walking. Next we prepare the tidy data set by using the roup_by and summarise_each functions. We calculate the average of the variables/measurements for a certain person doing a certain activity. Each person does 6 different activities. There are 86 measurements and for each of these we end up with a data frame with six rows for each subject containing the average of each variable that person had recorded. Combining the results fo all thirty peopkle we get the required tidy data set, which is the output of the R script.


## Description of Variables: Codebook of tidy dataset.

### Identity of subjects and activity

"1" "subject" --- The identity of the person in the study, range is [1, 30]   

"2" "activity" --- The activity the person did when measured, range is [1, 6], labels below.

- 1 WALKING
- 2 WALKING_UPSTAIRS
- 3 WALKING_DOWNSTAIRS
- 4 SITTING
- 5 STANDING
- 6 LAYING

### The following measurement variables are included in the tidy dataset

"3" "tBodyAcc.mean...X"   
"4" "tBodyAcc.mean...Y"   
"5" "tBodyAcc.mean...Z"   
"6" "tGravityAcc.mean...X"   
"7" "tGravityAcc.mean...Y"   
"8" "tGravityAcc.mean...Z"   
"9" "tBodyAccJerk.mean...X"   
"10" "tBodyAccJerk.mean...Y"   
"11" "tBodyAccJerk.mean...Z"   
"12" "tBodyGyro.mean...X"   
"13" "tBodyGyro.mean...Y"   
"14" "tBodyGyro.mean...Z"   
"15" "tBodyGyroJerk.mean...X"   
"16" "tBodyGyroJerk.mean...Y"   
"17" "tBodyGyroJerk.mean...Z"   
"18" "tBodyAccMag.mean..."   
"19" "tGravityAccMag.mean..."   
"20" "tBodyAccJerkMag.mean.."   
"21" "tBodyGyroMag.mean.."   
"22" "tBodyGyroJerkMag.mean.."   
"23" "fBodyAcc.mean...X"   
"24" "fBodyAcc.mean...Y"   
"25" "fBodyAcc.mean...Z"   
"26" "fBodyAcc.meanFreq...X"   
"27" "fBodyAcc.meanFreq...Y"   
"28" "fBodyAcc.meanFreq...Z"   
"29" "fBodyAccJerk.mean...X"   
"30" "fBodyAccJerk.mean...Y"   
"31" "fBodyAccJerk.mean...Z"   
"32" "fBodyAccJerk.meanFreq...X"   
"33" "fBodyAccJerk.meanFreq...Y"   
"34" "fBodyAccJerk.meanFreq...Z"   
"35" "fBodyGyro.mean...X"   
"36" "fBodyGyro.mean...Y"   
"37" "fBodyGyro.mean...Z"   
"38" "fBodyGyro.meanFreq...X"   
"39" "fBodyGyro.meanFreq...Y"   
"40" "fBodyGyro.meanFreq...Z"   
"41" "fBodyAccMag.mean.."   
"42" "fBodyAccMag.meanFreq.."   
"43" "fBodyBodyAccJerkMag.mean.."   
"44" "fBodyBodyAccJerkMag.meanFreq.."   
"45" "fBodyBodyGyroMag.mean.."   
"46" "fBodyBodyGyroMag.meanFreq.."      
"47" "fBodyBodyGyroJerkMag.mean.."   
"48" "fBodyBodyGyroJerkMag.meanFreq.."   
"49" "angle.tBodyAccMean.gravity."   
"50" "angle.tBodyAccJerkMean..gravityMean."   
"51" "angle.tBodyGyroMean.gravityMean."   
"52" "angle.tBodyGyroJerkMean.gravityMean."   
"53" "angle.X.gravityMean."   
"54" "angle.Y.gravityMean."   
"55" "angle.Z.gravityMean."   
"56" "tBodyAcc.std...X"   
"57" "tBodyAcc.std...Y"   
"58" "tBodyAcc.std...Z"   
"59" "tGravityAcc.std...X"   
"60" "tGravityAcc.std...Y"   
"61" "tGravityAcc.std...Z"   
"62" "tBodyAccJerk.std...X"   
"63" "tBodyAccJerk.std...Y"   
"64" "tBodyAccJerk.std...Z"   
"65" "tBodyGyro.std...X"   
"66" "tBodyGyro.std...Y"   
"67" "tBodyGyro.std...Z"   
"68" "tBodyGyroJerk.std...X"   
"69" "tBodyGyroJerk.std...Y"   
"70" "tBodyGyroJerk.std...Z"   
"71" "tBodyAccMag.std.."   
"72" "tGravityAccMag.std.."   
"73" "tBodyAccJerkMag.std.."   
"74" "tBodyGyroMag.std.."   
"75" "tBodyGyroJerkMag.std.."   
"76" "fBodyAcc.std...X"   
"77" "fBodyAcc.std...Y"   
"78" "fBodyAcc.std...Z"   
"79" "fBodyAccJerk.std...X"   
"80" "fBodyAccJerk.std...Y"   
"81" "fBodyAccJerk.std...Z"   
"82" "fBodyGyro.std...X"   
"83" "fBodyGyro.std...Y"   
"84" "fBodyGyro.std...Z"   
"85" "fBodyAccMag.std.."   
"86" "fBodyBodyAccJerkMag.std.."   
"87" "fBodyBodyGyroMag.std.."   
"88" "fBodyBodyGyroJerkMag.std.."   


Variables above are the averaged measurements from each subject doing one of the 6 possible activities. The variable names hints about what they are about. Body acceleration is measurements that have derived the part of the body's acceleration that is due to movement. The rest is from gravity as I have understood it and you find measurements on that in variables with GravityAcc in their names.

The set of variables that were estimated (and kept for this assignment) from these signals are:
- mean(): Mean value   
- std(): Standard deviation

't' -> time variable
'f' -> frequency variable after FFT was done.

The capital X, Y and Z indicates the three possible spatial dimensions.

Some specific examples are given below:
- **tBodyAcc.mean...X**, which means the mean value of  **tBodyAcc-mean()-X** for all measurements taken for every activity,subject pair.
-  **tGravityAcc.std...Y**  which means the mean value of    **tGravityAcc-std()-Y** for all measurements taken for every activity,subject pair.

For detauils, please refer to the feature_info.txt file provided with the raw dataset.

## Reference and original documentation

[1]:  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012