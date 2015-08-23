This code book describes the variables, the data, and any transformations or work that we have performed to clean up the data.

The site where the data was retrieved:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The Raw data for the assignment:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs these steps:
Read X_train.txt, y_train.txt and subject_train.txt from the "./train" folder.
Read X_test.txt, y_test.txt and subject_test.txt from the "./test" folder.
Concatenate test dataset  to train dataset to generate a 10299x561 data frame.
Read the features.txt file from the "./" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation. 
Read the activity_labels.txt file from the "./"" folder and store the data in a variable called activity_lu.
Performe a join between the main dataset and the activity_lu to retrieve the activity descriptions.
Group by the dataset considering the activity and the subject.
Calculate the mean for every final KPI included on the dataset.
Create a file with the final result