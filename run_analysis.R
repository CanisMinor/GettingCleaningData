#read in test and training data from downloaded file
#(the UCI_HAR_Dataset folder needs to be located in the working directory)
inTrain <- read.table("../UCI_HAR_Dataset/train/X_train.txt")
trainLabels <- read.table("../UCI_HAR_Dataset/train/y_train.txt")
trainSubjects <- read.table("../UCI_HAR_Dataset/train/subject_train.txt")
inTest <- read.table("../UCI_HAR_Dataset/test/X_test.txt")
testLabels <- read.table("../UCI_HAR_Dataset/test/y_test.txt")
testSubjects <- read.table("../UCI_HAR_Dataset/test/subject_test.txt")



#add activity labels and subject IDs as extra columns of data
inTrain$label <- trainLabels$V1
inTrain$subject <- trainSubjects$V1
inTest$label <- testLabels$V1
inTest$subject <- testSubjects$V1

#read in feature labels
featureLabels <- read.table("../UCI_HAR_Dataset/features.txt")

#name each column using activity labels
names(inTrain)[562] <- "label"
names(inTrain)[563] <- "subject"
names(inTest)[562] <- "label"
names(inTest)[563] <- "subject"


#merge training and test data
mergedData <- merge(inTrain, inTest, all=TRUE)

#rename variables
 names(mergedData)[1] <- "tBodyAccMeanX"
 names(mergedData)[2] <- tBodyAccMeanY
 names(mergedData)[3] <- tBodyAccMeanZ
 names(mergedData)[4] <- tBodyAccStdDevX
 names(mergedData)[5] <- tBodyAccStdDevY
 names(mergedData)[6] <- tBodyAccStdDevZ
 names(mergedData)[41] <- tGravityAccMeanX
 names(mergedData)[42] <- tGravityAccMeanY
 names(mergedData)[43] <- tGravityAccMeanZ
 names(mergedData)[44] <- tGravityAccStdDevX
 names(mergedData)[45] <- tGravityAccStdDevY
 names(mergedData)[46] <- tGravityAccStdDevZ
 names(mergedData)[81] <- tBodyAccJerkMeanX
 names(mergedData)[82] <- tBodyAccJerkMeanY
 names(mergedData)[83] <- tBodyAccJerkMeanZ
 names(mergedData)[84] <- tBodyAccJerkStdDevX
 names(mergedData)[85] <- tBodyAccJerkStdDevY
 names(mergedData)[86] <- tBodyAccJerkStdDevZ
 names(mergedData)[121] <- tBodyGyroMeanX
 names(mergedData)[122] <- tBodyGyroMeanY
 names(mergedData)[123] <- tBodyGyroMeanZ
 names(mergedData)[124] <- tBodyGyroStdDevX
 names(mergedData)[125] <- tBodyGyroStdDevY
 names(mergedData)[126] <- tBodyGyroStdDevZ
 names(mergedData)[161] <- tBodyGyroJerkMeanX
 names(mergedData)[162] <- tBodyGyroJerkMeanY
 names(mergedData)[163] <- tBodyGyroJerkMeanZ
 names(mergedData)[164] <- tBodyGyroJerkStdDevX
 names(mergedData)[165] <- tBodyGyroJerkStdDevY
 names(mergedData)[166] <- tBodyGyroJerkStdDevZ
 names(mergedData)[201] <- tBodyAccMagMean
 names(mergedData)[202] <- tBodyAccMagStdDev
 names(mergedData)[214] <- tGravityAccMagMean
 names(mergedData)[215] <- tGravityAccMagStdDev
 names(mergedData)[227] <- tBodyAccJerkMagMean
 names(mergedData)[228] <- tBodyAccJerkMagStdDev
 names(mergedData)[240] <- tBodyGyroMagMean
 names(mergedData)[241] <- tBodyGyroMagStdDev
 names(mergedData)[253] <- tBodyGyroJerkMagMean
 names(mergedData)[254] <- tBodyGyroJerkMagStdDev
 names(mergedData)[266] <- fBodyAccMeanX
 names(mergedData)[267] <- fBodyAccMeanY
 names(mergedData)[268] <- fBodyAccMeanZ
 names(mergedData)[269] <- fBodyAccStdDevX
 names(mergedData)[270] <- fBodyAccStdDevY
 names(mergedData)[271] <- fBodyAccStdDevZ
 names(mergedData)[345] <- fBodyAccJerkMeanX
 names(mergedData)[346] <- fBodyAccJerkMeanY
 names(mergedData)[347] <- fBodyAccJerkMeanZ
 names(mergedData)[348] <- fBodyAccJerkStdDevX
 names(mergedData)[349] <- fBodyAccJerkStdDevY
 names(mergedData)[350] <- fBodyAccJerkStdDevZ
 names(mergedData)[424] <- fBodyGyroMeanX
 names(mergedData)[425] <- fBodyGyroMeanY
 names(mergedData)[426] <- fBodyGyroMeanZ
 names(mergedData)[427] <- fBodyGyroStdDevX
 names(mergedData)[428] <- fBodyGyroStdDevY
 names(mergedData)[429] <- fBodyGyroStdDevZ
 names(mergedData)[503] <- fBodyAccMagMean
 names(mergedData)[504] <- fBodyAccMagStdDev
 names(mergedData)[516] <- fBodyBodyAccJerkMagMean
 names(mergedData)[517] <- fBodyBodyAccJerkMagStdDev
 names(mergedData)[529] <- fBodyBodyGyroMagMean
 names(mergedData)[530] <- fBodyBodyGyroMagStdDev
 names(mergedData)[542] <- fBodyBodyGyroJerkMagMean
 names(mergedData)[543] <- fBodyBodyGyroJerkMagStdDev


#remove any columns that do NOT represent mean and standard deviation measurements
meanData <- subset(mergedData,



#evalaute mean and standard deviations for each subject and activity
meanData <- aggregate(mergedData, by=mergedData[c("label", "subject")], FUN=mean)
stdDevData <- aggregate(mergedData, by=mergedData[c("label", "subject")], FUN=sd)


