# Diabetes Progression Analysis

## Project Overview

This project investigates the factors influencing diabetes progression using a dataset of 442 patients and 10 predictor variables. The primary goal is to identify which predictor variables significantly influence the response variable: diabetes progression level. This analysis utilizes multiple statistical measurements, including mean, variance, correlation, multicollinearity, and the coefficient of determination, reinforced with graphical visualizations like histograms and boxplots. The project also rigorously checks model assumptions (linearity, independence, normality, and equal variance of residuals) and applies a backward elimination strategy to develop the most parsimonious yet effective linear regression model.

## Dataset

The analysis is based on a dataset containing observations from 442 patients. For each patient, the following variables were recorded:

**Predictor Variables (Independent Variables):**
* **Age:** Patient's age
* **Sex:** Patient's sex (Male=1, Female=2)
* **BMI:** Body Mass Index
* **BP:** Average Blood Pressure
* **S1:** Serum Total Cholesterol Level
* **S2:** Low-Density Lipoproteins (LDL)
* **S3:** High-Density Lipoproteins (HDL)
* **S4:** Total Cholesterol/HDL Ratio
* **S5:** Serum Triglyceride Level
* **S6:** Blood Sugar Level

**Response Variable (Dependent Variable):**
* **Target (Diabetes Progression Indicator):** A quantitative measure of diabetes progression one year after baseline.

## Methodology

The project follows a robust statistical methodology:

1.  **Data Introduction and Description:** Initial exploration of the dataset, including descriptive statistics (mean, median, min, max, quartiles) and visualizations (histograms, boxplots) to understand the distribution of each variable.
2.  **Multiple Linear Regression Analysis:**
    * **Preliminary Hypothesis Testing (L.I.N.E. Conditions):**
        * **Linearity:** Assessed by plotting predictor variables against residuals.
        * **Independence:** Checked using the Durbin-Watson test.
        * **Normality:** Evaluated with the Shapiro-Wilk test on residuals.
        * **Equal Variance (Homoscedasticity):** Inspected through a plot of fitted values vs. residuals.
    * **Multicollinearity Assessment:** Identification and mitigation of multicollinearity among predictor variables using correlation matrices and Variance Inflation Factor (VIF) values. Variables with high VIF (e.g., S1 due to its high correlation with S2) were removed to ensure model validity.
    * **Primary Hypothesis Test:** An ANOVA table was used to determine the overall significance of the model and the individual significance of each predictor variable.
3.  **Variable Selection (Backward Elimination):**
    * Starting with a model including all relevant predictors (after addressing multicollinearity), statistically insignificant variables (p-value > 0.10) were systematically removed one at a time.
    * The process was repeated, refitting the model at each step, until only statistically significant variables remained.
4.  **Final Model Validation:**
    * Re-checking of the L.I.N.E. conditions for the final, reduced model.
    * Comparison of the original and final models using an ANOVA table to confirm that the removal of insignificant variables did not reduce the model's explanatory power.
5.  **Conclusion and Interpretation:** Interpretation of the final model's coefficient of determination ($R^2$) to understand the proportion of variance explained in diabetes progression, and a discussion of the practical implications of the significant predictor variables.

## Key Findings

* Initial analysis revealed high variance in S1 (Serum Total Cholesterol Level) and S2 (Low-Density Lipoproteins), suggesting their potential influence on the target variable. The target variable itself showed the highest variance, indicating multiple influential factors.
* The preliminary hypothesis tests confirmed that the conditions for multiple linear regression (Linearity, Independence, Normality, and Equal Variance) were met for the initial model.
* Multicollinearity was identified with high VIF values for S1, S2, S3, and S5. S1 was removed due to its high correlation with S2 (r = 0.897) to ensure independence.
* The initial ANOVA analysis indicated that Age, BMI, BP, S3, and S5 statistically contribute to the variance of the diabetes progression indicator.
* Through backward elimination, the final model retained **BMI, BP, S2, S3, and S5** as statistically significant predictors of diabetes progression.
* The final model continues to satisfy the L.I.N.E. conditions.
* An ANOVA comparison between the original and final models showed no significant difference ($p=0.848$), confirming that removing Age, S4, and S6 did not reduce the model's explanatory power.
* The final model has a **Multiple R-squared of approximately 0.4964**, indicating that **49.64% of the variation in diabetes progression can be explained by BMI, BP, S2, S3, and S5**.
* The high F-statistic (85.94) and very low p-value ($< 2.2e-16$) for the final model indicate that the model as a whole is statistically significant.

## Files in this Repository

* `Diabetes Project.pdf`: The complete project report detailing the methodology, analysis, results, and conclusions.
* `diabetes_analysis.R`: (Recommend adding this if you used R) The R script containing all the code used for data loading, descriptive statistics, regression analysis, assumption checks, variable selection, and visualization.
* `data/diabetes.csv`: (Recommend adding this if you can share the data) The dataset used for this analysis.

## Tools and Technologies

* **R** (or specify other statistical software like Python with scikit-learn, statsmodels, etc.)
* **RStudio** (or other IDE)

## How to Run the Analysis (if code is included)

1.  Clone this repository:
    ```bash
    git clone [https://github.com/YourUsername/diabetes-progression-analysis.git](https://github.com/YourUsername/diabetes-progression-analysis.git)
    ```
2.  Navigate to the project directory:
    ```bash
    cd diabetes-progression-analysis
    ```
3.  (If using R) Open the `diabetes_analysis.R` file in RStudio.
4.  Ensure you have the necessary R packages installed (e.g., `lmtest` for Durbin-Watson, `car` for VIF). You can install them using `install.packages("package_name")`.
5.  Run the R script to reproduce the analysis.

## Contact

Jeet Patel
[Your LinkedIn Profile URL (Optional)]
[Your Portfolio Website URL (Optional)]
