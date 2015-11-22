# README.md
## README file for the script run_analysis.R

This file contains the instructions of use for the run_analysis.R script, as well as a detailed explanation of what it does.

The run_analysis.R transforms a specific set of files containing raw data collected from the accelerometers of the Samsung Galaxy Smartphone into a specific tidy data set containing 36 observations of 67 variables.

More specifically, it reads data from the Test and Train datasets, obtains all the variables that are either the mean or the standard devition of other variables, and creates a summary of the information, showing the variables for either the activity performed or the user of the phone.

The file containing de raw data can be sourced from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Instructions

The script should be stored in the working directory.

The script assumes that the files containing the data have been decompressed in the working directory, under the "UCI HAR Dataset" directory. No change is made as to how the files are stored or structured.

The script can be sourced into R using the following line of code:

   source('./run_analysis.R')

Once the script has been sourced into R, it can be used by using the following function:

   run_analysis()

When prompting the previous function into R, the script reads the files in the data set and outputs a text file, by the name of "tidy_data.txt", that is automatically saved in the working directory.

## How the script works

### Step 1)
All the relevant files are read into R, each loading into a variable of the same, for easy manipulation.

![Code](http://imageshack.com/a/img907/2994/PKMn06.jpg)

### Step 2)
The files relating to the Ativities and Subjects in the Test and Train sets are changed, to show descriptive activities and the word "Subject" before the subject number, instead of just numbers.

![Code](http://imageshack.com/a/img910/7657/EXyXYj.jpg)

### Step 3)
Two independent sets for the Train and Test sets are created using the raw data, activity and subject. Using the two sets, a third set containing all the data (full_set) is created combining the two previous sets. The names of the variables are added to full_set.

![Code](http://imageshack.com/a/img905/6756/xXNWbK.jpg)

### Step 4)
A subset of the desired columns is manually created.

![Code](http://imageshack.com/a/img907/8411/OuTUBj.jpg)

### Step 5)
The required analysis is performed on the data, obtaining two data sets, one for activities and one for subjects.

![Code](http://imageshack.com/a/img907/6515/l6O1tp.jpg)

### Step 6)
In order to combine the two data sets, all the variable names have to be the same. We modify the two data sets so their variable names match, replacing Activity/Subject with "Summary".

![Code](http://imageshack.com/a/img908/1929/lhu379.jpg)

### Step 7)
A final data set (summary) is created by combining converting the two previous data sets into data frames and combining them. The variables are named just like the two previous sets.

![Code](http://imageshack.com/a/img911/5579/AbMO4B.jpg)

### Step 8)
The resulting data set is stored in a text file in the working directory under the name "tidy_data.txt".

![Code](http://imageshack.com/a/img910/8568/otFE7K.jpg)
