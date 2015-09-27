
## 1. Merging of the train and test data sets

X_train<- read.table("UCI HAR Dataset/train/X_train.txt")
X_test<-  read.table("UCI HAR Dataset/test/X_test.txt")
X<-rbind(X_train,X_test)

y_train<- read.table("UCI HAR Dataset/train/y_train.txt")
y_test<- read.table("UCI HAR Dataset/test/y_test.txt")
y<- rbind(y_train,y_test)
colnames(y)<- "Activity"

subject_train<- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test<- read.table("UCI HAR Dataset/test/subject_test.txt")
subject<- rbind(subject_train,subject_test)
colnames(subject)<- "SubjectId"

#-------------------------------------------------------------------------------------------------
## 2. Extraxting measurements on mean and standard deviation for each measurement

features<- read.table("UCI HAR Dataset/features.txt")
features_select<- features[grep("(mean|std)[^Freq]", features[,2]), ]
X<- X[,features_select[,1]]
colnames(X)<- features_select[,2]
allData<- cbind(y,subject,X)

#-------------------------------------------------------------------------------------------------
## 3. Naming the activities

activity<-read.table("UCI HAR Dataset/activity_labels.txt")
allData[,1]<-activity[allData[,1],2]

#-------------------------------------------------------------------------------------------------
## 4.Labeling Descriptive variable name
  
  colNames<-colnames(allData)
  for (i in 1:length(colNames)) 
  {
    colNames[i] = gsub("\\()","",colNames[i])
    colNames[i] = gsub("-std$","StdDev",colNames[i])
    colNames[i] = gsub("-mean","Mean",colNames[i])
    colNames[i] = gsub("^(t)","time",colNames[i])
    colNames[i] = gsub("^(f)","freq",colNames[i])
    colNames[i] = gsub("-","",colNames[i])
  }
colnames(allData)<-colNames

#--------------------------------------------------------------------------------------------------
## 5. Creating a tidy data set with the average of each variable for each activity and each subject

tidy_data<- aggregate(.~Activity+SubjectId, FUN = mean, allData)
write.table(tidy_data,"tidy data.txt")