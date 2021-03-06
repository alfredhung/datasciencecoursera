CODE BOOK

Contents
A. Summary Method
B. Variables 
C. Study Design
----------------------------------------------------------------------------------------------------------------
A. Summary Method

From the original 561 variables of the Features file belonging to the UCI HAR Dataset (Human Activity Recognition Using Smartphones), 66 variables names were extracted that had the mean and standard deviation as measurements.   It is described below the variable names used, its abbreviations and its units. The variable names are left as the original names from the Feature file as they are easily understood by the class audience as they are familiar with them.  Some names are already abbreviated but clear in their interpretation.  They were not spelled out completely as it'd make them cumbersome as column names. Thus the balance is to leave them as they were.  However, they were modified using as guides the Identifiers in Google's R Style Guide (https://google-styleguide.googlecode.com/svn/trunk /Rguide.xml), leaving out punctuation marks and capitalizing the first letter of each word.

B. Variables   

Variable Abbr.	Description
(Units)

subject		One of a group of 30 volunteers within an age bracket of 19-48 years old
activity	One of six activities performed by the subject: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 				SITTING, STANDING, LAYING
Acc (g)		Accelerometer time domain reading with 3-axial raw signals represented by tAcc-XYZ captured at a 		constant rate of 50 Hz
Body (g)	Body acceleration signal separated from the acceleration signal to produce tBodyAcc-XYZ
f (Hertz)	Frequency domain signal. Fast Fourier Transform (FFT) was applied to some of the signals 				described here to produce fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 				fBodyGyroMag, fBodyGyroJerkMag
Gravity (g)	Gravity acceleration signal separated from the acceleration signal to produce tGravityAcc-XYZ
Gyro 		Gyroscope time domain reading with 3-axial raw signals represented by tGyro XYZ captured (radians/second)at a constant rate of 50 Hz
Jerk (g)	Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ) from body linear acceleration and angular 			velocity derived in time
Mag (g)		Magnitude of the Jerk three-dimensional signals were calculated using the Euclidean norm 				(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 	tBodyGyroMag, tBodyGyroJerkMag)
Mean (g)	Mean variable estimated from these signals 					
Std (g)		Standard Deviation variable estimated from these signals
t  (g)		Time domain signal captured at a constant rate of 50 Hz
XYZ (degrees)	XYZ is used to denote 3-axial signals in the X, Y and Z directions

Variable Names (all units in 'g'. But if Gyro measurement then it is radians/second)

1 subject
1 activity
1 tBodyAccMeanX	
2 tBodyAccMeanY	
3 tBodyAccMeanZ	
4 tBodyAccStdX	
5 tBodyAccStdY
6 tBodyAccStdZ
41 tGravityAccMeanX	
42 tGravityAccMeanY
43 tGravityAccMeanZ
44 tGravityAccStdX
45 tGravityAccStdY	
46 tGravityAccStdZ
81 tBodyAccJerkMeanX	
82 tBodyAccJerkMeanY
83 tBodyAccJerkMeanZ
84 tBodyAccJerkStdX
85 tBodyAccJerkStdY
86 tBodyAccJerkStdZ
121 tBodyGyroMeanX 
122 tBodyGyroMeanY 
123 tBodyGyroMeanZ 
124 tBodyGyroStdX 
125 tBodyGyroStdY 
126 tBodyGyroStdZ 
161 tBodyGyroJerkMeanX 
162 tBodyGyroJerkMeanY 
163 tBodyGyroJerkMeanZ 
164 tBodyGyroJerkStdX 
165 tBodyGyroJerkStdY 
166 tBodyGyroJerkStdZ 
201 tBodyAccMagMean
202 tBodyAccMagStd
214 tGravityAccMagMean
215 tGravityAccMagStd
227 tBodyAccJerkMagMean
228 tBodyAccJerkMagStd
240 tBodyGyroMagMean 
241 tBodyGyroMagStd 
253 tBodyGyroJerkMagMean 
254 tBodyGyroJerkMagStd 
266 fBodyAccMeanX
267 fBodyAccMeanY
268 fBodyAccMeanZ
269 fBodyAccStdX
270 fBodyAccStdY
271 fBodyAccStdZ
345 fBodyAccJerkMeanX	
346 fBodyAccJerkMeanY
347 fBodyAccJerkMeanZ
348 fBodyAccJerkStdX
349 fBodyAccJerkStdY
350 fBodyAccJerkStdZ
424 fBodyGyroMeanX 
425 fBodyGyroMeanY 
426 fBodyGyroMeanZ 
427 fBodyGyroStdX 
428 fBodyGyroStdY 
429 fBodyGyroStdZ 
503 fBodyAccMagMean
504 fBodyAccMagStd
516 fBodyBodyAccJerkMagMean	
517 fBodyBodyAccJerkMagStd
529 fBodyBodyGyroMagMean 
530 fBodyBodyGyroMagStd 
542 fBodyBodyGyroJerkMagMean 
543 fBodyBodyGyroJerkMagStd 
 
C. Study Design

The basis of this work came from the data collected from the datasets of the Human Activity Recognition accelerometers from the Samsung Galaxy S smartphone. A full description is available here: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data was obtained from this site:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

In this particular analysis, a R script, run_analysis.R, was created to do the following: 
1.	Merges the training and the test sets to create one data set
1.1.	The background for understanding the project came from the ReadMe, Features, Activity Labels files
1.2.	Downloaded and read the subject test, X test and y test in R. No use was made of the Inertial Signals 		file
1.3.	Extracts only the measurements on the mean and standard deviation for each measurement
1.4.	Identified and extracted all column variables that have the mean and standard deviation
1.5.	Used Rbind function to attach the test and train files
1.6.	Attached the column files of y test and subject test using 'rbind' into X test file to label the rows 			with the subject's ID and its activity
1.7	Attached the column files of y train and subject train using 'rbind' into X train file to label the rows 	with the subject's ID and its activity
1.8 	Uses descriptive activity names to name the activities in the data set
1.9	Replaced the activity numbers with the corresponding activity name of the Feature file
2.	Appropriately labels the data set with descriptive variable names
2.1.	Formatted variable names with naming standards utilized in the R community
2.2.	Ordered the file by subject and then by activity using 'order' function
3.	From the data set in step 4, creates a second, independent tidy data set with the average of each 			variable for each activity and each subject
3.1.	Used the 'aggregate' function to calculate the mean value for each activity and subject
4.	Write the result to a .txt file and push it to Github


