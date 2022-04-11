# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ++ Reset activity labels to descriptive labels
#     1 WALKING
#     2 WALKING_UPSTAIRS
#     3 WALKING_DOWNSTAIRS
#     4 SITTING
#     5 STANDING
#     6 LAYING
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

renameActivity <- function (i)
{
  activityVector = c("WALKING", "WALKING_UPSTAIRS", 
                           "WALKING_DOWNSTAIRS", "SITTING", 
                           "STANDING", "LAYING")
  return (activityVector[i])
}

setActivityNames <- function(activityFile)
{
  activity <- read.table(activityFile, sep = "", col.names = c("Activity"))
  len <- nrow(activity)

  for (i in 1:len) {
    activity[i, 1] <- renameActivity(as.integer(activity[i, 1]))
  }

  return (activity)
}

setSubjectNames <- function(subjectFile)
{
  subjectHandle = file(subjectFile, "r")
  subjectVector <- vector()
  
  len <- length(readLines(subjectFile))
  i <- 1
  while ( i <= len ) {
    subjectVector[i] <- readLines(subjectHandle, n = 1)
    i <- i + 1
  }
  close(subjectHandle)
  
  return (subjectVector)
}


setFileVector <- function(directory)
{
  fileVector <- c()
  
  fileVector[1]  <- directory
  fileVector[2]  <- paste(directory, "features.txt", sep = "")
  
  fileVector[3]  <- paste(directory, "train/X_train.txt", sep = "")
  fileVector[4]  <- paste(directory, "train/y_train.txt", sep = "")
  fileVector[5]  <- paste(directory, "train/subject_train.txt", sep = "")
  
  fileVector[6]  <- paste(directory, "test/X_test.txt", sep = "")
  fileVector[7]  <- paste(directory, "test/y_test.txt", sep = "")
  fileVector[8]  <- paste(directory, "test/subject_test.txt", sep = "")

  fileVector[9]  <- paste(directory, "updated_features.csv", sep = "")
  fileVector[10] <- paste(directory, "merged_raw_files.csv", sep = "")
  fileVector[11] <- paste(directory, "merged_cleaned_files.csv", sep = "")
  fileVector[12] <- paste(directory, "mean_std_files.csv", sep = "")
  
  names(fileVector) = c("dir", "features", "X_train", "y_train", "training_subjs", 
                        "X_test", "y_test", "testing_subjs", "updated_features",
                        "raw_data", "clean_data", "mean_std")
  
  return (fileVector)
}

getMeanColumns <- function(data)
{
  data <- data %>% select(ends_with("MEAN") | ends_with("STD"))
  return (data)
#  vector <- sapply(features, ends_with(features, "MEAN"))
#  return (data)
}
