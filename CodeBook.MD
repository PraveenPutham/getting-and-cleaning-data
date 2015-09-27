# Getting and Cleaning Data Project


## Source Data
* Source data for this project is at: [Getting and Cleaning Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files
* Activity_Labels.txt
* Features.txt
* Training Data:
	* x_train.txt
	* y_train.txt
	* subject_train.txt
* Test Data:
	* x_test.txt
	* y_test.txt
	* subject_test.txt

## variables
* features - To load the data from features.txt
* activityLabels - To load the data from activity_labels.txt
* meanAndStandardFeatures - To get(grep) only mean and Standard Deviation from features 
* xTrain - To load the x_train.txt but only mean and Standard deviation data alone
* subjectTrain - To load the subject_train
* yTrain - To load the y_train.txt
* train - To Combine the xTrain, SubjectTrain and yTrain
* xTest - To load the x_test.txt but only mean and Standard deviation data alone
* subjectTest - To load the subject_test
* yTest - To load the y_test.txt
* test - To Combine the xTest, SubjectTest and yTest
* mergeData - The combined train and test data
* colNames - Used to rename the colName to rename it in readable format
