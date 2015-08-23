# Data_Cleaning
+This file describes how run_analysis.R script works.
+* First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
+* Second, use source("run_analysis.R") command in RStudio. 
+* Third, you will find two output files are generated in the current working directory:
+  - test_train.txt: it contains a data frame called cleanedData with 10299*82 dimension.
+  - Table_final.txt: it contains a data frame called result with 180*82 dimension.
+* Finally, use data <- read.table("Table_final.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features. 