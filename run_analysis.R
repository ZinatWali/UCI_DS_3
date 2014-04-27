run_analysis <- function(){
    library(reshape2)
    
    # Step 1
    
    # reading training data from files
    train_data_set <- read.table("UCI HAR Dataset/train/X_train.txt")  
    train_label_set <- read.table("UCI HAR Dataset/train/y_train.txt")
    train_subject_set <- read.table("UCI HAR Dataset/train/subject_train.txt")
    
    # reading test data from files
    test_data_set <- read.table("UCI HAR Dataset/test/X_test.txt")  
    test_label_set <- read.table("UCI HAR Dataset/test/y_test.txt")
    test_subject_set <- read.table("UCI HAR Dataset/test/subject_test.txt")
    
    # combining training and test data
    data_set <- rbind(train_data_set, test_data_set)
    label_set <- rbind(train_label_set, test_label_set)
    subject_set <- rbind(train_subject_set, test_subject_set)
    
    # Step 2
    
    # reading from features.txt
    feature_set <- read.table("UCI HAR Dataset/features.txt", colClasses="character")
    
    # filtering to extract mean and standard deviation feature names from dataset
    relevant_features <- grep("-mean\\(\\)|-std\\(\\)", feature_set$V2)
    data_set <- data_set[, relevant_features]
    
    # naming columns in the dataset appropriately
    names(data_set) <- feature_set[relevant_features, 2]
    
    # editing the column names to remove brackets and converting them to all lower case
    names(data_set) <- gsub("\\(|\\)", "", names(data_set))
    names(data_set) <- tolower(names(data_set))
  
    # Step 3
    
    # reading the activity labels dictionary
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", colClasses="character")
    
    # cleaning the activity names
    activity_labels[, 2] <- gsub('_', '', tolower(activity_labels[, 2]))
    
    # naming the labels in the label set 
    label_set[, 1] <- activity_labels[label_set[,1], 2]
        
    # Step 4
    
    # combining the activity set , label set and data set
    data_set <- cbind(subject_set, label_set, data_set)
    
    # naming the first two columns
    names(data_set)[1] <- 'subject'
    names(data_set)[2] <- 'activity'
    
    # outputing data set to a text file 
    write.table(data_set, "tidy_data_1.txt")
  
    #Step 5
    
    # reshaping data set 
    result <- melt(data_set, 1:2)
    
    # creating new data set with means 
    summary_data_set <- dcast(result, subject + activity ~ variable, mean)
    
    # outputing data set to a text file
    write.table(summary_data_set, "tidy_data_2.txt")
}