library(dplyr)

setwd("~/R/coursera/Getting and Cleaning Data/")

# Download and unzip
if (!file.exists("data.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip("data.zip") 
}

setwd("~/R/coursera/Getting and Cleaning Data/UCI HAR Dataset/")

# 1. Merges the training and test sets to create one data set.

features <- read.table("features.txt", stringsAsFactors=FALSE)[,c(2)]
activities <- read.table("activity_labels.txt", stringsAsFactors=FALSE)[,2]
subject_test <- read.table("test/subject_test.txt", col.names = "Subject")
x_test <- read.table("test/X_test.txt", col.names = features)
y_test <- read.table("test/y_test.txt", col.names = "Activity")
subject_train <- read.table("train/subject_train.txt", col.names = "Subject")
x_train <- read.table("train/X_train.txt", col.names = features)
y_train <- read.table("train/y_train.txt", col.names = "Activity")
S <- rbind(subject_train, subject_test)
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
merged <- cbind(S, Y, X)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

tidy <- merged %>%
    select(Subject, Activity, grep("mean|std", names(merged)))

# 3. Uses descriptive activity names to name the activities in the data set

tidy$Activity <- activities[tidy$Activity]

# 4. Appropriately labels the data set with descriptive variable names.

replacements <- data.frame("existing" =    c("Acc",           "Gyro",      "BodyBody", "Mag",      "^t",    "^f",        "mean", "std", "freq",      "\\.\\.\\.", "\\.\\.$"),
                           "replacement" = c("Accelerometer", "Gyroscope", "Body",     "Magnitude", "Time", "Frequency", "Mean", "STD", "Frequency", "\\.",       ""))
for (i in 1:nrow(replacements)) {
    names(tidy) <- gsub(replacements[i, "existing"], replacements[i, "replacement"], names(tidy))
}

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydata <- tidy %>% 
    group_by(Subject, Activity) %>% 
    summarize_all(mean)
setwd("~/R/coursera/Getting and Cleaning Data/")
write.table(tidydata, "tidydata.txt", row.name=FALSE)
