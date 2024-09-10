### To summarize my approach:
#### First Trial:
I started with species_df and traits_combined_df. The first step was to create indices for both dataframes.I then added a species_family column to traits_combined_df and performed row augmentation to match the number of rows in species_df before proceeding with the merge.The resulting dataframe had some null values which i addressed using MICE.I applied SMOGN to counterbalance the skewed distribution of the diversity index and standardized the data before proceeding with regression models (Random Forest, XGBoost) and GridSearch. The R² score was 0.44, which isn't bad but it's not very accurate and this merge technique felt like a last resort.

#### Second Trial:
I was determined to incorporate traits_combined_df into the predictions but there was no clear way to merge it accurately with species_df, so i tried to find two features that were on the same scale and provided similar information to base the merge on. For that i considered using coral cover, which was used to compute the coral density index (coral column in traits), however, this approach was a fail as the correlation between the two features was very low and didn’t reflect reality.

#### Third Trial (Current):
Still convinced of the utility of traits_combined_df so this time,i merged specabund_df with the diversity index from species_df based on the sites column. I also merged it with a dataframe provided by my colleague Marie, which contains the Margalef Index, total fish count and total species count (also on sites),then i created a column combining all species per site, exploded the column into one species per row (after splitting and joining to match the species names with those in traits_combined_df) and finally merged it with traits_combined_df.

I obtained a large dataset with more than 13,000 rows. After dropping some columns,i used MICE for null values, MODE for categorical values, encoded the categorical values and applied standard scaling before making predictions. The Random Forest results were too good and that was a sign indicating overfitting.I tried then random sampling, which also produced good results with Random Forest and XGBoost (R² of 0.9 and 0.8, respectively), and checked if the sample was representative of the whole dataset. Further investigation might be necessary to address any discrepancies.

- About SMOGN: It was too time-consuming given the dataset's size, and i also didn't see the need to use GridSearch here.

-For the feature importances Plot : The plot from the plotly library is not loading on github ,so here is a screenshot of what it should output ![Screenshot-Feature-importances](https://github.com/user-attachments/assets/4ea83902-bc85-40ee-b0bd-f9149db9caf7)
