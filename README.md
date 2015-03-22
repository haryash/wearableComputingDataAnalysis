---
title: "README of Project on Wearable Computing Data Analysis"
author: "haryash"
date: "Sunday, March 22, 2015"
output: html_document
---

# WearableComputingDataAnalysis
Project submission for Course "Getting and Cleaning Data"

This README describes the components involved in the Wearable Computing data analysis:

## The DataSet
- The input raw data for this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
- Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- The following files/folders extracted from the UCI dataset
  'README.txt' - Describes the purpose and contents of the various files and folders in the dataset. Summary below:
  
  'features_info.txt': Shows information about the variables used on the feature vector.
  'features.txt': List of all features.
  'activity_labels.txt': Links the class labels with their activity name.
  
  'train/X_train.txt': Training dataset of feature vectors.
  'train/y_train.txt': Training labels.
  'train/subject_train.txt': Subject ID sets.
  
  'test/X_test.txt': Test dataset of feature vectors.
  'test/y_test.txt': Test labels.
  'test/subject_test.txt': Subject ID sets.


More details about the varaiables are given in the README.txt of the associated data and the codebook.md created for the assignment.

## The codebook.md
This describes the variables, the data, and the transformations that were performed to clean up the data, eventually 
resulting in the 'tidydataset' as the processed ouput, required by the assignment.

## The Script
The script run_analysis.R was developed to process the input raw data, as per requirements of the course project. The script
expects the input data to be in the same directory where the script is run. The eventual output of the script is the tidy data set,
required by the assignment.

## Tidy Data set
This is the final output of the R script run_analysis.R. This dataset is uploaded to the Coursera website.

## Acknowledgements

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
