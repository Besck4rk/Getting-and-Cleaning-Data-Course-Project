## Introduction

The script run_analysis.Rperforms the 5 steps described in the course project's definition.

1) The training and test data are merged into two data sets, and giving the names to the columns from the features.txt file
2) The columns with the mean and standard deviation measures are extracted
3) Take the activity names and IDs from activity_labels.txt and substitute it in the dataset
4) The columns are correlated
5) Generate a new dataset with all the measures for each subject and activity type

## Variables

activity : dataset with the activity labels
features : dataset with the correct names for the trainX and testX datasets

trainX : dataset with the results of the training
testX : dataset with the results of the training
trainY : dataset with the training labels
testY : dataset with the test labels
trainSubjects: dataset with the subjects in each training
testSubjects: dataset with the subjects in each test
train : dataset, column combination of trainSubject, trainY, and trainX
test : dataset, column combination of testSubject, testY, and testX

features.mean_or_std : list with the columns containing means or deviation in trainX and testX
train.use : dataset, extraction of the columns of trainX according to features.mean_or_std
test.use : dataset, extraction of the columns of testX according to features.mean_or_std

train.mean_or_std : dataset, column combination of trainSubject, trainY, and train.use
test.mean_or_std : dataset, column combination of testSubject, testY, and test.use

train.average : dataset with the final result for the training
test.average : dataset with the final result for the test
