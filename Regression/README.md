#### Data Preprocessing 

Original file = HousingMaster.csv

There were 259 missing values in the LotFrontage column. I replaced the missing values by averaging LotFrontage from the missing values neighborhood. My logic was that houses in the same neighborhoods would have similar LotFrontage.

37 columns were removed from the data set. The columns were removed for one of the following reasons: 
-	Believed to not be a significant factor in house sell price. 
-	Missing values.
-	Data could be interpreted in another column. E.G. Ground Area is encompassed in Total Sq. Ft. 

Preprocessed file = preprocessed_housing.csv

#### Simple Regression

File = SimpleRegression.csv

Simple regression analysis was performed develop a model to predict house selling price by lot size. There were no missing values in the lot size column. 

R2 value = .03

The model performed poorly and lot size is a very poor predictor of sell value in this data set. 
