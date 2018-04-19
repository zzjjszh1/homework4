library(data.table)

gettidydata <- function(whattype){## this function will get data from test or train data set and tidy them into:
        ##1. Extracts only the measurements on the mean and standard deviation for each measurement.
        ##2. Uses descriptive activity names to name the activities in the data set
        ##3. Appropriately labels the data set with descriptive variable names.
       
        
        
        
        
        ### get experiment data
        filep = sprintf(".\\UCI_HAR_Dataset\\%s\\X_%s.txt",whattype,whattype)
        dataX <- fread(filep,header = FALSE)
        filep = sprintf(".\\UCI_HAR_Dataset\\%s\\Y_%s.txt",whattype,whattype)
        dataY <- fread(filep,header = FALSE)
        dataY <- as.data.frame(dataY)
        dataX <- as.data.frame(dataX)
        
        
        ## get features,subset request mean and std feature
        features <- fread(".\\UCI_HAR_Dataset\\features.txt",header = FALSE,sep=" ")
        features <- as.data.frame(features)
        ## grep("mean",features[,2],ignore.case = TRUE) %in% grep("std",features[,2],ignore.case = TRUE) 
        usefulfeature <- c(grep("mean",features[,2],ignore.case = TRUE),grep("std",features[,2],ignore.case = TRUE))
        
        
        ## get activity label
        activitylabel <- fread(".\\UCI_HAR_Dataset\\activity_labels.txt",header = FALSE)
        activitylabel <- as.data.frame(activitylabel)
        dataY <- merge(dataY,activitylabel)
        
        ## get subject number
        filep = sprintf(".\\UCI_HAR_Dataset\\%s\\subject_%s.txt",whattype,whattype)
        subject <- fread(filep,header = FALSE)
        subject <- as.data.frame(subject)
        
        
        dataX <- dataX[,usefulfeature]
        names(dataX) <- make.names(features[,2][usefulfeature])
        
        tidydata <- cbind(dataX,activity=dataY[,2],subject=subject$V1)
        
        tidydata
        
}

tidytrain <- gettidydata("train")

tidytest <- gettidydata("test")

tidydata <- rbind(tidytrain,tidytest)

write.csv(tidydata,file=".\\result\\tidyexperimentdata.csv")


## creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

averageresult <- tidydata %>% group_by(subject,activity) %>% summarise_all(mean)

##table(averageresult$subject)>1

write.table(averageresult,file=".\\result\\resultreqested.tab",row.name=FALSE)
write.csv(averageresult,file=".\\result\\averageby_subject_activity.csv")

