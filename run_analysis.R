#load data sets
x_train <- read.table("x_train.txt")
x_test <- read.table("x_test.txt")

#load activities
train_activities <- read.table("y_train.txt")
test_activities <- read.table("y_test.txt")

#load activity names and subjects
a_names <- read.table("activity_labels.txt")
train_subjects <- read.table("subject_train.txt")
test_subjects <- read.table("subject_test.txt")

#name activities
train_named_a <- merge(train_activities, a_names)
test_named_a <- merge(test_activities, a_names)

#add activities to data sets
train <- cbind(x_train, train_named_a[[2]], train_subjects[[1]])
test <- cbind(x_test, test_named_a[[2]], test_subjects[[1]])

#load column names
data_names <- as.vector(read.table("features.txt")[,2])
data_names <- append(data_names, c("activity", "subject"))
    
#add labels to combined data set
names(test) <- data_names
names(train) <- data_names

#combine data sets
combined <- rbind(test, train)

#find mean & std columns & add subject and activity columns
mean_std <- append(grep("mean()",data_names), grep("std()",data_names))
mean_std <- append(mean_std, c(562, 563))

#extract mean & std columns
combined <- combined[,mean_std]

#create tidy data set
tidy <- tapply(combined[,1], list(combined$activity, combined$subject), 
               mean, rm.na=TRUE)

#clean up memory
rm(x_train)
rm(x_test)
rm(test)
rm(train)
rm(a_names)
rm(train_activities)
rm(test_activities)
rm(train_named_a)
rm(test_named_a)
rm(data_names)
rm(mean_std)
