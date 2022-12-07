##############################
# Data Quality Metrics
#
# 12/07/2022
#
# Joshua D. Ingram
##############################

# aad
# input: df - dataframe of data, n_needed - integer for number of data needed in each column
# returns: dataframe of scores for appropriate amount for each column (metrics from 0 to 1)
aad <- function(df, n_needed = nrow(df)){
  
  # metric for the appropriate amount of data
  # do not include NAs in lengths of each column
  ratio1 <- sapply(df, function(x){sum(!is.na(x))/n_needed})
  ratio2 <- sapply(df, function(x){n_needed/sum(!is.na(x))})
  appropriate_amnt <- pmin(ratio1, ratio2)
  
  return(data.frame(attribute = colnames(df), appropriate_amnt))
  
}

# completeness
# input: df - dataframe of data
# returns: dataframe of scores of completeness for eaech column (metrics from 0 to 1)
completeness <- function(df) {
  
  # get the proportion of non-NA values for each column in the dataframe
  completeness <- 1 - sapply(as.data.frame(sapply(df, is.na)), mean)
  
  return(data.frame(attribute = colnames(df), completeness))
  
}

# consistency
# input: df - dataframe of data, format - vector of object classes to check for
# returns: dataframe of scores of consistency for each column (metrics from 0 to 1)
consistency <- function(df, format) {
  # df
  # format - vector of characters (correspond to object classes in R)
  # for each column:
  # check the class type of each object in the column, compare to format vector
  
  # return a data frame
  
  
}