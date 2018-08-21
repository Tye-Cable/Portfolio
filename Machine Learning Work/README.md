## Finding Donors Model (Python)
  The finding donors model is my first project in the supervised learning classification section of the Udacity Data Science Nano Degree.   The purpose of   this project was to develop the best model to predict if a member has an income of greater than 50000.00. This would     indicate that a person is more likely to donate to the charity campaign.
  #### Data Preprocessing
  The data set that was provided did not contain any null or mis formatted info and did not require any preprocessing. 
  #### Model
  Three models of my choice were constructed which included a logistic regression, Naive Bayes, and AdaBoost Classifier model. These modes   were evaluated, and it was determined that the AdaBoost classifier was the best model based off F-score, accuracy, and runtime. The final   optimized model results were: Accuracy Score	0.863, F-score	0.7356.

## Simple Regression Model (Python)
  #### Purpose
  To show experience with logistic regression.  
  #### Data Preprocessing 
  There were 259 missing values in the LotFrontage column. I replaced the missing values by averaging LotFrontage from the missing values   neighborhood. My logic was that houses in the same neighborhoods would have similar LotFrontage. T 37 columns were removed from the data     set. The columns were removed for one of the following reasons: 
-	Believed to not be a significant factor in house sell price. 
-	Missing values.
-	Data could be interpreted in another column. E.G. Ground Area is encompassed in Total Sq. Ft. 
  #### Model
  Simple regression analysis was performed develop a model to predict house selling price by lot size. There were no missing values in the   lot size column. The R2 value = .03. The model performed poorly, and lot size is a very poor predictor of sell value in this data set. 

## Customer Churn Model (R)
  Data Set https://www.ibm.com/communities/analytics/watson-analytics-blog/guide-to-sample-datasets/
  #### About
  To exhibit knowledge on how to predict customer churn.  
  #### Data Preprocessing
  The dataset was examined, and no anomalies were found. The columns MonthlyCharges, TotalCharges, and tenure were normalized.
  #### Model
  The first model I used was a logistic regression model. The model performance indicated an accuracy of 80%. This is good however, I am currently working on running additional models and optimizing the logistic regression model.   
  
