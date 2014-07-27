#read in test and training data from downloaded file
#(the UCI_HAR_Dataset folder needs to be located in the working directory)
inTrain <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
trainLabels <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
trainSubjects <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
inTest <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
testLabels <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
testSubjects <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")



#add activity labels and subject IDs as extra columns of data
inTrain$label <- trainLabels$V1
inTrain$subject <- trainSubjects$V1
inTest$label <- testLabels$V1
inTest$subject <- testSubjects$V1

#read in feature labels
featureLabels <- read.table("./UCI_HAR_Dataset/features.txt")

#name each column using activity labels
names(inTrain)[562] <- "label"
names(inTrain)[563] <- "subject"
names(inTest)[562] <- "label"
names(inTest)[563] <- "subject"


#merge training and test data
mergedData <- merge(inTrain, inTest, all=TRUE)


#need to change activity names as they cause problems in R

#evalaute mean and standard deviations for each subject and activity
meanData <- aggregate(mergedData, by=mergedData[c("label", "subject")], FUN=mean)
stdDevData <- aggregate(mergedData, by=mergedData[c("label", "subject")], FUN=sd)


