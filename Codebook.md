# Codebook

## 1. Merges the training and test sets to create one data set.

In the UCI HAR Dataset, the x and y train and test files were read in with the column names determined by features.txt. The train, test, and subject files were combined via `rbind` and then `cbind`. This resulted in a data.frame of 10299 rows and 563 columns. 

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

`select` was used to retain the required measurements. `grep` was used to find columns with the words "mean" or "std". This resulted in a data.frame of 10299 rows and 81 variables.

## 3. Uses descriptive activity names to name the activities in the data set

Activity values were replaced by their long version provided by activity_labels.txt.

## 4. Appropriately labels the data set with descriptive variable names.

A for-loop was used to apply `gsub` to replace certain strings in the column names to provide them with more descriptive variable names. 
    - `Acc` was replaced by `Accelerometer`
    - `Gyro` was replaced by `Gyroscope`
    - `BodyBody` was replaced by `Body`
    - `Mag` was replaced by `Mag`
    - `mean` was replaced by `Mean`
    - `std` was replaced by `STD`
    - `freq` was replaced by `Frequency`
    - `\\.\\.\\.` was replaced by `\\.`
    - any column name beginning with `t` now begins with `Time`
    - any column name beginning with `f` now begins with `Frequency`
    - any column name ending with `\\.\\.` had them removed.

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Using `group_by` and `summarize`, the mean function was applied on each variable for each activity and each subject. The resulting data.frame was 80 rows by 81 variables, and was saved to `tidydata.txt`
