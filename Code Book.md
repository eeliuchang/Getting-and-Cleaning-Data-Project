Url: website link

activity_labels:  activity names from "UCI HAR Dataset/activity_labels.txt"

train_X: training data with all the variables from "UCI HAR Dataset/train/X_train.txt"

train_y: training data with the activity ID from "UCI HAR Dataset/train/y_train.txt"

train_subject: training data with the subject ID from  "UCI HAR Dataset/train/subject_train.txt"

test_X: testing data with all the variables from "UCI HAR Dataset/test/X_test.txt"

test_y: testing data with the activity ID from "UCI HAR Dataset/test/y_test.txt"

test_subject: testing data with the subject ID from "UCI HAR Dataset/test/subject_test.txt"

variable_names: the desciptive variable names for the datasets from "UCI HAR Dataset/features.txt"

df_train: dataframe for the data from training measures including variables, acitivity and subject ID

df_test: dataframe for the data from testing measures including variables, acitivity and subject ID

df:  dataframe for all the training and testing data

variables_desired1: factor of "mean" which is the first selection critirion for our datasets

pos1: the columns number whoes name have "mean" in it 

variables_desired2: factor of "std" which is the second selection critirion for our datasets

pos2: the columns number whoes name have "mean" and "std"in it

length: the number of all the variables without selection

df: the final selected dataframe which has column names with "mean" and 

"std" as well as "activity" and "subject ID"

activity_labels: the descriptive names for activity

temp: dataframe with all the variables for each subject

t: mean value for each subject i and activity
               


