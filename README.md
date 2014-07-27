GettingCleaningData
===================

This project is aimed at cleaning the "UCI HAR Dataset" test and training datasets into one, tidy dataset.  The R-script provided proceeds as follows.

First, the training and test data are read in, assuming the UCI HAR dataset is in the working directory.  Secondly, the test and training data are merged.  The variables are renamed according to the codebook provided in the project.  Any columns not referring to measurements of standard deviations or mean values are removed.  The tidied data set is then written to a file called "tidyData.txt".
