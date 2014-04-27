UCI\_DS\_3
========

This is a repository for a project undertaken as part of the coursework in the course 'Getting and Cleaning Data'.

###Running Instructions
  - Download the input data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into your working directory
  - Copy the run\_analysis.R in your working directory
  - Load the the run\_analysis.R in RStudio
  - Call the function run\_analysis
  - This will produce two output files tidy\_data\_1.txt and tidy\_data\_2.txt in your working directory

###Assumptions / Restrictions
The code assumes that the data folder UCI HAR Dataset is available in the same folder as the script. If that is not maintained, the script will fail.

###Transformation Steps
  - The input data is sourced from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  - The data folder was downloaded and extracted manually into the root of the source directory. After this step, the input data is available in the folder named UCI HAR Dataset under the root folder.
  - Once the input data is in place, the analysis as per the instructions is carried out by the function run\_analysis defined in the file run\_analysis.R. It goes through the following steps to complete the analysis.
    -  reading training data from files
    -  reading test data from files
    -  combining training and test data
    -  reading from features.txt
    -  filtering to extract mean and standard deviation feature names from dataset
    -  naming columns in the dataset appropriately
    -  editing the column names to remove brackets and converting them to all lower case
    -  reading the activity labels dictionary
    -  cleaning the activity names
    -  naming the labels in the label set
    -  combining the activity set , label set and data set
    -  naming the first two columns
    -  outputting data set to a text file. 
    -  reshaping data set
    -  creating new data set with means 
    -  outputting data set to a text file
  
The total outcome of the processing are two datasets in two data files tidy\_data\_1.txt and tidy\_data\_2.txt. 

tidy\_data\_1.txt contains the data set after the extracting only the means and standard deviation columns from the input data set and required clean ups. Is has 10299 rows and 68 columns. Here the first two columns are the subject and activity for each record and the rest of the columns are the mean and standard deviation observations.

tidy\_data\_2.txt contains the means of observation columns for each subject and activity label. It has 180 rows and 68 columns.

