This project is to get the raw data from a zipped file and group them into the cooresponding categories.

Then to clean the datasets so that it can be further explored.

In this chunk, first I copy the website link, download and unzip the file
```{r echo=FALSE}
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url, destfile="rawdata.zip",method="curl")
unzip("rawdata.zip")
```

Then, I read the the training and testing data sets as well as activity labels from training and testing files respectively.
```{r}
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
```


Here I read all the measured variable names from features.txt and assign them to the column names of training and testing data sets.
```{r echo=FALSE}
variable_names <- read.table("UCI HAR Dataset/features.txt")
names(test_X) <- variable_names[,2]
names(train_X) <- variable_names[,2]
```

I conbine the columns of training/testing datasets with their corresponding subject ID and activity.
```{r echo=FALSE}
df_train <- data.frame(train_X,train_y,train_subject)
df_test <- data.frame(test_X,test_y,test_subject)
```
And then I combine all rows of the data sets from training and testing together.
```{r echo=FALSE}
df <- rbind(df_train,df_test)
names(df)[length+1] <- "activity"
names(df)[length+2] <- "subject_ID"
```
In this chunk, I select only the variables which are on the means and standard deviations of the measures.
```{r echo=FALSE}
variables_desired1 <- "mean"
pos1 <- grep(variables_desired1,variable_names[,2])
variables_desired2 <- "std"
pos2 <- grep(variables_desired2,variable_names[,2])
length <-length(variable_names[,2])
df <- df[,c(pos1,pos2,length+1,length+2)]
```

Here I assign the activity descriptive names according to their numbers
```{r echo=FALSE}
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
for( i in 1:length(activity_labels[,1]))
        df$activity[which(df$activity == i)] <- as.character(activity_labels[,2][i])
```

In this chunk, I calculate the mean of each variable with respect to each activity and each subject by looping through each subject and each variable, then using tapply to calculate mean according to activity. In each loop step, I write the result to the txt file. 
```{r echo=FALSE}
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
```

