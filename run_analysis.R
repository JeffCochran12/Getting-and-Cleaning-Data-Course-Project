# Load the dplyr library
library(dplyr)

# read in the training data and test data into separate data.frames
trainTable <- read.table("train/X_train.txt",sep="")
testTable <- read.table("test/X_test.txt",sep="")

# Read in both the variable labels for the data columns and the activity labels
# that correspond to each activity ID number
varTable <- read.table("features.txt")
activityTable <- read.table("activity_labels.txt")

# Convert the variable names from factors to characters so that I can 
# manipulate the list and add the SubjectID and ActivityID variable names
# I then convert them backt to factors
varList <- as.character(varTable[,2])
addVars <- c("SubjectID","ActivityID")
newVarList <- c(addVars,varList)

varFactors <- factor(newVarList)

# Read out the subjectID data for each observation from both the training 
# and test data
subjectTest <- read.table("test/subject_test.txt")
subjectTrain <- read .table("train/subject_train.txt")

# Read out the ActivityID for each observation from both the training
# and test data
activityTest <- read.table("test/y_test.txt")
activityTrain <- read.table("train/y_train.txt")

# Add the ActivityID and SubjectID data to the full training and test data
# tables
fullTrainTable <- cbind(subjectTrain,activityTrain,trainTable)
fullTestTable <- cbind(subjectTest,activityTest,testTable)

# Merge the tables with rbind with the training data on top of the test data
# (Step 1 of assignment)
mergedTable <- rbind(fullTrainTable,fullTestTable)

# Set the names of the variables to be the variable factors created earlier
# (Step 4 of assignment)
names(mergedTable)<-varFactors

# Selects only the mean, standard deviation and ID columns
# (Step 2 of assignment)
meanAndstdSubset <- select(mergedTable,contains("ID"),contains("mean()"),contains("std()"))

# Gets the activityID names in a factor vector
activityLabels<- activityTable[,2]

# Replaces the ActivityID variable with a more understandable ActivityName
# variable
# (Step 3 of assignment)
subsetWithActivities <- mutate(meanAndstdSubset,ActivityID=activityLabels[ActivityID])

# Group table by subject ID and activity ID
groupedTable <- group_by(subsetWithActivities,SubjectID,ActivityID)

# Average each of the variables over the Subject ID and Activity ID
# (Step 5 of the assignment)
averagedTable <- summarise_each(groupedTable,funs(mean))