#Dataset: Diabetes

#1st Step: Data Aquisition

diabet<-read.csv("D:/Data Science/Machine Learning/Shakti/Dataset/diabetes.csv")
View(diabet)


#2nd Step: Divide Dataset

library(caTools)
set.seed(2)
split<-sample.split(diabet$Outcome,SplitRatio = 0.7)
split
training_data<-subset(diabet,split=TRUE)
testing_data<-subset(diabet,split=FALSE)


#3rd Step: Implement Model

library(randomForest)

##tuneRF function is used to pick best mtry number, i.e. number of division

bestmtry<-tuneRF(training_data,training_data$Outcome,stepFactor = 1.2,improve = 0.1,trace = T,plot = T)

diabet_forest<-randomForest(Outcome~.,data=training_data)
diabet_forest


#4th Step: Visualize Model

##to get importance table
importance(diabet_forest)

##GraphPlot of variable
varImpPlot(diabet_forest)


#5th Step: Model Validation

pred1_diabet<-predict(diabet_forest,newdata = testing_data,type="class")
pred1_diabet

##ConfusionMatrix

library(caret)
#confusionMatrix(table(pred1_diabet,testing_data$Outcome))










