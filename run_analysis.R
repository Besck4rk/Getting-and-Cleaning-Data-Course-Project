library(plyr)

# ************************************
## Step 1: Merges the training and the test sets to create one data set

# Extracting the data on activitys and column names
activity <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# Reading the training sets, naming the columns
trainX <-  read.table("train/X_train.txt")
colnames(trainX) <- features$V2
trainY <-  read.table("train/Y_train.txt")
colnames(trainY) <- ("labels")
trainSubjects <- read.table("train/subject_train.txt")
colnames(trainSubjects) <- ("subject")

# Reading the test sets
testX <-  read.table("test/X_test.txt")
colnames(testX) <- features$V2
testY <-  read.table("test/Y_test.txt")
colnames(testY) <- ("labels")
testSubjects <- read.table("test/subject_test.txt")
colnames(trainSubjects) <- ("subject")

# Merging the data to have one data set with the training and one with the test
train <- cbind(trainSubjects,trainY,trainX)
test <- cbind(testSubjects,testY,testX)

# ************************************
## Step 2: Extracting only the measurements on the mean and standard deviation for each measurement

# Column numbers with mean or std
features.mean_or_std <- grep("-(mean|std)\\(\\)", features[, 2])

# Extract the data
train.use <- trainX[,features.mean_or_std]
test.use <- testX[,features.mean_or_std]

# ************************************
## Step 3: Use descriptive activity names to name the activities in the data set
trainY[,1] <- activity[trainY[,1],2]
testY[,1] <- activity[testY[,1],2]


# ************************************
## Step 4: Appropriately label the data set with descriptive variable names
train.mean_or_std <- cbind(trainSubjects,trainY,train.use)
test.mean_or_std <- cbind(testSubjects,testY,test.use)

# ************************************
## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# colums 1 and 2 contain the subject and the activity
train.average <- ddply(train.mean_or_std, .(subject, activity), function(x) colMeans(train.mean_or_std[, 3:68]))
test.average <- ddply(test.mean_or_std, .(subject, activity), function(x) colMeans(train.mean_or_std[, 3:68]))

write.table(train.average, "averages_data.txt", row.name=FALSE)
write.table(test.average, "averages_data.txt", row.name=FALSE)
