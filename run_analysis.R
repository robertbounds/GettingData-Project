run_analysis <- function() {
        
        
        ## Directory navigation, read test & train data for both X and y
        setwd("UCI HAR Dataset")
        datasetHome <- getwd()
        setwd("test")
        xTest <- read.table("X_test.txt")
        yTest <- read.table("y_test.txt")
        setwd(datasetHome)
        setwd("train")
        xTrain <- read.table("X_train.txt")
        yTrain <- read.table("y_train.txt")
        setwd(datasetHome)
        
        ## read activity labels, and x-variable names
        features <- read.table("features.txt")
        features <- features[, 2]
        activityLabels <- read.table("activity_labels.txt")
        
        ## merge data frames
        xData <- rbind(xTest, xTrain)
        yData <- rbind(yTest, yTrain)
        
        ## update x-variable names
        names(xData) <- features
        
        ## update activity labels
        names(yData) <- "ACTIVITY NAMES"
        #for (i in 1:6) {
        #        yData[yData == i] <- activityLabels[i]
        #}
        
        ## keys/values determined by activity_labels.txt
        yData[yData == 1] <- "WALKING"
        yData[yData == 2] <- "WALKING_UPSTAIRS"
        yData[yData == 3] <- "WALKING_DOWNSTAIRS"
        yData[yData == 4] <- "SITTING"
        yData[yData == 5] <- "STANDING"
        yData[yData == 6] <- "LAYING"

        
        
}