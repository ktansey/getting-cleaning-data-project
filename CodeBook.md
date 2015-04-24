# Introduction
The script run_analysis.R performs the 5 steps;
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	
For the completion of the class project for the course Getting and Cleaning Data. 


# Starting Datasets
Eight different tables of information were used:
* features.txt - contains the information for the columns of x datasets
* activity_labels.txt - key for the coding of activity information in y datasets
* subject_train.txt - subject ids for the training datasets
* subject_test.txt - subject ids for the testing datasets
* x_train.txt - feature information for training datasets
* x_test.txt - feature information for testing datasets
* y_train.txt - coded activity information for training datasets
* y_test.txt - coded activity information for testing datasets

# Processing
Steps taken in the run_analysis.R script:
* Data loaded
* Data merge by category:
	* x_test and x_train merged to create x_data
	* y_test and x_train merged to create y_data
	* subject_test and subject_train merged to create subject_data
* Columns in the three datasets are given appropriate column names
* A new dataset (mean_std_data) that only contains columns from x_data with information on mean and standard deviation 
* A new dataset (all_data) merging y_data, subject_data, and mean_std_data
* A new dataset (final_data) adds descriptive activity names 
* A new dataset (avg_data) which averages per variable for each activity for each person

