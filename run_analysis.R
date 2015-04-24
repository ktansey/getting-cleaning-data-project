library(dplyr)
library(plyr)


### Load in data
features <- read.table('features.txt')
activity <- read.table('activity_labels.txt')

subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")


### Merge data together 
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)


### Assign column names to the test data imported above
### This labels the data set with descriptive variable names (step 4) 
colnames(subject) = "subjectId"
colnames(x_data) = features[,2] 
colnames(y_data)= "activityId"


### Extract just mean and std information (step 2)
mean_std_col <- filter(features, grepl('mean|std', V2))[,2]
mean_std_data <- x_data[ , mean_std_col]
  
### Merge all data together (step 1)
all_data <- cbind(y_data,subject,mean_std_data)


### Add descriptive activity names to name the activities in the data set (step 3)
colnames(activity) = c("activityId", "Activities")
final_data = merge(all_data,activity,by='activityId',all.x=TRUE)


### Create averages per variable for each activity for each person (step 5)
avg_data <- ddply(final_data, .(subjectId, Activities), function(x) colMeans(x[, 3:81]))

### Write ave_data to a txt file
write.table(avg_data, file="Tansey_GCdata_Project_averagesdata_24april2015.txt", row.names=FALSE)
