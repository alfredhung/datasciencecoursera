This project collects, works with, and cleans the data set related to the Human Activity Recognition Using Smartphones. The description can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

- To get the data for the project, set the working directory you want to use then download.file() for:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- Unzip the file. You will need to point the directory to the UCI HAR Dataset folder to read the features and activity_labels files. It's recommended to read the README file beforehand

- To read the files for test results, point the directory to the "test" file, then to read the files for train results, point the directory to the "train" file. 

- Run the R script "run_analysis.R" 

- It'll do the following:

  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for         each measurement. 
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive variable names. 
  - From the data set in step 4, creates a second, independent tidy data set     with the average of each variable for each activity and each subject.

- It's also necessary to load the package reshape2

