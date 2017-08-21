download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "ProgAssgDataset.zip")
unzip("ProgAssgDataset.zip")
x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
features <- read.table('UCI HAR Dataset/features.txt')
activityLabels = read.table('UCI HAR Dataset/activity_labels.txt')
colnames(x_train) <- features[,2] 
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
AllData <- rbind(mrg_train, mrg_test)
colNames <- colnames(AllData)
mean_and_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
DataForMeanAndStd <- AllData[ , mean_and_std == TRUE]
SetActivityNames <- merge(DataForMeanAndStd, activityLabels, by='activityId',all.x = TRUE)
FinalTidyDataset <- aggregate(. ~subjectId + activityId, SetActivityNames, mean)
FinalTidyDataset <- FinalTidyDataset[order(FinalTidyDataset$subjectId, FinalTidyDataset$activityId),]
write.table(FinalTidyDataset, "FinalTidyDataset.txt", row.name=FALSE)

