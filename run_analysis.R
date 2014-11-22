#Load necessary Libraries
#Read all the files in R
library(data.table)
library(plyr)

features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("activity","description")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",header=F)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",header=F)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- c("subject")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- c("subject")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
names(y_test) <- c("activity")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
names(y_train) <- c("activity")

y_test <- data.frame(activity=join(y_test,activity_labels)[["description"]])
y_train <- data.frame(activity=join(y_train,activity_labels)[,"description"])

#Trim files to required data: mean and standard deviation

meanstd <- features[features[["V2"]] %like% c("mean\\(\\)") | features[["V2"]] %like% c("std\\(\\)"),]

testDat <- x_test[,meanstd[["V1"]]]
trainDat <- x_train[,meanstd[["V1"]]]

#Set column names

names(testDat)<-gsub("\\)","",gsub("\\(","",tolower(gsub("-","",meanstd[["V2"]]))))
names(trainDat)<-gsub("\\)","",gsub("\\(","",tolower(gsub("-","",meanstd[["V2"]]))))

#Merge Data

tidyDat <-rbind(cbind(subject_test, y_test, testDat),
                cbind(subject_train, y_train, trainDat))

#Create table of averages of data

tidyDat2 <- ddply(tidyDat,.(subject,activity),function(x){colMeans(x[,c(3:68)])})

#Write second table into a .txt file

write.table(tidyDat2, file = "tidyDat2.txt", row.names = FALSE)

