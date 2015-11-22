## Project - run_analysis.R

run_analysis <- function(){
 
  activity_labels = read.csv("./UCI HAR Dataset/activity_labels.txt", header = F, sep ="")
  activity_labels = read.csv("./UCI HAR Dataset/activity_labels.txt", header = F, sep ="")
  features = read.csv("./UCI HAR Dataset/features.txt", header = F, sep = "")
  subject_train = read.csv("./UCI HAR Dataset/train/subject_train.txt", header = F)
  x_train = read.csv("./UCI HAR Dataset/train/x_train.txt", header = F, sep = "")
  x_test = read.csv("./UCI HAR Dataset/test/x_test.txt", header = F, sep = "")
  y_train = read.csv("./UCI HAR Dataset/train/y_train.txt", header = F)
  y_test = read.csv("./UCI HAR Dataset/test/y_test.txt", header = F)
  subject_test = read.csv("./UCI HAR Dataset/test/subject_test.txt", header = F)
  
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

  test_set = cbind(x_test, y_test, subject_test)
  train_set = cbind(x_train, y_train, subject_train)
  full_set = rbind(test_set, train_set)
  names = c(as.vector(features[,2]), "Activity", "Subject")
  names(full_set) = names
  
  sub_set = full_set[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543, 562:563)]
  
  summary_activity = sub_set %>% group_by(Activity) %>% summarise_each(funs(mean), -Subject)
  summary_subject = sub_set %>% group_by(Subject) %>% summarise_each(funs(mean), -Activity)
  
  sum_names = names(summary_activity)
  sum_names[1] = "Summary"
  names(summary_activity) = sum_names
  names(summary_subject) = sum_names
  
  summary = rbind(as.data.frame(summary_activity), as.data.frame(summary_subject))
  names(summary) = sum_names
  
  write.table(summary, file = "tidy_data.txt", row.names = FALSE)
}