CodeBook for run_analysis.R


trainTable: Data frame of the training data read in from the train directory file with no modification.
testTable: Data frame of test data read in from the test directory file with no modification.

varTable: Data frame of factors of variable names for the data tables read in from features.txt
activityTable: Data frame of factors of the names of the six activities read in from activity_labels.txt

varList: Vector of characters of the variable names converted from varTable data
addVars: Character vecotr of "SubjectID" and "ActivityID" that will be added to list of variable names.

newVarList: Character vector of addVars and varList combined into single vector
varFactors: Factor vector created from character vector newVarList

subjectTest: Data frame of subject ID factors read in from the test directory
subjectTrain: Data frame of subject ID factors read in from the train directory

activityTest: Data frame of activity ID factors read in from the test directory
activityTrain: Data frame of activity ID factors read in from the train directory

fullTrainTable: Data frame with the variables from the trainTable plus the subject and activity ID columns
		from subjectTrain and activityTrain.
fullTestTable: Data frame with the variables from the testTable plus the subject and activity ID columns
		from subjectTest and activityTest.

mergedTable: Data frame with fullTrainTable and fullTestTable rows added together to make a single data frame.

meanAndstdSubset: Data frame that is a subset of mergedTable which includes only the subject and activity ID
		  variables plus any variable that represents a mean or standard deviation.

activityLabels: Factor vector of the names that correspond to activity ID numbers

subsetWithActivities: Data frame that is the same as meanAndstdSubset but with the activity name in place
		      of the activity ID number variable.

groupedTable: Data frame of subsetWithActivities that is grouped by both SubjectID and ActivityID.

averagedTable: Data frame where each of the variables of groupedTable is averaged over each Subject-Activity pair.

