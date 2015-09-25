#Data 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

###For each record it is provided
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###The dataset includes the following files: 
- Features_info.txt: Shows information about the variables used on the feature vector.
- Features.txt': List of all features.
- Activity_labels.txt': Links the class labels with their activity name.
- Train/X_train.txt': Training set.
- Train/y_train.txt': Training labels.
- Test/X_test.txt': Test set.
- Test/y_test.txt': Test labels.

##Script and Results

- Run_analysis.R performs the 5 steps described in the course project's objectives
- Librarys plyr and dplyr were used to execute the activities.
- First, all the files were read,  labeled and joined using the functions: read.table, colnames(to rename the columns in each data set, especially xtest and xtrain, where was used the file features.txt), cbind (to join the test files and train files columns) and rbind (to join test+train rows)
- Then, the colnames with mean and standard deviation measures were taken from the whole dataset (using the select function)
- After I used the descriptive activity names to name the activities in the data set by merging the previous data set and the file activitylabels.txt
- Using ddply and grouping by subject and activity, was created a second data set with the average of each variable called TestTrainAverages.txt 





