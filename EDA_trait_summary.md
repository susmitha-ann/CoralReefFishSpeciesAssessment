The trait table aim to predict if the fish diversity is link with the coral cover and/or the relief. 

This data set contain less missing value compared to the species set. Also, for the targets only 11 value are missing.

Most of the features are object and the numerical value shows differents scales. Many are binary and some are imbalanced (presence_defense, Nocturnal) other egally distributed (Specialist, and fished).

In looking at the family feature and the number of different species observed on the site in them we can see that:
  - in total 30 different family of fish are find in the study sites.
  - 4 families are predominant with more than 10 different fish's species (Labridae, serranidae, pomacentriade, haemuliade) the other shows a lower diversity with a number of fish between 6 to 1. 
  - In crossing the coral/relief cover with the fish's families we can see that, when the fish are present they are in the family whit the highest number of fish species. Most of the time the fish will be there in space with a coral cover below 10% and for the relief between 10 to 20%. This observation is correlated with what the authors describe in the result part of the article where they say the reef cover explain 79% of the fish diversity and the coral cover 21%.
  **Maybe these features can be useful to predict the diversity index**

  The correlation matrix point a strong link between:
  - relief and presence_defence (negative), coral, specialist and fished features (positives)
  - the coral is negatively correlated with the total.length.body.depth and the trophic.
  - the features representing the depth are strongly correlated in the same way suggested they are redundant. 
  - many of the feature are redondant. 

  The multihabitat feature is in character (Yes/NO) but can be easy to encode and keep. The multihabitat describe the hability of the fish to lives in different habitat meaning they could have an importante capacity to adapt at different environment. **Maybe it can be interesting to keep this feature for our model**
 
From this table I would like to keep the features:
family, species, multihabitat and the depth where the fish leaves. But how to link this feature with the main table ? In the species we has 4000 observation and only 120 in the trait table. I see no evident primary key/foreign key... Maybe the coral and relief in this dataset are the same as the PCT_coralcover and Max_hard_relief in the species table ? (not write in the article and the readme)