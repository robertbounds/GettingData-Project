run_analysis <- function() {
        
        ## Directory navigation & file reading block
        ##
        ## This chunk of code navigates the UCI HAR Dataset directory,
        ## and reads necessary files along the way.
        ##
        ## dataset home
        setwd("UCI HAR Dataset")
        datasetHome <- getwd()
        features    <- read.table("features.txt")
        ## test directory
        setwd("test")
        xTest       <- read.table("X_test.txt")
        yTest       <- read.table("y_test.txt")
        subjectTest <- read.table("subject_test.txt")
        setwd(datasetHome)
        ## train directory
        setwd("train")
        xTrain       <- read.table("X_train.txt")
        yTrain       <- read.table("y_train.txt")
        subjectTrain <- read.table('subject_train.txt')
        setwd(datasetHome)
        
        ## initial merges of data frames
        xData       <- rbind(xTest, xTrain)
        yData       <- rbind(yTest, yTrain)
        subjectData <- rbind(subjectTest, subjectTrain)
        
        ## rename variables for data frames
        names(xData)       <- features
        names(yData)       <- "ACTIVITY"
        names(subjectData) <- "SUBJECT ID"
        
        ## rename observation data for activities
        ## keys/values determined by looking at activity_labels.txt
        yData[yData == 1] <- "WALKING"
        yData[yData == 2] <- "WALKING_UPSTAIRS"
        yData[yData == 3] <- "WALKING_DOWNSTAIRS"
        yData[yData == 4] <- "SITTING"
        yData[yData == 5] <- "STANDING"
        yData[yData == 6] <- "LAYING"
        
        ## glue subject id and activity names to front of dataset
        fullData <- cbind(yData, xData)
        fullData <- cbind(subjectData, fullData)
        
        #######################################################################
        ###  write code here to subset fullData
        #######################################################################
        
        #######################################################################
        ###  Write code here to construct tidy data set
        #######################################################################
}