#Name: Jeet Patel
#Project: Regression Analysis on Diabetes
#Summary: Determine what variables influence diabetes progression indicator 
#We plan to conduct hypothesis test utilizing an ANOVA table
#In addition, we look at correlation and multicollinearity 
#And we validate the criteria of linearity, independence, normality, and equal variance





#Part 1: Data Introduction and Description 
diabetes <- read.delim("/Users/jeetpatel/Desktop/Diabetes.csv", header = TRUE)
diabetes[] <- lapply(diabetes, function(x) if(is.character(x)) as.numeric(x) else x)

#Five Number Summary
summary(diabetes)

#Mean
sapply(diabetes, mean, na.rm=TRUE)

#Variance
sapply(diabetes, sd, na.rm=TRUE)

#Histogram or Boxplot
#Age
hist(diabetes$AGE, main="Histogram of Age", xlab="Age", col="blue", border="black")
boxplot(diabetes$AGE, main="Boxplot of Age", ylab="Age", col="red")

#Sex
hist(diabetes$SEX, main="Histogram of Sex", xlab="Sex", col="blue", border="black")
boxplot(diabetes$SEX, main="Boxplot of Sex", ylab="Sex", col="red")

#BMI
hist(diabetes$BMI, main="Histogram of BMI", xlab="BMI", col="blue", border="black")
boxplot(diabetes$BMI, main="Boxplot of BMI", ylab="BMI", col="red")

#BP
hist(diabetes$BP, main="Histogram of BP", xlab="BP", col="blue", border="black")
boxplot(diabetes$BP, main="Boxplot of BP", ylab="BP", col="red")

#S1
hist(diabetes$S1, main="Histogram ofS1", xlab="S1", col="blue", border="black")
boxplot(diabetes$S1, main="Boxplot of S1", ylab="S1", col="red")

#S2
hist(diabetes$S2, main="Histogram of S2", xlab="S2", col="blue", border="black")
boxplot(diabetes$S2, main="Boxplot of S2", ylab="S2", col="red")

#S3
hist(diabetes$S3, main="Histogram of S3", xlab="S3", col="blue", border="black")
boxplot(diabetes$S3, main="Boxplot of S3", ylab="S3", col="red")

#S4
hist(diabetes$S4, main="Histogram of S4", xlab="S4", col="blue", border="black")
boxplot(diabetes$S4, main="Boxplot of S4", ylab="S4", col="red")

#S5
hist(diabetes$S5, main="Histogram of S5", xlab="S5", col="blue", border="black")
boxplot(diabetes$S5, main="Boxplot of S5", ylab="S5", col="red")

#S6
hist(diabetes$S6, main="Histogram of S6", xlab="S6", col="blue", border="black")
boxplot(diabetes$S6, main="Boxplot of S6", ylab="S6", col="red")





#Part 2: Multiple Linear Regression Analysis
full_model <- lm(Target ~ AGE + SEX + BMI + BP + S1 + S2 + S3 + S4 + S5 + S6, data=diabetes) 
summary(full_model)

#ANOVA
anova(full_model)

# Correlation Matrix
cor_matrix <- cor(diabetes[, sapply(diabetes, is.numeric)])
print(cor_matrix)

# Variance Inflation Factor (VIF)
install.packages("car")
library(car)

vif_values <- vif(full_model)
print(vif_values)

#Take out S1
full_model <- lm(Target ~ AGE + SEX + BMI + BP + + S2 + S3 + S4 + S5 + S6, data=diabetes) 

vif_values <- vif(full_model)
print(vif_values)

#L.I.N.E.
#Linearity
plot(x = diabetes$AGE, y =full_model$residuals, xlab = "Age", ylab = "Residuals")
plot(x = diabetes$SEX, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$BMI, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$BP, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$S2, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$S3, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$S4, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$S5, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$S6, y =full_model$residuals, xlab = "x", ylab = "Residuals")

#Independence
install.packages("lmtest")
library(lmtest)
dwtest(full_model, alternative = "two.sided")

#Normality
qqnorm(full_model$residuals)
shapiro_test <- shapiro.test(residuals(full_model))
print(shapiro_test)

#Equal Variance
plot(x = full_model$fitted.values, y = full_model$residuals, xlab = "Predicted Values (yhat)", ylab = "Residuals")





#Part 3: Variable Selection
#Original: Removed S1
model_1 <- lm(Target ~ AGE + BMI + BP + S2 + S3 + S4 + S5 + S6, data = diabetes)
summary(model_1) 

#Remove S4
model_2 <- lm(Target ~ AGE + BMI + BP + S2 + S3 + S5 + S6, data = diabetes)
summary(model_2)

#Remove Age
model_3 <- lm(Target ~ BMI + BP + S2 + S3 + S5 + S6, data = diabetes)
summary(model_3)

#Remove S6
model_4 <- lm(Target ~ BMI + BP + S2 + S3 + S5, data = diabetes)
summary(model_4)

#ANOVA Comparison
anova(model_1, model_4)  

#L.I.N.E.
#Linearity 
plot(x = diabetes$BMI, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$BP, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$S2, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$S3, y =full_model$residuals, xlab = "x", ylab = "Residuals")
plot(x = diabetes$S5, y =full_model$residuals, xlab = "x", ylab = "Residuals")

#Independence
dwtest(model_4, alternative = "two.sided")

#Normality
qqnorm(model_4$residuals)
shapiro_test <- shapiro.test(residuals(model_4))
print(shapiro_test)

#Equal Variance
plot(x = model_4$fitted.values, y = model_4$residuals, xlab = "Predicted Values (yhat)", ylab = "Residuals")

