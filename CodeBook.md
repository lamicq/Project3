# CodeBook.md
CodeBook for tidy_data.txt

## Index

* Description of the Data Set
* Source of the Data
* Description of Variables
* Reasoning and steps to obtain output


## Description of the Data Set
This data set includes 36 observations of 67 variables each. It is the output of the analysis of the raw data collected from the accelerometers of Samsung Galaxy S smartphones.
The analysis, in general terms, singled out the variables denoting the means or standard deviations of the measurments, and summarized the information by averaging out those means and standard deviations for every activity described in the data and every subject that participated (basically creating variables, each containing a mean of means or a mean of standard deviations).  


## Source of the Data
The data comes from the Human Activity Recognition Using Smartphones Data Set, in the Machine Learining Repository of the Center for Machine Learning and Intelligent Systems of the University of California Irvine.  

The data set can be accessed at the following URL:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The file containing de raw data can be downloaded directly from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Description of Variables
This data set includes 67 variables, which can be described as follows:

The first variable, Summary, describes the activity or Subject that the rest of the variables describe (Subject refers to the identifier of the person using the phone at the time the measurement was taken, while Activity refers to the Activity that person was performing).
The rest of the variables in this data set were obtained by cleaning and analyzing the variables provided in the raw data set previously mentioned. Each variable represents the mean of means or mean of standard devitions of a measurement (that is, the analysis performed obtained the means of variables decribing the mean or standard deviation of a measurement).
To understand the names of the variables and what they describe, certain guidelines should be followed:

1. The prefix "t" describes signals measured in the time domain.
2. The prefix "f" denotes the use of a Fast Fourier Transform.
3. If the variable includes the string "Acc", it means that the measurement comes from the Accelerometer.
4. If the variable includes the string "Gyro", it means that the measurement comes from the Gyroscope.
5. The string "Body" refers to Body Acceleration while "Gravity" refers to Gravity Acceleration.
6. Jerk refers to Jerk signals, a derivation in time of the body linear acceleration and the angular velocity.
7. The string "Mag" denotes the calculation of the magnitude of the trhee-dimensional signals using the Euclidean norm.
8. "mean" refers to variables that were obtained from variables describing the mean of a measurement.
9. "std" refers to variables that were obtained from variables describing the standard deviation of a measurement.
10. The suffixes "X", "Y", and "Z" denote that the measurement was part of a 3-axial measurement, broken down in each axis. Each suffix describes the corresponding axis. 

The full list of the variables in the dataset is:

* Summary
* tBodyAcc.mean...X
* tBodyAcc.mean...Y          
* tBodyAcc.mean...Z
* tBodyAcc.std...X
* tBodyAcc.std...Y           
* tBodyAcc.std...Z
* tGravityAcc.mean...X
* tGravityAcc.mean...Y       
* tGravityAcc.mean...Z
* tGravityAcc.std...X
* tGravityAcc.std...Y        
* tGravityAcc.std...Z
* tBodyAccJerk.mean...X
* tBodyAccJerk.mean...Y      
* tBodyAccJerk.mean...Z
* tBodyAccJerk.std...X
* tBodyAccJerk.std...Y       
* tBodyAccJerk.std...Z
* tBodyGyro.mean...X
* tBodyGyro.mean...Y         
* tBodyGyro.mean...Z
* tBodyGyro.std...X
* tBodyGyro.std...Y          
* tBodyGyro.std...Z
* tBodyGyroJerk.mean...X
* tBodyGyroJerk.mean...Y     
* tBodyGyroJerk.mean...Z
* tBodyGyroJerk.std...X
* tBodyGyroJerk.std...Y      
* tBodyGyroJerk.std...Z
* tBodyAccMag.mean..
* tBodyAccMag.std..          
* tGravityAccMag.mean..
* tGravityAccMag.std..
* tBodyAccJerkMag.mean..     
* tBodyAccJerkMag.std..
* tBodyGyroMag.mean..
* tBodyGyroMag.std..         
* tBodyGyroJerkMag.mean..
* tBodyGyroJerkMag.std..
* fBodyAcc.mean...X          
* fBodyAcc.mean...Y
* fBodyAcc.mean...Z
* fBodyAcc.std...X           
* fBodyAcc.std...Y
* fBodyAcc.std...Z
* fBodyAccJerk.mean...X      
* fBodyAccJerk.mean...Y
* fBodyAccJerk.mean...Z
* fBodyAccJerk.std...X       
* fBodyAccJerk.std...Y
* fBodyAccJerk.std...Z
* fBodyGyro.mean...X         
* fBodyGyro.mean...Y
* fBodyGyro.mean...Z
* fBodyGyro.std...X          
* fBodyGyro.std...Y
* fBodyGyro.std...Z
* fBodyAccMag.mean..         
* fBodyAccMag.std..
* fBodyBodyAccJerkMag.mean..
* fBodyBodyAccJerkMag.std..  
* fBodyBodyGyroMag.mean..
* fBodyBodyGyroMag.std..
* fBodyBodyGyroJerkMag.mean..
* fBodyBodyGyroJerkMag.std..


## Reasoning and steps to obtain output
The output was obtained by running a script called run_analysis.R. The reasoning behind the analysis and the code used is presented as follows: 

First, the relevant files for the analysis were singled out. Judging by the scope of the analysis and the size of the files, it was determined that the files inside the two "Inertial Signals" directories were no relevant for this analysis.
The files utilized in the analysis were: activity_labels.txt, features.txt, subject_train.txt, X_train.txt, y_train.txt, subject_test.txt, X_test.txt and y_test.txt.

The files were read into R, asigning variables with the same name as the text files, as follows:

![Code](http://imageshack.com/a/img907/2994/PKMn06.jpg)

Since the ultimate goal of the analysis was to present a summary of certain variables for each of the subjects that participated in the survey and the activities they performed, it was decided to change the four variables (two from the Train Set and two from the Test set) containing the activities and subjects from numbers to descriptions early-on, as they would be more manageable. The code used was:

![Code](http://imageshack.com/a/img910/7657/EXyXYj.jpg)

Once the data inside the variables wouldn't be changed, two sets, one for the Train set and one for the Test set, were created. They were then joined to form a single set with all the information, and the variable names added from activity_labels.

![Code](http://imageshack.com/a/img905/6756/xXNWbK.jpg)

As the desired variables to be analyzed were those representing a mean or a standard deviation, only the variables that had mean() or std() in their name were selected, as other variables didn't satisfy that condition (even though gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean are means, they formed part of another variable [angle()] that used them to obtain a result, and were not stand alone, thus were not included; those named meanFreq() were also not included). The columns containing the variables for the analysis were manually subsetted:

![Code](http://imageshack.com/a/img907/8411/OuTUBj.jpg)

Two different analyses were needed, one obtaining the means of the variables for every activity, and one for every subject:

![Code](http://imageshack.com/a/img907/6515/l6O1tp.jpg)

Once the two data sets had been created, in order to combine them the two needed to have the same variable names. The names "Activity" and "Subject" were replaced with the name "Summary" in a new variable, and then the names of the two data sets were replaced with the variable.

![Code](http://imageshack.com/a/img908/1929/lhu379.jpg)

Now, having the two data sets with equal variable names, they were combined into a final data set called "summary", which represented the result from our analysis. We aslo assign the variable names to the final data set.

![Code](http://imageshack.com/a/img911/5579/AbMO4B.jpg)

Finally, the resulting data set was stored in the working directory by the name "tidy_data.txt", using the following code:

![Code](http://imageshack.com/a/img910/8568/otFE7K.jpg)

The saved file is the one presented as the final, tidy data set.
