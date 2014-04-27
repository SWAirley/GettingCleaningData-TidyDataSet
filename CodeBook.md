#The TidyData CodeBook

##The Initial Step
The data was split into several files and the labels for the data in several more files.
The data was read into R, correctly labeled by column and by activities.
The data was in in two parts, 30% of the data was in a 'test' set and 70% in a 'train' set.
The data was trimmed to only include the data with column names equalling '-mean() or -std()'
The data was combined into one data set by binding them together by row.
The data was melted using the reshape2 package in R, using subject and activity is as the factor variables.
The data was then recast using the factor variables to order while simultaneously taking the mean of each created subset.
The result is a data set that is ordered by subject and activity, in that order, and represents the means observations.

##The Final TidyData
The first column represents the subject, identified by numbers 1 - 30, that took part in the study.  Called 'subject'.
The second column represents the activity, there are six activities, that the subject performed for that test.  Called 'activity'.

The rest of the columns are the means of the observations factored by subject and activity.  
The data itself is the means or standard deviations of specific tests done for that subject and event, standardized between -1 and 1.
