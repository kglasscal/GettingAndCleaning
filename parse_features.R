# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ++ Load feature data into featureVector 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ------------------------------------------------------------------------------
# loadFeatureVector
# 
# ------------------------------------------------------------------------------
loadFeatureVector <- function(featureFile)
{
#  cat("loadFeatureVector -- featureFile = ", featureFile, "\n")
  featureHandle = file(featureFile, "r")
  featureVector <- vector()

  len <- length(readLines(featureFile))
  i <- 1
  while ( i <= len ) {
    feature <- readLines(featureHandle, n = 1)
    featureVector[i] <- strsplit(feature, " ")[[1]][2]
    i <- i + 1
  }
  close(featureHandle)

  return (featureVector)
}

# ------------------------------------------------------------------------------
# Statistical Measures Sets
# 
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# stats_1
# 
# ------------------------------------------------------------------------------
stats_1 <- function(feature, rename)
{
  # break on - => measure[[1]][1] is the measure, measure[[1]][2] are the args
  measureInput <- regmatches(feature, regexpr("-", feature), invert = TRUE)
  measure <- measureInput[[1]][1]
  arguments <- measureInput[[1]][2]
  
  measure <- substr(measure, 1, nchar(measure) - 2)

  if (measure == "mean") {
    rename <- paste(rename, arguments, "_MEAN", sep = "")
  } else if (measure == "std") {
    rename <- paste(rename, arguments, "_STD", sep = "")
  } else if (measure == "mad") {
    rename <- paste(rename, arguments, "_MAD", sep = "")
  } else if (measure == "max") {
    rename <- paste(rename, arguments, "_MAX", sep = "")
  } else if (measure == "min") {
    rename <- paste(rename, arguments, "_MIN", sep = "")
  } else if (measure == "energy") {
    rename <- paste(rename, arguments, "_ENERGY", sep = "")
  } else if (measure == "iqr") {
    rename <- paste(rename, arguments, "_IQR", sep = "")
  } else if (measure == "entropy") {
    rename <- paste(rename, arguments, "_ENTROPY", sep = "")
  } else if (measure == "sma") {
    rename <- paste(rename, "SMA", sep = "")
  } else if (measure == "arCoeff") {
    rename <- paste(rename, "AR[", arguments, "]", sep = "")
  } else if (measure == "correlation") {
    rename <- paste(rename, "CORR[", arguments, "]",sep = "")
  } else  {
    rename <- paste(rename, "_ERROR", sep = "")
  }

  return (rename)
} 

# ------------------------------------------------------------------------------
# stats_2
# 
# ------------------------------------------------------------------------------
stats_2 <- function(feature, rename)
{
  # break on - => measure[[1]][1] is the measure, measure[[1]][2] are the args
  measureInput <- regmatches(feature, regexpr("-", feature), invert = TRUE)
  measure <- measureInput[[1]][1]
  if (measure == "maxInds") {
    rename <- paste(rename, "_MaxInds", sep = "")
    return (rename)
  }
  
  arguments <- measureInput[[1]][2]

  measure <- substr(measure, 1, nchar(measure) - 2)
  if (measure == "mean") {
    rename <- paste(rename, arguments, "_MEAN", sep = "")
  } else if (measure == "std") {
    rename <- paste(rename, arguments, "_STD", sep = "")
  } else if (measure == "mad") {
    rename <- paste(rename, arguments, "_MAD", sep = "")
  } else if (measure == "max") {
    rename <- paste(rename, arguments, "_MAX", sep = "")
  } else if (measure == "min") {
    rename <- paste(rename, arguments, "_MIN", sep = "")
  } else if (measure == "energy") {
    rename <- paste(rename, arguments, "_ENERGY", sep = "")
  } else if (measure == "iqr") {
    rename <- paste(rename, arguments, "_IQR", sep = "")
  } else if (measure == "entropy") {
    rename <- paste(rename, arguments, "_ENTROPY", sep = "")
  } else if (measure == "meanFreq") {
    rename <- paste(rename, arguments, "_MeanFreq", sep = "")
  } else if (measure == "skewness") {
    rename <- paste(rename, arguments, "_SKEW", sep = "")
  } else if (measure == "kurtosis") {
    rename <- paste(rename, arguments, "_KURT", sep = "")
  } else if (measure == "sma") {
    rename <- paste(rename, "SMA", sep = "")
  } else if (measure == "bandsEnergy") {
    rename <- paste(rename, "Band[", arguments, "]", sep = "")
  } else  {
    rename <- paste(rename, "_ERROR", sep = "")
  }
  
  return (rename)
}

# ------------------------------------------------------------------------------
# stats_3
# 
# ------------------------------------------------------------------------------
stats_3 <- function(feature, rename)
{
  # break on - => measure[[1]][1] is the measure, measure[[1]][2] are the args
  measureInput <- strsplit(feature, "()", fixed=T)
  measure <- measureInput[[1]][1]
  
  arguments <- measureInput[[1]][2]

  if (measure == "mean") {
    rename <- paste(rename, "MEAN", sep = "")
  } else if (measure == "std") {
    rename <- paste(rename, "STD", sep = "")
  } else if (measure == "mad") {
    rename <- paste(rename, "MAD", sep = "")
  } else if (measure == "max") {
    rename <- paste(rename, "MAX", sep = "")
  } else if (measure == "min") {
    rename <- paste(rename, "MIN", sep = "")
  } else if (measure == "energy") {
    rename <- paste(rename, "ENERGY", sep = "")
  } else if (measure == "iqr") {
    rename <- paste(rename, "IQR", sep = "")
  } else if (measure == "entropy") {
    rename <- paste(rename, "ENTROPY", sep = "")
  } else if (measure == "sma") {
    rename <- paste(rename, "SMA", sep = "")
  } else if (measure == "arCoeff") {
    rename <- paste(rename, "AR[", arguments, "]", sep = "")
  } else  {
    rename <- paste(rename, "ERROR", sep = "")
  }
  
  return (rename)
}

# ------------------------------------------------------------------------------
# stats_4
# 
# ------------------------------------------------------------------------------
stats_4 <- function(feature, rename)
{
  # break on - => measure[[1]][1] is the measure, measure[[1]][2] are the args
  measureInput <- strsplit(feature, "()", fixed=T)
  measure <- measureInput[[1]][1]
  arguments <- measureInput[[1]][2]

  if (measure == "mean") {
    return (paste(rename, "MEAN", sep = ""))
  } else if (measure == "std") {
    return (paste(rename, "STD", sep = ""))
  } else if (measure == "mad") {
    return (paste(rename, "MAD", sep = ""))
  } else if (measure == "max") {
    return (paste(rename, "MAX", sep = ""))
  } else if (measure == "min") {
    return (paste(rename, "MIN", sep = ""))
  } else if (measure == "energy") {
    return (paste(rename, "ENERGY", sep = ""))
  } else if (measure == "iqr") {
    return (paste(rename, "IQR", sep = ""))
  } else if (measure == "entropy") {
    return (paste(rename, "ENTROPY", sep = ""))
  } else if (measure == "sma") {
    return (paste(rename, "SMA", sep = ""))
  } else if (measure == "skewness") {
    return (paste(rename, "SKEW", sep = ""))
  } else if (measure == "kurtosis") {
    return (paste(rename, "KURT", sep = ""))
  } else if (measure == "meanFreq") {
    return (paste(rename, "MeanFreq", sep = ""))
  } else if (measure == "maxInds") {
    return (paste(rename, "MaxInds", sep = ""))
  } else  {
    return (paste(rename, "ERROR", sep = ""))
  }
  
  return (paste(rename, "ERROR", sep = ""))
}

# ------------------------------------------------------------------------------
# parseObjectDetector
# 
# ------------------------------------------------------------------------------
parseObjectDetector <- function(feature)
{
  # remove "tBody"
  detector <- regmatches(feature, regexpr("tBody", feature), invert = TRUE)

  motion <- regmatches(detector[[1]][2], regexpr("Acc-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_1(motion[[1]][2], "PA_Object_"))
  } 

  motion <- regmatches(detector[[1]][2], regexpr("AccMag-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_3(motion[[1]][2], "PA_Mag_"))
  }

  motion <- regmatches(detector[[1]][2], regexpr("AccJerk-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_1(motion[[1]][2], "PA_Jerk_"))
  }

  motion <- regmatches(detector[[1]][2], regexpr("AccJerkMag-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_3(motion[[1]][2], "PA_Jerk_Mag_"))
  }
  
  motion <- regmatches(detector[[1]][2], regexpr("Gyro-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_1(motion[[1]][2], "PG_Object_"))
  }
  
  motion <- regmatches(detector[[1]][2], regexpr("GyroMag-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_3(motion[[1]][2], "PG_Mag_"))
  }
  
  motion <- regmatches(detector[[1]][2], regexpr("GyroJerk-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_1(motion[[1]][2], "PG_Jerk_"))
  }
  
  motion <- regmatches(detector[[1]][2], regexpr("GyroJerkMag-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_3(motion[[1]][2], "PG_Jerk_Mag_"))
  }
  return (paste(feature, "ERROR", sep = ""))
}
# ------------------------------------------------------------------------------
# parseFFTSignals
# 
# ------------------------------------------------------------------------------
parseFFTSignals <- function(feature)
{
#  cat("parseFFTSignals -- feature = ", feature, "\n")
  # remove "tBody"
  if (substr(feature, 1, 9) == "fBodyBody") {
    detector <- regmatches(feature, regexpr("fBodyBody", feature), invert = TRUE)
  } else if (substr(feature, 1, 5) == "fBody") {
    detector <- regmatches(feature, regexpr("fBody", feature), invert = TRUE)
  } else {
    return (paste(feature, "ERROR", sep = ""))
  }
  
  
  motion <- regmatches(detector[[1]][2], regexpr("Acc-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_2(motion[[1]][2], "FFT_PA_Object_"))
  } 
  
  motion <- regmatches(detector[[1]][2], regexpr("AccJerk-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_2(motion[[1]][2], "FFT_PA_Jerk_"))
  }
  
  motion <- regmatches(detector[[1]][2], regexpr("Gyro-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_2(motion[[1]][2], "FFT_PG_Object_"))
  }
  
  motion <- regmatches(detector[[1]][2], regexpr("AccMag-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_4(motion[[1]][2], "FFT_PA_Mag_"))
  }
  
  motion <- regmatches(detector[[1]][2], regexpr("AccJerkMag-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_4(motion[[1]][2], "FFT_PA_Jerk_Mag_"))
  }
  
  motion <- regmatches(detector[[1]][2], regexpr("GyroJerkMag-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_4(motion[[1]][2], "PG_Jerk_Mag_"))
  }
  
  motion <- regmatches(detector[[1]][2], regexpr("GyroMag-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_4(motion[[1]][2], "PG_Gyro_Mag_"))
  }

  return (paste(feature, "ERROR", sep = ""))
}
# ------------------------------------------------------------------------------
# parseAngles
# 
# ------------------------------------------------------------------------------
parseAngles <- function(feature)
{
  detector <- strsplit(feature, "(", fixed=T)

  if (detector[[1]][2] == "tBodyAccMean,gravity)") {
    return ("Angle PA_Object_MEAN, Gravity")
  } 
  if (detector[[1]][2] == "tBodyAccJerkMean),gravityMean)") {
    return ("Angle PA_Jerk_MEAN, Gravity")
  } 
  if (detector[[1]][2] == "tBodyGyroMean,gravityMean)") {
    return ("Angle PG_Object_MEAN, Gravity")
  } 
  if (detector[[1]][2] == "tBodyGyroJerkMean,gravityMean)") {
    return ("Angle PG_Jerk_MEAN, Gravity")
  } 
  if (detector[[1]][2] == "X,gravityMean)") {
    return ("Angle X, Gravity")
  } 
  if (detector[[1]][2] == "Y,gravityMean)") {
    return ("Angle Y, Gravity")
  } 
  if (detector[[1]][2] == "Z,gravityMean)") {
    return ("Angle Z, Gravity")
  } 

  return (paste(feature, "ERROR", sep = ""))
}

# ------------------------------------------------------------------------------
# parseGyroDetector
# 
# ------------------------------------------------------------------------------
parseGravity <- function(feature)
{
  detector <- regmatches(feature, regexpr("tGravity", feature), invert = TRUE)
  
  motion <- regmatches(detector[[1]][2], regexpr("Acc-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_1(motion[[1]][2], "PA_Gravity_"))
  } 
  
  motion <- regmatches(detector[[1]][2], regexpr("AccMag-", detector[[1]][2]), invert = TRUE)
  if (motion[[1]][1]  == "") {
    return (stats_3(motion[[1]][2], "PA_Gravity_Mag_"))
  }
  
  return (paste(feature, "ERROR", sep = ""))
}
# ------------------------------------------------------------------------------
# loadFeatureVector
# 
# ------------------------------------------------------------------------------
parseDetector <- function(featureFile)
{
  featureVector <- loadFeatureVector(featureFile)
  lenFeatures   <- length(featureVector)
  renameVector  <- vector();
  
  for (i in 1:lenFeatures)
  {
    feature <- substr(featureVector[i], 1, 5)

    if (feature == 'tBody') {
      renamed <- parseObjectDetector(featureVector[i])
    } else if (feature == 'tGrav') {
      renamed <- parseGravity(featureVector[i])
    } else if (feature == 'fBody') {
      renamed <- parseFFTSignals(featureVector[i])
    } else if (feature == 'angle') {
      renamed <- parseAngles(featureVector[i])
    } else {
      renamed <- "ERROR"
    }

    renameVector <- c(renameVector, renamed)
  }

  featureDF <- data.frame(NewFeatureNames = renameVector, OldFeatureNames = featureVector)
  write.csv(featureDF, file = "updated_features.csv")

  return (renameVector)
}

