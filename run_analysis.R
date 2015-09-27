# Set the Working Directory
setwd("C:\\Praveen\\Coursera\\Getting and Cleaning Data\\Course")

# Download the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "getdata_project_files.zip" , mode="wb", cacheOK = FALSE);

# UnZip the file
unzip("getdata_project_files.zip")

# Set the Working Directory
setwd("C:\\Praveen\\Coursera\\Getting and Cleaning Data\\Course\\UCI HAR Dataset")

# Read the data - feature and activityType
features     = read.table('./features.txt',header=FALSE); 
features[,2] <- as.character(features[,2]);
activityLabels = read.table('./activity_labels.txt',header=FALSE); 
activityLabels[,2] <- as.character(activityLabels[,2]);

# Extract only the data on mean and standard deviation
meanAndStandardFeatures <- grep(".*mean.*|.*std.*", features[,2])
meanAndStandardFeatures.names <- features[meanAndStandardFeatures,2]

# Load the train information for the Mean and Standard Deviation alone
subjectTrain <- read.table('./train/subject_train.txt',header=FALSE);
xTrain <- read.table('./train/x_train.txt',header=FALSE)[meanAndStandardFeatures];
yTrain <- read.table('./train/y_train.txt',header=FALSE);

# Combine the train information
train <- cbind(subjectTrain, yTrain, xTrain);

# Load the test information for the Mean and Standard Deviation alone
subjectTest <- read.table('./test/subject_test.txt',header=FALSE);
xTest <- read.table('./test/x_test.txt',header=FALSE)[meanAndStandardFeatures];
yTest <- read.table('./test/y_test.txt',header=FALSE);

# Combine the test information
test <- cbind(subjectTest, yTest, xTest);


# merge datasets and add labels
mergeData <- rbind(train, test)

#Appropriately labels the data set with descriptive variable names. 
colnames(mergeData) <- c("subject", "activity", meanAndStandardFeatures.names)
colNames <- colnames(mergeData) 
# Cleaning up the variable names
for (i in 1:length(colNames))
{
     colNames[i] <-  gsub("\\()","",colNames[i])
     colNames[i] <-  gsub("-std","StdDev",colNames[i])
     colNames[i] <-  gsub("-mean","Mean",colNames[i])
};

colnames(mergeData) <- colNames;

# creates a second, independent tidy data set with the average of each variable for each activity and each subject
# turn activities & subjects into factors
mergeData$activity <- factor(mergeData$activity, levels = activityLabels[,1], labels = activityLabels[,2]);
mergeData$subject <- as.factor(mergeData$subject);
library(reshape2) # for melt and dcast
mergeData.melted <- melt(mergeData, id = c("subject", "activity"))
mergeData.mean <- dcast(mergeData.melted, subject + activity ~ variable, mean)


write.table(mergeData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

     
