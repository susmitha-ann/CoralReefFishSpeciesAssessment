Here a summary of my observation on the species table. This table is the main table used in the article give for the project. 

I had observed that:
- some features has "volontary" missing value NA. These features are related to the site (Keys_divisions, FKNMS, DryTortugas, BNP, CoralECA). Also a feature which divided the data into 3 regions fully completed. Maybe we can drop the features listed here and keep only the region for the ML table. 
- the features Total_gravity and Total_gravity_intercept are close/similar and the authors say the Total_gravity_intercept isn't used for their ML model. Maybe we can do the same. Perhaps, the Total_gravity shows 103 missing values we have to image how to replace them. The repartition of the data in this feature seems sparse. Maybe we can skip it for the model. 

The result of the EDA point that:
**Maybe a model for regression could be the better adapt to predict the diversity_index**.The data in function of the region are imbalanced and the diversity index seems to be a regressive variable where we had a float value for it. We can't do a correlation matrix for the diversity index and the region but the histogram showing the diversity index in function of the region shows that the diversity index seems to be similar between the different region. Perhaps, the other variable vary a lot between the region.  **Maybe, to split the data in train and test data set the region repartition need to be kept**.

The differents correlation matrix shows that:
- the feature related to the human activities like population 20km, tourist_fishing shows a weak relation between the diversity index and them. In the litterature it's describe that human living doesn't realy impact the fish diversity. *Maybe this feature can be put on side, need to be discuss*. 
-the diversity index seems to be influence by the coral, reef, marina slips, the leasure activity of fishing (correlation matrix cell 29). Surprisingly the features coral and reef shows negative relation with the diversity index. **These features are essential to predict the diversity index**. 
- the water and type of nursery seems also be related to the diversity index (cell 33). **These features need to be kept in the model** 
- the number of features about water depth maybe can be decrease. In this table it exist 3 differents features about it: the Depth, Depth_Sbrocco and Deepwater. The Deepwater takes in account the relief inside the sea on the contrary of the 2 other where they are indirect (for depth mean af measure from different experimentator and depth_sbrocco remote measure). *I think the Deepwater feature is the more accurate to keep, need to be discuss*

- the feature about the coral and reef complexity are duplicate in percentage. Maybe it's better to keep only one in pair. I'm in favor to keep the "raw" measure coral_cover and reef_colpexity *need to be discuss*. Perhaps, this feature shows high number of missing value. Maybe we can fill them by with the mean of the respected feature fro each region because it seems that the repartion of coral and reef are different in function of the region (cell 18). *Need to be discuss*

-the nursery_seagrass and _mangroves are possitively linked with the coral_cover but not really with the reef_complexity. The reef_complexity is in negative relation with the connectivity. **This suggest that, all of these features are in relation and has a role in determining the diversity index.**

- when we plot the data together in function of the region we can observed weird pattern for the data repartition. Perhaps, in those scatter-plot the invert relation between coral, reef and the diversity index is highligthing. 

The observation above need to be search on the literature to be stronguer in arguments.

After this analyse we clearly face to a regression problem because the diversity index is continuous and not discrete. 
The models we can used are:
- linear regression because the different features seems to don't be highly related between each other (the coefficient correlation never exceed 0.2) allowing to using this model for a first look. Maybe we can set the parameter non-negative at TRUE because the diversity index is exclusively positive.The Ridge model family of linear regression like RidgeCV could be use. This model impose a penalty on the size of the coefficients. This is done by the alpha parameter which control the shrinkage and thus the coefficient become more robust to collinearity. In this model we will have to test the differents solver and which one suit better with our data. This model had in advantage to do a cross validation increasing the accuracy of the model.
- A model like SVM could be useful to solve our problem. This function like a linera regression but in addition it put segregate the value againts an hyperplane. It offer different type of kernel/method allowing to reduce the data overfitting. 
In that paper Khan et al, PlosOne, 2023 (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10513304/) the authors used 6 differents regression model (more complicated like XGBoost) and they describe how they choose their parameter for each. 

