#Boruta analysis to confirm the importance of the features used to predict the diversity index


library(tidyverse)
library(dplyr)
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

###############################################################################################################################################################################
#Trait datasets with out traitement on the features
trait = read.csv("C:/Users/marie/Documents/DSTI_Cours/Python_Class/Python_Lab/Exam_project/Project 2/CoralReefFishSpeciesAssessment/Data/traits_combined_2023.csv", sep = ';')

#Drop the features not usefull for the model
trait2 <- trait %>%
  select(MaxLengthTL, Body_size_max, MaxLengthTL, MaxLengthSL, MaxJuvLength, AspectRatio, swim_type, swim_mode, 
         body_shape, Total.length.Body.depth.ratio, presence_defense, ComDepthMax, DepthMax, Depth_min, Depth_range, Size_group, Position.in.water.column.,Level_water,
         Specialist, Fished, Spawning, Brackish, Multihabitat, Rafter, Relief, Coral, Home_range)


#Replace the NaN values by 0
test <- trait2

trait2$Coral <- ifelse(trait2$Coral == 'N/A', 0, trait2$Coral)
trait2$Relief <- ifelse(trait2$Relief == 'N/A', 0, trait2$Relief)
trait2$Body_size_max <- ifelse(trait2$Body_size_max == 'N/A', 0, trait2$Body_size_max)
trait2$MaxJuvLength <- ifelse(trait2$MaxJuvLength == 'N/A', 0, trait2$MaxJuvLength)



trait2 <- transform(trait2, 
                    Coral=as.numeric(Coral),
                    Relief=as.numeric(Relief),
                    Body_size_max=as.numeric(Body_size_max),
                    MaxJuvLength=as.numeric(MaxJuvLength))

#Pass the categorical cols as factor
trait_borruta <- transform(trait2,
                           swim_type=as.factor(swim_type),
                           swim_mode=as.factor(swim_mode),
                           body_shape=as.factor(body_shape),
                           presence_defense=as.factor(presence_defense),
                           Size_group=as.factor(Size_group),
                           Position.in.water.column.=as.factor(Position.in.water.column.),
                           Level_water=as.factor(Level_water),
                           Fished=as.factor(Fished),
                           Spawning=as.factor(Spawning), 
                           Brackish=as.factor(Brackish), 
                           Multihabitat=as.factor(Multihabitat),
                           Specialist=as.factor(Specialist),
                           Rafter=as.factor(Rafter),
                           Home_range=as.factor(Home_range))


#Boruta analysis, the Coral is in this dataset the indice of fish diversity in function of the coral cover. By the authors its consider as the targets in this dataset with Relief
borruta_output3 <- Boruta(Coral~., data= trait_borruta, doTrace=2)

print(borruta_output3)
plot(borruta_output3, xlab = "", xaxt = "n")
k <- lapply(1:ncol(borruta_output3$ImpHistory), function(i)
  borruta_output3$ImpHistory[is.finite(borruta_output3$ImpHistory[,i]),i])
names(k) <- colnames(borruta_output3$ImpHistory)
Labels <- sort(sapply(k,median))
axis(side = 1, las=2, labels = names(Labels),
     at = 1:ncol(borruta_output3$ImpHistory), cex.axis=0.7)

#Boruta analysis, the Relief is in this dataset the indice of fish diversity in function of the coral cover. By the authors its consider as the targets in this dataset with Coral
borruta_output4 <- Boruta(Relief~., data= trait_borruta, doTrace=2)

print(borruta_output4)
plot(borruta_output4, xlab = "", xaxt = "n")
k <- lapply(1:ncol(borruta_output4$ImpHistory), function(i)
  borruta_output3$ImpHistory[is.finite(borruta_output4$ImpHistory[,i]),i])
names(k) <- colnames(borruta_output4$ImpHistory)
Labels <- sort(sapply(k,median))
axis(side = 1, las=2, labels = names(Labels),
     at = 1:ncol(borruta_output4$ImpHistory), cex.axis=0.7)









