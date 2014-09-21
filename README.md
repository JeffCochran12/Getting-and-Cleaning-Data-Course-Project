This document is the README file for the code run_analysis.R.

run_analysis.R is heavily commented so the following documentation can also be seen in the code itself.

The entirety of the project can be completed simply by running the run_analysis.R code while in the
UCI HAR Dataest directory. 

The code will take both the training and test datasets from the train and test directories, respectively.

It will then merge the data into a single table.

Then, it will collect the information about the subject ID and activity ID from the subject_train/subject_test files
and from the y_train/y_test files.

This data is also merged into a single table.

Then, the variables that represent mean and standard deviation values will be isolated from the rest
of the variables to create a new table.

Then, the activity ID number will be replaced by an actual description of the physical activity.

Finally, group means are calculated for all the mean and standard deviation variables over each 
subject/activity group.