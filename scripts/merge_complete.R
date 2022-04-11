# merge X_train.txt with X_test.txt, y_train.txt with y_test.txt
#   read the files into data tables
#   set column names
#   merge tables
#   turn "activities" values into factors 
#
# set column names
#   get column names from features.txt
#   convert names from UCI to KG names
#
# read files into data tables
#
# merge data tables
#
#
# turn subject activities into factors

library(dplyr)
library(data.table)

VERBOSE = FALSE
TEST    = FALSE

setVerbose <- function(boolean)
{
  VERBOSE <- boolean
}

setVerbose <- function(boolean)
{
  TEST <- boolean
}




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
# + 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
mergeFiles <- function(fileVector, features)
{
  
  xDataTable <- mergeXData(features, fileVector["X_train"], fileVector["X_test"])
  yDataTable <- mergeYData(fileVector["y_train"], fileVector["y_test"])

  subjectsTable <- mergeSubjectData(fileVector["training_subjs"], 
                                      fileVector["testing_subjs"])
  merged  <- cbind(xDataTable, yDataTable)
  merged  <- cbind(subjectsTable, merged)
  
#  cat("mergeFiles -- typeof yTestData ", class(merged), "\n")  
#  cat("mergeFiles -- yTestData ", length(merged), " ", nrow(merged), "\n")  
#  cat("mergeFiles -- yTestData ", colnames(xDataTable), "\n")  
  
  return (merged)
}

mergeXData <- function(features, X_training, X_testing)
{
  XTrainData <- read.table(X_training, sep = "", col.names = features) #, n = 7352)
  XTestData <- read.table(X_testing, sep = "", col.names = features)#, n = 2947)
  XCombined <- rbind(XTrainData, XTestData)

#  cat("mergeXData -- typeof XTestData ", class(XTestData), "\n")  
#  cat("mergeXData -- XCombined ", length(XCombined), " ", nrow(XCombined), "\n")  
#  cat("mergeXData -- XCombined ", colnames(XCombined), "\n")  
  
  return (XCombined)
}

mergeYData <- function(y_training, y_testing)
{
  yTrainData <- setActivityNames(y_training) # n = 7352
  yTestData <- setActivityNames(y_testing)  # n = 2947
  yCombined <-rbind(yTrainData, yTestData)

#  cat("mergeYData -- typeof yTestData ", class(yTestData), "\n")  
#  cat("mergeYData -- yTestData ", length(yTestData), " ", nrow(yTestData), "\n")  
#  cat("mergeYData -- yTestData ", colnames(yTestData), "\n")  
#  print(yTestData)  
  
  return (yCombined)
}

mergeSubjectData <- function(training_subjs, testing_subjs)
{
  SubjTrainData <- read.table(training_subjs, sep = "", col.names = c('SUBJECT ID'))
  SubjTestData <- read.table(testing_subjs, sep = "", col.names = c('SUBJECT ID'))
  SubjCombined <- rbind(SubjTrainData, SubjTestData)
  
#  cat("mergeSubjectData -- typeof XTestData ", class(SubjTestData), "\n")  
#  cat("mergeSubjectData -- XCombined ", length(SubjCombined), " ", nrow(SubjCombined), "\n")  
#  cat("mergeSubjectData -- XCombined ", colnames(SubjCombined), "\n")  
  
  return (SubjCombined)
}


