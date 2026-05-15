# --- Code Block 1 ---
# Install Required Packages
install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")
# Load Libraries
library(readr)
library(dplyr)
library(ggplot2)
# Import Dataset
data <- read_csv("customer_data.csv")

# --- Code Block 2 ---
# Check Structure
str(data)
# Check Missing Values
colSums(is.na(data))
# Remove Missing Values
data <- na.omit(data)
# Remove Duplicate Records
data <- distinct(data)
# Convert Variables if Required
data$Education <- as.factor(data$Education)
# Summary Statistics
summary(data)

# --- Code Block 3 ---
ggplot(data,
       aes(x = Income)) +
  geom_histogram(fill = "skyblue",
                 bins = 20) +
  ggtitle("Income Distribution")

# --- Code Block 4 ---
ggplot(data,
       aes(x = Education,
           y = MntWines)) +
  geom_boxplot(fill = "orange") +
  ggtitle("Wine Spending by Education")

# --- Code Block 5 ---
ggplot(data,
       aes(x = Age)) +
  geom_histogram(fill = "lightgreen",
                 bins = 15) +
  ggtitle("Customer Age Distribution")

# --- Code Block 6 ---
# Correlation between Income and Spending
cor(data$Income,
    data$MntWines,
    method = "pearson")

# --- Code Block 7 ---
cor.test(data$Income,
         data$MntWines)

# --- Code Block 8 ---
hist(data$Income,
     probability = TRUE,
     col = "lightblue")
x <- seq(min(data$Income),
         max(data$Income),
         length = 100)
y <- dnorm(x,
         mean = mean(data$Income),
         sd = sd(data$Income))
lines(x, y,
      col = "red",
      lwd = 2)

# --- Code Block 9 ---
# Test Average Income = 50000
t.test(data$Income,
       mu = 50000)

# --- Code Block 10 ---
# Education Frequency
education_table <- table(data$Education)
chisq.test(education_table)

# --- Code Block 11 ---
ggplot(data,
       aes(x = Income,
           y = MntWines)) +
  geom_point(color = "blue") +
  ggtitle("Income vs Wine Spending")

# --- Code Block 12 ---
ggplot(data,
       aes(x = Education)) +
  geom_bar(fill = "purple") +
  ggtitle("Customer Education Categories")

# --- Code Block 13 ---
ggplot(data,
       aes(x = Marital_Status,
           y = Income)) +
  geom_boxplot(fill = "gold") +
  ggtitle("Income by Marital Status")

