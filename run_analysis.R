
#----------------Coursera Getting and Cleaning Data Course Project-------------------#

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#------------------------------------------------------------------------------------#


#Loading the packages and setting working desk

library(dplyr)
library(plyr)
setwd("C:/Users/Usuario/Desktop/Coursera/02_Getting and Cleaning Data/UCI HAR Dataset")

#################################################################
# 1. Merge the training and the test sets to create one data set#
#################################################################

#-------------Reading features and activity labels-----------------#
features=read.table("features.txt",header=FALSE)
colnames(features)=c("FeatureCode","FeatureDescription")

activity=read.table("activity_labels.txt",header=FALSE)
colnames(activity)=c("ActivityCode","ActivityDescription")


#------------Read, rename and join the test data-------------------#
subject_test=read.table("subject_test.txt",header=FALSE)
colnames(subject_test)="SubjectCode"

xtest=read.table("X_test.txt",header=FALSE)
colnames(xtest)=features$FeatureDescription

ytest=read.table("y_test.txt") #labels
colnames(ytest)="ActivityCode"

test=cbind(xtest,subject_test,ytest)


#------------Read, rename and join the train data-----------------#
subject_train=read.table("subject_train.txt",header=FALSE)
colnames(subject_train)="SubjectCode"

xtrain=read.table("X_train.txt",header=FALSE)
colnames(xtrain)=features$FeatureDescription

ytrain=read.table("y_train.txt",header=FALSE)
colnames(ytrain)="ActivityCode"

train=cbind(xtrain,subject_train,ytrain)

#-----------------------Test+Train data---------------------------#
testtrain=rbind(test,train)


############################################################################################
# 2. Extract only the measurements on the mean and standard deviation for each measurement##
############################################################################################

testtrain2=testtrain[ , !duplicated(colnames(testtrain))]
testtrainfinal=cbind(select(testtrain2,contains("SubjectCode")),select(testtrain2,contains("ActivityCode")),select(testtrain2,contains("mean")),select(testtrain2,contains("std")))


#############################################################################
# 3. Use descriptive activity names to name the activities in the data set  #
#############################################################################

testtrainfinal=merge(testtrainfinal,activity,by="ActivityCode")


#####################################################################################################################
#5. Create a second, independent tidy data set with the average of each variable for each activity and each subject # 
#####################################################################################################################

finaldata=ddply(testtrainfinal, .(SubjectCode,ActivityDescription),function(x) colMeans(x[, 3:88]))

write.table(finaldata, './TestTrainAverages.txt',row.names=FALSE,sep='\t');
