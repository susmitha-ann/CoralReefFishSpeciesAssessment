#Boruta analysis to confirm the importance of the features used to predict the diversity index


library(tidyverse)
library(Boruta)

#feature engeneering by sushmita + select at the end of the report from all
data = read.csv("C:/Users/marie/Documents/DSTI_Cours/Python_Class/Python_Lab/Exam_project/Project 2/CoralReefFishSpeciesAssessment/df_ML.csv")

#original dataset with missing values
data = read.csv("C:/Users/marie/Documents/DSTI_Cours/Python_Class/Python_Lab/Exam_project/Project 2/CoralReefFishSpeciesAssessment/Data/species.csv")

#adding the cat column
data$Diversity_cat = ifelse(
  data$Diversity_index < 0.8, 'low',
  ifelse((data$Diversity_index >= 0.8 & data$Diversity_index < 0.9), 'mean',
         ifelse(data$Diversity_index >= 0.9, 'high', '0'))
)

data2 <- data %>%
  select(Depth, Region, Coral_cover, Reef_complexity, Coral_area_UFRTM_20km, Coral_area_UFRTM_200km,
         SST, NPP, Wave_exposure, Habitat_type_classLV0, Habitat_type_classLV2, Depth_Sbrocco, Deepwater, FSA,
         Marina_slips_10km, Marina_slips_25km, Marine_reserve, Population_20km, Population_50km, Pop_per_area_reef_20km,
         Recreational_fishermen_50km, Tourist_fishing, Artificial_reefs_1km, SG_permits_50km, SG_charter_permits_25km, Total_gravity, 
         Nursery_seagrass, Nursery_mangroves, connectivity, Comm_engagement, Comm_reliance, Commercial_pounds_landed, 
         Rec_reliance, Rec_engagement, impact, Diversity_index)

data_borruta2 <- transform(data2,
                          Region=as.factor(Region),
                          Habitat_type_classLV0= as.factor(Habitat_type_classLV0), 
                          Habitat_type_classLV2=as.factor(Habitat_type_classLV2),
                          Marine_reserve=as.factor(Marine_reserve))

data_borruta <- transform(data,
                          Region=as.factor(Region),
                          habitat=as.factor(Diversity_cat))

borruta_output <- Boruta(Diversity_cat~., data= data_borruta, doTrace=2)

borruta_output2 <- Boruta(Diversity_index~., data= data_borruta2, doTrace=2)

print(borruta_output)
plot(borruta_output, xlab = "", xaxt = "n")
k <- lapply(1:ncol(borruta_output$ImpHistory), function(i)
  borruta_output$ImpHistory[is.finite(borruta_output$ImpHistory[,i]),i])
names(k) <- colnames(borruta_output$ImpHistory)
Labels <- sort(sapply(k,median))
axis(side = 1, las=2, labels = names(Labels),
     at = 1:ncol(borruta_output$ImpHistory), cex.axis=0.7)

