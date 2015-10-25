train.x <- read.table("train/X_train.txt")
test.x <- read.table("test/X_test.txt")
train.y <- read.table("train/y_train.txt")
test.y <- read.table("test/y_test.txt")
Subject_train <- read.table("train/subject_train.txt")
Subject_test <- read.table("test/subject_test.txt")
activity_lables <- read.table("activity_labels.txt")
features <- read.table("features.txt")

all.x <- rbind(train.x,test.x)

colnames(all.x) <- c(as.character(features[,2]))

Mean <- grep("mean()", colnames(all.x), fixed=TRUE)

SD <- grep("std()", colnames(all.x), fixed=TRUE)

MeanSD <- all.x[,c(Mean,SD)]


all.y <- rbind(train.y, test.y)

all.activity <- cbind(all.y, MeanSD)

colnames(all.activity)[1] <- "Activity"

activity_lables[,2] <- as.character(activity_lables[,2])

for(i in 1:length(all.activity[,1])){
  all.activity[i,1] <- activity_lables[all.activity[i,1], 2]
}


Subject_all<-rbind(Subject_train, Subject_test)

all<-cbind(Subject_all, all.activity)

colnames(all)[1] <- "Subject"

Tidy <- aggregate(all[,3] ~ Subject+Activity, data = all, FUN= "mean" )

for(i in 4:ncol(all)){
  Tidy[,i] <- aggregate( all[,i] ~ Subject+Activity, data = all, FUN= "mean" )[,3]
}

colnames(Tidy)[3:ncol(Tidy)] <- colnames(MeanSD)

write.table(Tidy, file = "FinalData.txt", row.name=FALSE)
