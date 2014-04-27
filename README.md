GettingCleaningData-TidyDataSet
===============================

#Peer Assessmnet Project for Getting and Cleaning Data on Coursera.

# How my script works.
## This script requires the reshape2 package for R, for melt and dcast.

## run_analysis function
The run_analysis function first loads the reshape2 package.
It then reads in the labels for the columns and activities.
Reads in the two data sets and names them using the helper functions.  Passing them the labels
Combines the data into 1 large set
Melts the data using subject and activity as factors.
Recasts the data ordered by subject and activity, in that order, while also taking the mean of each subset.
Returns the final data set.

## read_test function
A helper function for run_analysis.
Reads in the test data set.
Uses the column names passed to it by run_analysis to name the columns
Trims the test data to only include mean and std variables
Reads in and adds to the data frame the activity and subject columns.
Labels the activities

returns the trimed data set


## read_train function
exactly the same as read_test function but for the Train data.
