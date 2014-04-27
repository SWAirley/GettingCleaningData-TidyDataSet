run_analysis <- function(folderpath = 'UCI Har Dataset'){
        require(reshape2)
        
        
        anames <- read.table('UCI HAR Dataset/activity_labels.txt')
        cnames <- read.table('UCI HAR Dataset/features.txt')
        
        test <- read_test(cnames, anames)
        train <- read_train(cnames, anames)
        tdata <- rbind(test, train)
        tdata <- melt(tdata, id=c('subject', 'activity'))
        tdata <- dcast(tdata, subject + activity~variable, mean)
        tdata
}

meltandcast <- function(tdata){
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