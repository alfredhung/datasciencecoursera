## This program collects, works with and cleans the data set related to the Human Activity Recognition Using Smartphones.
## The data comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Reads the variable names and activity labels
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

## Reads the values of the test sets and train sets
xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
subjtest <- read.table("subject_test.txt")
xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")
subjtrain <- read.table("subject_train.txt")

## Merges the training and the test sets to create one data set
mergedfile <- rbind(xtrain,xtest)

## Extracts only the measurements on the mean and standard deviation for each measurement
meanstdvars <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) ## Searches for row numbers of vars with mean and std suffix
meanstdfile <- mergedfile[, meanstdvars]  ## Selects chosen rows of mean and std vars

## Attaches activity columns of train and test tables
activitycol <- rbind(ytrain, ytest)

## Uses descriptive activity names to name the activities in the data set
activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2]))) ## Joins words without underscores or spacing
activitycol[,1] = activity[activitycol[,1], 2] ## Substitutes activity numbers with activity names
names(activitycol) <- "activity"  ## Writes column heading

## Attaches subject columns of train and tests tables
subjectcol <- rbind(subjtrain, subjtest)
names(subjectcol) <- "subject"

## Appropriately labels the data set with descriptive variable names
names(meanstdfile) <- features[meanstdvars, 2]

## Attaches activity column to variables table
meanstdfile <- cbind(activitycol, meanstdfile)

## Attaches subject column to variables table
meanstdfile <- cbind(subjectcol, meanstdfile)

## Orders table by subject then activity
orderedfile <- meanstdfile[order(meanstdfile$subject, meanstdfile$activity),]

## Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject
avgactsubjfile <- aggregate(.~ activity + subject, data = orderedfile, mean)

## Writes result to file
write.table(avgactsubjfile, file = "HARUS_tidyset.txt", row.name = FALSE)
