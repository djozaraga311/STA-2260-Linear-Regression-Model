# Movie Gross Profit Prediction Using Linear Regression

This project was done as part of a statistics course to practice linear regression by modeling, evaluating, 
and analyzing real world data. 
Using R, a single and multi predictor model were made to find what influences a movie's gross profit the most.

**Model 1: Single Predictor Model** 
- Used a group of interaction variables (views, likes, comments, and dislikes) to find a linear relationsihp with the gross profit
- Likes and comments appeared to be nonlinear when using a fitted model
- Found that they all have very weak predicting power with low r^2 values, with Views only being marginally better than the rest

**Model 2: Multi Predictor Model** 
- Found that a combination of all the variables used to find the single predictor model had low predicting power or were colinear
- Switched to Budgets and Ratings as predictors
- Best Combination: Budget + Rating, having a significantly higher prediction power in comparison to the single predictor model

#Files: 
analysis.R — R script used to create the models

report.pdf — written report of analysis and findings

movies.xlsx - Dataset used for this project



