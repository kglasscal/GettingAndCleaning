
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ++ Use  "UCI HAR Dataset/"
#
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

test_pipeline <- function(directory)
{
  fileVector <- setFileVector(directory)
  
  len = length(fileVector)
  for (i in 1:len) {
    cat("test_pipeline -- fileVector[", i, "] = ", fileVector[i], "\n")
  }
  
}

test_renameActivity <- function()
{
  for (i in 1:6) {
    cat("test_renameActivity -- label[", i, "] = ", renameActivity(i), "\n") 
  }
}

test_setActivityNames <- function(yDataFile)
{
  names <- setActivityNames(yDataFile)
  cat("test_setActivityNames -- names \n", names," names type ", typeof(names), "\n") 
}

test_setSubjects <- function(subjectFile)
{
  subjects <- setSubjectNames(subjectFile)
  cat("test_setActivityNames -- subjects \n", subjects," subjects type ", typeof(subjects), "\n") 
}


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ++ Testing functions
# ++ Use file "UCI HAR Dataset/features.txt"
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
test_loadFeatureList <- function(featureFile = "UCI HAR Dataset/features.txt")
{
  print("Starting TEST")
  featureVector <- loadFeatureVector(featureFile)
  
  print("Ended TEST")
  return (featureVector)
}

test_featureList <- function(featureSrc, fileName)
{
  print("Starting TEST")
  
  featureDF <- parseDetector(featureFile = featureSrc) #"UCI HAR Dataset/features.txt")

  
  print("Ended TEST")
  
  return (featureVector)
}

