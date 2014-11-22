##Getting and Cleaning Data

This project takes a data collected from Samsung Galaxy S smartphone accelerometers and cleans the data into a tidy data set.  The data used for this project can be found at the below link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Goals of Project

The goals of this projects are to create a clean dataset from the above mentioned data that accomplishes the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

###Program Walkthrough

1. Download the .zip file from the above mentioned link.
2. Unzip the file and save it to your working directory.
3. Install the data.frame and plyr packages, if not already done so
4. Run the file run_analysis.R to execute the code.

###Repository Contents

This repository contains three files:

1. run_analysis.R
2. README.md
3. Codebook.md