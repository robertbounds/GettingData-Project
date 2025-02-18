library(data.table)

run_analysis <- function() {
        
        ## Directory navigation & file reading block
        ##
        ## This chunk of code navigates the UCI HAR Dataset directory,
        ## and reads necessary files along the way.
        ##
        ## dataset home
        home <- getwd()
        setwd("UCI HAR Dataset")
        datasetHome <- getwd()
        features    <- read.table("features.txt")
        features    <- features[, 2] # remove column without variable names
        ## testing directory
        setwd("test")
        xTest       <- read.table("X_test.txt")
        yTest       <- read.table("y_test.txt")
        subjectTest <- read.table("subject_test.txt")
        setwd(datasetHome)
        ## training directory
        setwd("train")
        xTrain       <- read.table("X_train.txt")
        yTrain       <- read.table("y_train.txt")
        subjectTrain <- read.table('subject_train.txt')
        setwd(home)
        
        ## carefully perform initial merges of data frames
        ## *Test is bound above *Train
        xData       <- rbind(xTest, xTrain)
        yData       <- rbind(yTest, yTrain)
        subjectData <- rbind(subjectTest, subjectTrain)
        
        ## rename variables for data frames
        names(xData)       <- features
        names(yData)       <- "ACTIVITY"
        names(subjectData) <- "SUBJECT"
        
        ## rename observation data for activities
        ## keys/values determined by looking at activity_labels.txt
        yData[yData == 1] <- "WALKING"
        yData[yData == 2] <- "WALKING_UPSTAIRS"
        yData[yData == 3] <- "WALKING_DOWNSTAIRS"
        yData[yData == 4] <- "SITTING"
        yData[yData == 5] <- "STANDING"
        yData[yData == 6] <- "LAYING"
        
        ## subset data for means and standard deviations
        meanData  <- xData[, grep("mean()",
                                  names(xData),
                                  fixed = TRUE
                                  )
                           ]
        stDevData <- xData[, grep("std()",
                                  names(xData),
                                  fixed = TRUE
                                  )
                           ]
        ## merge data into a single table
        mergedData <- cbind(subjectData, yData, meanData, stDevData)
                
        ## minor scrubbing of variable names
        names(mergedData) <- gsub("\\(\\)", "", names(mergedData))
        names(mergedData) <- gsub("-", ".", names(mergedData))
        names(mergedData) <- gsub("BodyBody", "Body", names(mergedData))
        
        ## find averages of means and standard deviations
        ## for each activity, for each subject.
        ## resulting data is the requested "tidy" data set.
        tidyData <- aggregate(mergedData,
                              by = list(mergedData$SUBJECT, 
                                        mergedData$ACTIVITY),
                              FUN = mean
                              )
        
        ## perform minor column cleaning of the "tidy" data
        tidyData <- data.table(tidyData)
        names(tidyData)[1:2] <- c("SUBJECT", "ACTIVITY")
        tidyData[, 3 := NULL]
        tidyData[, 3 := NULL]
        tidyData <- tidyData[order(tidyData$SUBJECT), ]
        
        write.table(tidyData, file = "tidyData.txt")
}