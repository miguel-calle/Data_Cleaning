library(dplyr)
# Define a working directory setwd("C:\\Work\\datascienceR\\DataScienceCoursera\\UCI HAR Dataset")
features<-read.table("features.txt")

#Loading training set
train_x<-read.table("./train/X_train.txt",col.names=features$V2)
train_y<-read.table("./train/y_train.txt",col.names=c("ID_Activity"))
subject_train<-read.table("./train/subject_train.txt",col.names=c("Subject"))
#Merge all columns to create the train dataset
train<-cbind(subject_train,train_y,train_x)

#Loading test set
test_x<-read.table("./test/X_test.txt",col.names=features$V2)
test_y<-read.table("./test/y_test.txt",col.names=c("ID_Activity"))
subject_test<-read.table("./test/subject_test.txt",col.names=c("Subject"))
#Merge all columns to create the test dataset
test<-cbind(subject_test,test_y,test_x)

#Merge train and test datasets
test_train<-rbind(test,train)

#Select just the std and mean meassures
mean_index<-grep("mean",features$V2)
std_index<-grep("std",features$V2)
valid_index<-c(mean_index,std_index)
valid_index<-c(1,2,valid_index+2)
test_train_sel<-test_train[,valid_index]

#Adding activity names

activity_lu<-read.table("activity_labels.txt",col.names=c("ID_Activity","Activity_Name"))
test_train_end<-inner_join(activity_lu,test_train_sel)

# Aggreating all KPI´s based on Activity and Subject
test_train_end_group<-group_by(test_train_end,Activity_Name,ID_Activity,Subject)
final<-summarise_each(test_train_end_group,funs(mean))

write.table(final,"Table_final.txt",row.name=FALSE)