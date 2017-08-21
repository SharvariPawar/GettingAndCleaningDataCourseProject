# GettingAndCleaningDataCourseProject
Course Project
This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

1> Downloads and unzips the dataset.
2> Reads Testing tables,Training Tables, Feature vector & Activity Labels.
3> Assigning column names to tables and merging all data in one set AllData.
4> Then extracts only the measurements on mean and standard deviation for each measurement in DataForMeanAndStd.
5> Then gives the descriptive activity names from ActivityLabels to DataForMeanAndStd and new dataframe is setActivityNames.
6> Creates a new final tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair. Tidy set is shown in FinalTidyDataset.txt
