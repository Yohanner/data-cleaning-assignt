#QUESTION 1

#Read training data
x_train=read.table("C:/Yohannes/Coursera/Getting and cleaning data/Course project/data/UCI HAR Dataset/train/X_train.txt")
y_train=read.table("C:/Yohannes/Coursera/Getting and cleaning data/Course project/data/UCI HAR Dataset/train/y_train.txt")
subject_train=read.table("C:/Yohannes/Coursera/Getting and cleaning data/Course project/data/UCI HAR Dataset/train/subject_train.txt")

#Read test data
x_test=read.table("C:/Yohannes/Coursera/Getting and cleaning data/Course project/data/UCI HAR Dataset/test/X_test.txt")
y_test=read.table("C:/Yohannes/Coursera/Getting and cleaning data/Course project/data/UCI HAR Dataset/test/y_test.txt")
subject_test=read.table("C:/Yohannes/Coursera/Getting and cleaning data/Course project/data/UCI HAR Dataset/test/subject_test.txt")

#Read feature data
Features=read.table("C:/Yohannes/Coursera/Getting and cleaning data/Course project/data/UCI HAR Dataset/features.txt")

#Read activity labels
activity=read.table("C:/Yohannes/Coursera/Getting and cleaning data/Course project/data/UCI HAR Dataset/activity_labels.txt")

#create x dataset
x_dataset=rbind(x_train,x_test)
names(x_dataset)=

#create y dataset
y_dataset=rbind(y_train,y_test)

#QUESTION 2

#Identify variables with std and mean in their names
mean_std <- grep(".*mean.*|.*std.*", Features[, 2])

#Select the columns and put the right column name
x_dataset=x_dataset[,mean_std]
names(x_dataset)=Features[mean_std,2]
head(x_dataset)

#QUESTION 3
str(y_dataset)
col=y_dataset[, 1]
y_dataset[, 1] <- activity[col, 2]
names(y_dataset)="Activity"

#QUESTION 4
dim(x_dataset)
dim(y_dataset)
dim(x_dataset)
head(subject_train)
subject_test_train=rbind(subject_train,subject_test)
names(subject_test_train)
names(subject_test_train)="subject"
All_dataset=cbind(x_dataset,y_dataset,subject_test_train)
head(All_dataset)
tail(All_dataset)
names(All_dataset)

#QUESTION 5
data_melt <- melt(All_dataset,id.vars= c("subject","Activity"))
data_melt_mean <- dcast(data_melt, subject+Activity ~ variable, fun.aggregate=mean)
write.table(data_melt_mean, "C:/Yohannes/Coursera/Getting and cleaning data/Course project/tidy_data.txt", row.names = FALSE, quote = FALSE)
