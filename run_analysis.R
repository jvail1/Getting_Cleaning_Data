# Load in raw files of training and test data and values for 531 features, 30 subjects and 6 activities
#There are 2,947 test measurements and 7,352 train measurements totaling 10,299 combined measures.

#These files must be downloaded from UCI website 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# and placed in the R working directory

#require package dply for data manipulation

require(dplyr)

#load lookup values for activities                                                        

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", na.strings="NA")

#rename activity value columns in activity_labels

names(activity_labels) <-  c("activity","activity_labels")

#load features detail for 561 variables/columns

features <- read.table("./UCI HAR Dataset/features.txt", na.strings="NA")

#load total observations for train and test dataset

x_train <- read.table ("./UCI HAR Dataset/train/X_train.txt", na.strings="NA")

x_test <- read.table ("./UCI HAR Dataset/test/X_test.txt", na.strings="NA")

#rename columns on train and test tables using features decodes

names(x_train) <- make.names(names=features[,2], unique=TRUE, allow_ = TRUE)

names(x_test) <- make.names(names=features[,2], unique=TRUE, allow_ = TRUE)

#load and append the train and test subjects (range 1-30)

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", na.strings="NA")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", na.strings="NA")

#rename column to subject before appending

names(subject_train) <- "subject"

names(subject_test) <- "subject"

#append subjects to x_train, x_test

x_train <- cbind(x_train, subject_train)

x_test <- cbind(x_test, subject_test)

#load subjects from y_train and y_test files

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", na.strings="NA")

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", na.strings="NA")

#rename y_train column to activity

names(y_train) <- "activity"

names(y_test) <- "activity"

#append activities to x_train and x_test

x_train <- cbind(x_train, y_train)

x_test <- cbind(x_test, y_test)

#join activity labels to x_train and x_test

x_train <- full_join(x_train, activity_labels, by="activity")

x_test <- full_join(x_test, activity_labels, by="activity")

#combine x_train and x_test

train_test <- rbind(x_train, x_test)
#create index of columns to keep mean, std, subject and 
#activity codes and labels in x_train and x_test column names

keep<- grep("mean|std|subject|activity", names(train_test))

#drop columns not in the keep columns index

train_test <- train_test[,keep]

#calculate the mean for each activity and subject in a 'tidy' data set

tidyData <- train_test %>% group_by(activity, activity_labels,subject) %>% summarise_each(funs(mean))

#write.table tidy data set out to Txt file for posting to Github

write.table(tidyData, "tidyData.txt", row.names=FALSE)
