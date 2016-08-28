##disclaimer, this is my second submission of the same work.
##This is the script for the dataset that contains the averages of each variable for 
##each activity and subject
#Each section is commented, and the ones with numbers indicate which part of the instruction 
##is being adressed
##working directory is it not set
##load uncommon library
library(reshape2)

##download and unzip the raw data
if (!file.exists("UCI HAR Dataset")){  ##Check if file has been unziped
  if (!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) { ##chech if zip has been downloaded
    fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    tem<-tempfile()
    download.file(fileURL, tem)
    unzip(tem)
  } else unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}


#1.- load the text set files on R separately for a better control

##Load Test Data related Info
TestData<-read.table("./UCI HAR Dataset/test/x_test.txt")
TestActivity<-read.table("./UCI HAR Dataset/test/y_test.txt")
TestSujeto<-read.table("./UCI HAR Dataset/test/subject_test.txt")

##Load Train related Info
TrainData<-read.table("./UCI HAR Dataset/train/x_train.txt")
TrainActivity<-read.table("./UCI HAR Dataset/train/y_train.txt")
TrainSujeto<-read.table("./UCI HAR Dataset/train/subject_train.txt")

##Load descriptive info
Labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

FeaturesA<-read.table("./UCI HAR Dataset/features.txt")
Features<-read.table("./UCI HAR Dataset/features.txt")
#Features[,2]<-tolower(Features[,2])  this may be included, but for better readability I kept the uppercases
Features[,2] <- gsub("^\\s+|\\s+$", "", Features[,2])
Features[,2] <- gsub("-", ".", Features[,2])
Features[,2]<-gsub(pattern="\\(|\\)|,", x=Features[,2], replacement="")

##rename the data with the lables
names(TestData)<-Features[,2]
names(TrainData)<-Features[,2]

#3.- #Uses descriptive activity names to name the activities in the data set
TestData["Actn"]<-TestActivity
TrainData["Actn"]<-TrainActivity
TestData$Acts <- Labels$V2[match(TestData$Actn,Labels$V1)]
TrainData$Acts <- Labels$V2[match(TrainData$Actn,Labels$V1)]

##2.- Appropriately labels the data set with descriptive activity names. 
TestData["Suj"]<-TestSujeto
TrainData["Suj"]<-TrainSujeto

## 1.-Merges the training and the test sets to create one data set.
DT<-rbind(TestData,TrainData)

##4.-Extracts only the measurements on the mean and standard deviation for each measurement. 
DT2<-DT[c("Suj","Actn","Acts",names(DT)[grepl("std",names(DT),ignore.case=TRUE) | grepl("mean",names(DT),ignore.case=TRUE)])]

## 5.-Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
DS3<-melt(DT2,c("Suj","Acts","Actn"))
DS4<-aggregate(DS3[,5],DS3[,c(4,2,1)], FUN=mean)
DS5<-dcast(DS4,Suj + Acts ~ variable,value.var="x")

##saving file in existing directory as pipeline delimited
write.csv(DS5,file="./data1.csv")
