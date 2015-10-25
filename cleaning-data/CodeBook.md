#Codebook

#The Data
The script assumes that all necessary data is in a file called UCI on the working directory.
The following files were are used in the script (descriptions from README.txt):
* features.txt - List of all features.
* train/X_train.txt - Training set.
* train/y_train.txt - Training labels.
* test/X_test.txt - Test set.
* test/y_test.txt - Test labels.
* train/subject_train.txt - Each row identifies the subject who performed the activity for each window sample.
* test/subject_test.txt- Each row identifies the subject who performed the activity for each window sample.


#Information about Variables
##Variables used in within the script
* train - data.frame contains the raw data from X_train.txt which contains the Training set.
* test - data.frame contains the raw data from X_test.txt which contains the Test set
* features - data.frame contains the raw data from features.txt which lists all the features.
* Atrain - data.frame contains the raw data from y_train.txt which contains the Training labels.
* Strain - data.frame contains the raw data from subject_train.txt. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* Atest -   data.frame contains the raw data from y_test.txt which contains the Test labels.
* Stest - data.frame contains the raw data from subject_test.txt. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* testsComplete - a data.frame containing the subject, activity and test set data.
* trainComplete - a data.frame containing the subject, activity and training set data.
* allData - a data.frame containing the subject, activity and all measurements for both train and test.
* tidyData - a data.frame which contains only measurements on the mean and standard deviation for each measurement
* labels - a character string vector containing the descriptive activity names for the activities in the data set.
* melted - a data.frame which contains tidyData after it was melted on the "Subject" and "Activity" variables.
* means - a data.frame which contains a tidy data set with the average of each variable for each activity and each subject

##Variables used in within the data sets
From the features.txt file, the main set of variables include statistical functions such as mean and standard deviation on the following:
tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.)

A complete list of all column variables found in the original data set can be found in features.txt in the UCI directory.

The subject column identifies the subject who performed the activity for each window sample.
The activity column identifies the activity being performed.

In total there are 561 variables including Subject and Activities.

#Information about Summary Choices
##Naming Strategy
Column names were created from the features dataframe. The column names were "cleaned up" by using
gsub to remove all characters. The resulting column names were sufficient for the data.

##Variable Selection Method
When extracting only the measurements on the mean and standard deviation for each variable the script chooses to also extract the meanFreq variables. These are kept because they also contain a mean calculation. The grep function is used to select only columns that are mean or standard deviation calculations. It also selects the subject and activity columns.

#Steps to Transform Data
The script:
* Loads data from UCI folder
* Cleans up colNames by using gsub to remove punctuation of the column names found in features.
* Uses cbind to add student and activity data to test and training data.
* Merges the complete training and the test sets (which include student and activity) to create one data set using rbind.
* Extracts only the measurements on the mean and standard deviation for each measurement using grep.(See variable selection method above.)
* Replaces activity numbers in Activity column with descriptive activity names.
* Using melt and dcast creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Writes tidy data to space separated text file called meansTinyData.txt.
