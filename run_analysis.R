
##1. Merging of the train and test sets

X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
X<-rbind(X_train,X_test)