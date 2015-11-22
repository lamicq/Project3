# README.md
## README file for the script run_analysis.R

This file contains the instructions of use for the run_analysis.R script, as well as a detailed explanation of
what it does.

The run_analysis.R transforms a specific set of files containing raw data collected from the accelerometers of
the Samsung Galaxy Smartphone into a specific tidy data set containing 36 observations of 67 variables.

More specifically, it reads data from the Test and Train datasets, obtains all the variables that are either
the mean or the standard devition of other variables, and creates a summary of the information, showing the
variables for either the activity performed or the user of the phone.

The file containing de raw data can be sourced from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Instructions

The script should be stored in the working directory.

The script assumes that the files containing the data have been decompressed in the working directory,
under the "UCI HAR Dataset" directory. No change is made as to how the files are stored or structured.

The script can be sourced into R using the following line of code:

   source('./run_analysis.R')

Once the script has been sourced into R, it can be used by using the following function:

   run_analysis()

When prompting the previous function into R, the script reads the files in the data set and outputs
a text file, by the name of "tidy_data.txt", that is automatically saved in the working directory.

## How the script works

### Step 1)
All the relevant files are read into R, each loading into a variable of the same, for easy manipulation.

  activity_labels = read.csv("./UCI HAR Dataset/activity_labels.txt", header = F, sep ="")
  activity_labels = read.csv("./UCI HAR Dataset/activity_labels.txt", header = F, sep ="")
  features = read.csv("./UCI HAR Dataset/features.txt", header = F, sep = "")
  subject_train = read.csv("./UCI HAR Dataset/train/subject_train.txt", header = F)
  x_train = read.csv("./UCI HAR Dataset/train/x_train.txt", header = F, sep = "")
  x_test = read.csv("./UCI HAR Dataset/test/x_test.txt", header = F, sep = "")
  y_train = read.csv("./UCI HAR Dataset/train/y_train.txt", header = F)
  y_test = read.csv("./UCI HAR Dataset/test/y_test.txt", header = F)
  subject_test = read.csv("./UCI HAR Dataset/test/subject_test.txt", header = F)

### Step 2)
The files relating to the Ativities and Subjects in the Test and Train sets are changed, to show descriptive
activities and the word "Subject" before the subject number, instead of just numbers.

  for (i in 1:nrow(subject_train)){
    subject_train[i,1] = sprintf("Subject %s", as.character(subject_train[i,1]))
  }
  for (i in 1:nrow(subject_test)){
    subject_test[i,1] = sprintf("Subject %s", as.character(subject_test[i,1]))
  }
  for (i in 1:nrow(y_train)){
    y_train[i,1] = as.character(activity_labels[y_train[i,1], 2])
  }
  for (i in 1:nrow(y_test)){
    y_test[i,1] =as.character(activity_labels[y_test[i,1], 2])
  }

### Step 3)
Two independent sets for the Train and Test sets are created using the raw data, activity and subject.
Using the two sets, a third set containing all the data (full_set) is created combining the two previous sets.
The names of the variables are added to full_set.

  test_set = cbind(x_test, y_test, subject_test)
  train_set = cbind(x_train, y_train, subject_train)
  full_set = rbind(test_set, train_set)
  names = c(as.vector(features[,2]), "Activity", "Subject")
  names(full_set) = names

### Step 4)
A subset of the desired columns is manually created.

  sub_set = full_set[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543, 562:563)]

### Step 5)
The required analysis is performed on the data, obtaining two data sets, one for activities and one for subjects.

  summary_activity = sub_set %>% group_by(Activity) %>% summarise_each(funs(mean), -Subject)
  summary_subject = sub_set %>% group_by(Subject) %>% summarise_each(funs(mean), -Activity)

### Step 6)
In order to combine the two data sets, all the variable names have to be the same. We modify the two data sets so their
variable names match, replacing Activity/Subject with "Summary".

  sum_names = names(summary_activity)
  sum_names[1] = "Summary"
  names(summary_activity) = sum_names
  names(summary_subject) = sum_names

### Step 7)
A final data set (summary) is created by combining converting the two previous data sets into data frames
and combining them. The variables are named just like the two previous sets.

  summary = rbind(as.data.frame(summary_activity), as.data.frame(summary_subject))
  names(summary) = sum_names

### Step 8)
The resulting data set is stored in a text file in the working directory under the name "tidy_data.txt".

  write.table(summary, file = "tidy_data.txt", row.names = FALSE)