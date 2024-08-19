#Boruta analysis to confirm the importance of the features used to predict the diversity index


library(tidyverse)
library(Boruta)

#feature engeneering by sushmita + select at the end of the report from all
data = read.csv("C:/Users/marie/Documents/DSTI_Cours/Python_Class/Python_Lab/Exam_project/Project 2/CoralReefFishSpeciesAssessment/df_ML.csv")

#2nd dataset
data = read.csv("C:/Users/marie/Documents/DSTI_Cours/Python_Class/Python_Lab/Exam_project/Project 2/CoralReefFishSpeciesAssessment/species_ML_2.csv")

#adding the cat column
data$Diversity_cat = ifelse(
  data$Diversity_index < 0.8, 'low',
  ifelse((data$Diversity_index >= 0.8 & data$Diversity_index < 0.9), 'mean',
         ifelse(data$Diversity_index >= 0.9, 'high', '0'))
)


data_borruta <- transform(data,
                          Region=as.factor(Region),
                          habitat=as.factor(Diversity_cat))

borruta_output <- Boruta(Diversity_cat~., data= data_borruta, doTrace=2)

borruta_output2 <- Boruta(Diversity_index~., data= data, doTrace=2)

print(borruta_output)
plot(borruta_output, xlab = "", xaxt = "n")
k <- lapply(1:ncol(borruta_output$ImpHistory), function(i)
  borruta_output$ImpHistory[is.finite(borruta_output$ImpHistory[,i]),i])
names(k) <- colnames(borruta_output$ImpHistory)
Labels <- sort(sapply(k,median))
axis(side = 1, las=2, labels = names(Labels),
     at = 1:ncol(borruta_output$ImpHistory), cex.axis=0.7)


print(borruta_output2)
plot(borruta_output2, xlab = "", xaxt = "n")
k <- lapply(1:ncol(borruta_output2$ImpHistory), function(i)
  borruta_output2$ImpHistory[is.finite(borruta_output2$ImpHistory[,i]),i])
names(k) <- colnames(borruta_output2$ImpHistory)
Labels <- sort(sapply(k,median))
axis(side = 1, las=2, labels = names(Labels),
     at = 1:ncol(borruta_output2$ImpHistory), cex.axis=0.7)



