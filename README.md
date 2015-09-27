# Getting-and-Cleaning-Data-Course-Project
The repository is for the submission of project for the course of "Getting and Cleaning Data" on coursera. The repository contains a script and its documentation for cleaning a dataset.

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

Script Information:

- The script run_analysis.R loads the data from data located in the working directory.
- It row binds the 3 the training and test datasets for X,Y and subject.
- Only features that contain mean() or std() are then extracted from the original dataset of 561 variables.
- A data frame containing all the data in created using column bind.
- Activity names which in the data set are categorical variables expressed as numbers are converted to respective verb strings.
- The variable names are then cleaned up using substitution method gsub and regular exp matching.
- Finally the average of each variable for each activity and each subject is computed using the aggregate function of the dplyr    package.
