run_analysis <- function(){
        ##Loads reshape2 package.		
		require(reshape2)
        
        ##Reads in the labels for the columns and the activities
        anames <- read.table('UCI HAR Dataset/activity_labels.txt')
        cnames <- read.table('UCI HAR Dataset/features.txt')
        
	##Reads in the two data sets and names them using the helper functions.
        test <- read_test(cnames, anames)
        train <- read_train(cnames, anames)
		
	##Combines the data into 1 large set
        tdata <- rbind(test, train)
		
	##Melts the data using subject and activity as factors.
	##Recasts the data ordered by subject and activity, in that order, while also taking the mean of each subset.
	##Returns the final data set.
		
        tdata <- melt(tdata, id=c('subject', 'activity'))
        tdata <- dcast(tdata, subject + activity~variable, mean)
        tdata
}

read_test <- function(cnames, anames){
        ## Read in Features for labels

        ## Read in Test data set, name columns and combine
        test <- read.table('UCI HAR Dataset/test/x_test.txt')
        names(test) <-cnames[,2]
        test <- test[, grep('-mean\\(\\)|-std\\(\\)', names(test))]
        
        
        test <- cbind(read.table('UCI HAR Dataset/test/y_test.txt', col.names ='activity', colClasses = 'factor'), test)
        test <- cbind(read.table('UCI HAR Dataset/test/subject_test.txt', col.names ='subject'), test)
        levels(test[,'activity']) <- anames[,2]
        test        
        
}

read_train <- function(cnames, anames){
        ## Read in Features for labels
        
        ## Read in Test data set, name columns and combine
        test <- read.table('UCI HAR Dataset/train/x_train.txt')
        names(test) <-cnames[,2]
        test <- test[, grep('-mean\\(\\)|-std\\(\\)', names(test))]
        
        
        test <- cbind(read.table('UCI HAR Dataset/train/y_train.txt', col.names ='activity', colClasses = 'factor'), test)
        test <- cbind(read.table('UCI HAR Dataset/train/subject_train.txt', col.names ='subject'), test)
        levels(test[,'activity']) <- anames[,2]
        test 
}