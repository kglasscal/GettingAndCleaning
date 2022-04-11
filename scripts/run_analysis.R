library(dplyr)
library(tidyr)

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# mergeFiles is responsible for 
# +   opening, reading and storing file information including
# +   +   features.txt containing the original columns
# +
# +   +   train/X_train.txt containing the original columns 
# +   +   train/y_train.txt containing the original columns 
# +   +   train/y_train.txt containing the original columns 
# +   
# +   opening, reading and storing
# +   opening, reading and storing
# +   opening, reading and storing
# +  + "dir"
# +  + "features"
# +  + "X_train"
# +  + "y_train"
# +  + "training_subjs"
# +  + "X_test"
# +  + "y_test"
# +  + "testing_subjs"
# +  + "updated_features"
# +  + "raw_data"
# +  + "clean_data"
# +  + "mean_std"
# + data<-pipeline("UCI HAR Dataset/")
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
pipeline <- function(directory, verbose = FALSE, test = FALSE)
{
  # Create header names
  source("scripts/parse_features.R")
  source("scripts/utilities.R")
  source("scripts/merge_complete.R")
  source("scripts/clean_tibble.R")
  if (verbose) {
    setVerbose()
  }
  if (test) {
    setTest()
    source("test_set.R")
  }
  
  fileVector <- setFileVector(directory)
  features   <- parseDetector(fileVector["features"])
  write.csv(features, file = fileVector["updated_features"])
  
  # 1) Merge the data sets
  mergedTable <- mergeFiles(fileVector)
  names(mergedTable) <-  c('SUBJECT ID', features, "Activity")
  write.csv(mergedTable, file = fileVector[10])
  
  # 2) Extract the mean and std into mean/std data table
  meanDF <- getMeanColumns(mergedTable)
  write.csv(meanDF, file = fileVector[12])

  print(cleanTIB)
}

