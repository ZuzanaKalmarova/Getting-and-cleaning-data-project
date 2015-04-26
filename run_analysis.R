#The code requires library dplyr
require(dplyr)
#below lines are reading in the test and train data
xtest<-read.table("X_test.txt")
ytest<-read.table("y_test.txt")
subjecttest<-read.table("subject_test.txt")
xtrain<-read.table("X_train.txt")
ytrain<-read.table("y_train.txt")
subjecttrain<-read.table("subject_train.txt")
#below lines create a test dataset and train dataset from the files read
#in above lines, then combine the 2 dataset into one
test<-cbind(subjecttest,ytest,xtest)
train<-cbind(subjecttrain,ytrain,xtrain)
dataset<-rbind(test,train)
#below lines add names to columns, Subject and Activity to first 2 variables,
#the names for the rest of the variables are taken from features file
features<-read.table("features.txt",stringsAsFactors=FALSE)
featurename<-features[,2]
colnames<-c("Subject","Activity",featurename)
colnames(dataset)<-colnames
#below lines create dataset with variables needed for the assignment. I keep
#the first 2 columns(which are Subject and Activity) and all columns containing
#mean and std in the column names. Then I remove meanFreq columns, which are not
#real mean
subdat<-dataset[,c(1,2,grep("mean|std",colnames))]
subdata<-select(subdat,-contains("meanFreq"))
#below lines give descriptive names to activities, replacing the numeric values
#with a description of the values
subdata$Activity<-gsub(1,"walking",subdata$Activity)
subdata$Activity<-gsub(2,"walking_upstares",subdata$Activity)
subdata$Activity<-gsub(3,"walking_downstares",subdata$Activity)
subdata$Activity<-gsub(4,"sitting",subdata$Activity)
subdata$Activity<-gsub(5,"standing",subdata$Activity)
subdata$Activity<-gsub(6,"laying",subdata$Activity)
#below lines are making the column names descriptive, removing all special signs,
#that column names should not contain and explaining the abbreviations
colnames(subdata)<-gsub("-","",colnames(subdata))
colnames(subdata)<-gsub("\\()","",colnames(subdata))
colnames(subdata)<-gsub("^t","time",colnames(subdata))
colnames(subdata)<-gsub("^f","frequency",colnames(subdata))
colnames(subdata)<-gsub("Acc","Accelerometer",colnames(subdata))
colnames(subdata)<-gsub("Gyro","Gyroscope",colnames(subdata))
colnames(subdata)<-gsub("Mag","Magnitude",colnames(subdata))
colnames(subdata)<-gsub("std","standarddeviation",colnames(subdata))
#below line creates new dataset, calculating the average for each variable
#for each subject and activity
newdataset<-subdata %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
#below line shows a nice clearly organized view of the new dataset in RStudio
View(newdataset)