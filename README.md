# Getting and Cleaning Data course project

The project contains the following files:

1. `CodeBook.md` describes the variables, the data, and any transformations or work that I performed to clean up the data
2. `run_analysis.R` uses [accelerometer data from Samsung Galaxy S smartphone](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to run the following analysis
    - Merges the training and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement.
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive variable names.
    - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
3. `tidydata.txt` contains the results of `run_analysis.R`

