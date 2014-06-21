 ## Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 ## download.file(Url, destfile="rawdata.zip",method="curl")
 ## unzip("rawdata.zip")

##
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

variable_names <- read.table("UCI HAR Dataset/features.txt")
names(test_X) <- variable_names[,2]
names(train_X) <- variable_names[,2]
df_train <- data.frame(train_X,train_y,train_subject)
df_test <- data.frame(test_X,test_y,test_subject)
df <- rbind(df_train,df_test)
names(df)[length+1] <- "activity"
names(df)[length+2] <- "subject_ID"

variables_desired1 <- "mean"
pos1 <- grep(variables_desired1,variable_names[,2])
variables_desired2 <- "std"
pos2 <- grep(variables_desired2,variable_names[,2])
length <-length(variable_names[,2])
df <- df[,c(pos1,pos2,length+1,length+2)]


activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
#levels(df$activity) <- activity_labels[,2]
##df$activity <- factor(df$activity, levels(df$activity))
for( i in 1:length(activity_labels[,1]))
        df$activity[which(df$activity == i)] <- as.character(activity_labels[,2][i])

for( i in unique(df$subject))
{
        
        temp <- df[df$subject==i,]
        write.table(c("subject ID",i),file="tidy.txt",append=TRUE)
        
        for (j in 1:(length(df[1,])-2))      
               { 
                t <- tapply(temp[,j],temp$activity,mean)
                write.table(names(df)[j],file="tidy.txt",append=TRUE)
                 write.table(t,file="tidy.txt",append=TRUE)
                }
}       


