Getting and cleaning data.

The run_analysis.R script does the follwoing:

1.Download the all the necessary datasets

x_train=read.table("../X_train.txt")
y_train=read.table("../y_train.txt")
subject_train=read.table("../subject_train.txt")
x_test=read.table("../X_test.txt")
y_test=read.table("../y_test.txt")
subject_test=read.table("../subject_test.txt")
Features=read.table("../features.txt")
Activity=read.table("../activity_labels.txt")

2.then it merges the datasets as instructed

x_dataset=rbind(x_train,x_test)
y_dataset=rbind(y_train,y_test)

3.then it filters out variables that have the words 'mean' and 'std' in them

mean_std <- grep(".*mean.*|.*std.*", Features[, 2])

4.then it assigns the right names

names(x_dataset)=Features[mean_std,2]
col=y_dataset[, 1]
y_dataset[, 1] <- activity[col, 2]
names(y_dataset)="Activity"

5.puts all the datasets into one

All_dataset=cbind(x_dataset,y_dataset,subject_test_train)

6.Calculate the mean for subject and activity

data_melt <- melt(All_dataset,id.vars= c("subject","Activity"))
data_melt_mean <- dcast(data_melt, subject+Activity ~ variable, fun.aggregate=mean)
write.table(data_melt_mean, "C:/Yohannes/Coursera/Getting and cleaning data/Course project/tidy_data.txt", row.names = FALSE, quote = FALSE)


