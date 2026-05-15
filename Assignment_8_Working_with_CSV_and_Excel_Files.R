# --- Code Block 1 ---
# Retail Sales Analysis
# Dataset: sales.xlsx (Sheet: sales)
library(readxl)
library(dplyr)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "sales")

a) Load the sales dataset and display the first 10 records.
# Display first 10 records
head(data, 10)
# Explanation:
# • head() function displays top records from dataset.
# • 10 specifies first 10 rows.

b) Calculate total revenue for each product.
# Create Revenue Column
data$Revenue <- data$Quantity * data$Price
# Total Revenue by Product
total_revenue <- data %>%
  group_by(Product) %>%
  summarise(Total_Revenue = sum(Revenue))
total_revenue
# Explanation:
# • Revenue = Quantity × Price
# • group_by(Product) groups product-wise data.
# • summarise() calculates total revenue.

c) Find the top 5 products with highest revenue.
# Top 5 Products by Revenue
top_products <- data %>%
  group_by(Product) %>%
  summarise(Total_Revenue = sum(Revenue)) %>%
  arrange(desc(Total_Revenue)) %>%
  head(5)
top_products
# Explanation:
# • group_by() and summarise() calculate total revenue for each product.
# • arrange(desc()) sorts products by revenue in descending order.
# • head(5) returns the top 5 products.

d) Filter sales where quantity sold is greater than 50.
# Filter Sales by Quantity
high_quantity_sales <- data %>%
  filter(Quantity > 50)
high_quantity_sales
# Explanation:
# • filter() selects sales records where quantity is greater than 50.

e) Find average product price by category.
# Average Product Price by Category
avg_price_by_category <- data %>%
  group_by(Category) %>%
  summarise(Average_Price = mean(Price))
avg_price_by_category
# Explanation:
# • group_by(Category) groups data by product category.
# • summarise() calculates the average price for each category.

# --- Code Block 2 ---
# Dataset: customers.xlsx
library(readxl)
library(dplyr)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "customers")

a) Load the customers dataset and display the first 10 records.
# Display first 10 records
head(data, 10)
# Explanation:
# • head() function displays the first rows of the dataset.
# • 10 specifies first 10 records.

b) Calculate average purchase amount.
# Average Purchase Amount
avg_purchase <- mean(data$PurchaseAmount)
avg_purchase
# Explanation:
# • mean() calculates average purchase amount of all customers.

c) Find customers above average purchase amount.
# Customers Above Average Purchase
above_avg <- data %>%
  filter(PurchaseAmount > avg_purchase)
above_avg
# Explanation:
# • filter() selects customers whose purchase amount is greater than average.

d) Count number of male and female customers.
# Gender Count
gender_count <- table(data$Gender)
gender_count
# Explanation:
# • table() counts frequency of each gender category.

e) Create age groups: Youth (<25), Adult (25–50), Senior (>50)
# Create Age Groups
data$AgeGroup <- ifelse(data$Age < 25,
                         "Youth",
                         ifelse(data$Age <= 50,
                                "Adult",
                                "Senior"))
# Display Dataset
head(data)
# Explanation:
# • Youth → Age below 25
# • Adult → Age between 25 and 50
# • Senior → Age above 50

f) Find top 10 highest spending customers.
# Top 10 Highest Spending Customers
top_customers <- data %>%
  arrange(desc(PurchaseAmount)) %>%
  head(10)
top_customers
# Explanation:
# • arrange(desc()) sorts customers by highest purchase amount.
# • head(10) returns top 10 spending customers.

# --- Code Block 3 ---
# Dataset: transactions.xlsx
library(readxl)
library(dplyr)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "transactions")

a) Load the transactions dataset and display the first 10 records.
# Display First 10 Records
head(data, 10)
# Explanation:
# • head() displays the top rows of the dataset.
# • 10 specifies first 10 records.

b) Calculate total deposits.
# Total Deposits
total_deposits <- data %>%
  filter(TransactionType == "Deposit") %>%
  summarise(Total_Deposit = sum(Amount))
total_deposits
# Explanation:
# • Filters only deposit transactions.
# • sum() calculates total deposited amount.

c) Calculate total withdrawals.
# Total Withdrawals
total_withdrawals <- data %>%
  filter(TransactionType == "Withdrawal") %>%
  summarise(Total_Withdrawal = sum(Amount))
total_withdrawals
# Explanation:
# • Filters withdrawal transactions.
# • Calculates total withdrawn amount.

d) Find accounts with transactions above 10000.
# Transactions Above 10000
high_transactions <- data %>%
  filter(Amount > 10000)
high_transactions
# Explanation:
# • Displays accounts where transaction amount exceeds 10000.

e) Calculate average transaction amount.
# Average Transaction Amount
avg_transaction <- mean(data$Amount)
avg_transaction
# Explanation:
# • mean() calculates average transaction amount.

f) Count number of transactions by type.
# Transaction Count by Type
transaction_count <- table(data$TransactionType)
transaction_count
# Explanation:
# • table() counts frequency of each transaction type.
# • Example: Deposit, Withdrawal, Transfer, etc.

# --- Code Block 4 ---
# Dataset: patients.xlsx
library(readxl)
library(dplyr)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "patients")

a) Load the patient’s dataset and display the first 10 records.
# Display First 10 Records
head(data, 10)
# Explanation:
# • head() displays top rows of dataset.
# • 10 specifies first 10 patient records.

b) Find patients with high blood pressure (>140).
# High Blood Pressure Patients
high_bp <- data %>%
  filter(BloodPressure > 140)
high_bp
# Explanation:
# • filter() selects patients having blood pressure greater than 140.

c) Detect patients with fever (>37°C).
# Patients with Fever
fever_patients <- data %>%
  filter(Temperature > 37)
fever_patients
# Explanation:
# • Filters patients whose body temperature exceeds 37°C.

d) Calculate average patient age.
# Average Age
avg_age <- mean(data$Age)
avg_age
# Explanation:
# • mean() calculates average age of patients.

e) Find maximum and minimum blood pressure.
# Maximum Blood Pressure
max_bp <- max(data$BloodPressure)
# Minimum Blood Pressure
min_bp <- min(data$BloodPressure)
max_bp
min_bp
# Explanation:
# • max() returns highest blood pressure.
# • min() returns lowest blood pressure.

f) Count number of patients above 60 years.
# Patients Above 60
senior_patients <- data %>%
  filter(Age > 60)
# Count Patients
nrow(senior_patients)
# Explanation:
# • filter() selects patients above 60 years.
# • nrow() counts total such patients.

# --- Code Block 5 ---
# Dataset: students.xlsx
library(readxl)
library(dplyr)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "students")

a) Load the students dataset and display the first 10 records.
# Display First 10 Records
head(data, 10)
# Explanation:
# • head() displays the top rows of the dataset.
# • 10 specifies first 10 student records.

b) Find students who scored above 80.
# Students Scoring Above 80
high_scorers <- data %>%
  filter(Marks > 80)
high_scorers
# Explanation:
# • filter() selects students with marks greater than 80.

c) Calculate average marks by subject.
# Average Marks by Subject
avg_marks <- data %>%
  group_by(Subject) %>%
  summarise(Average_Marks = mean(Marks))
avg_marks
# Explanation:
# • Groups data subject-wise.
# • mean() calculates average marks for each subject.

d) Find top scoring student.
# Top Scoring Student
top_student <- data %>%
  arrange(desc(Marks)) %>%
  head(1)
top_student
# Explanation:
# • arrange(desc(Marks)) sorts marks in descending order.
# • head(1) returns highest scoring student.

e) Find students who failed (Marks < 40).
# Failed Students
failed_students <- data %>%
  filter(Marks < 40)
failed_students
# Explanation:
# • Displays students scoring below 40 marks.

f) Count number of students in each subject.
# Student Count by Subject
subject_count <- table(data$Subject)
subject_count
# Explanation:
# • table() counts number of students in each subject category.

# --- Code Block 6 ---
# Dataset: posts.xlsx
library(readxl)
library(dplyr)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "posts")

a) Load the posts dataset and display the first 10 records.
# Display First 10 Records
head(data, 10)
# Explanation:
# • head() displays the top rows of the dataset.
# • 10 specifies first 10 records.

b) Calculate total engagement per post.
# Total Engagement
data$Total_Engagement <- data$Likes +
  data$Comments +
  data$Shares
# Display Dataset
head(data)
# Explanation:
# • Total Engagement = Likes + Comments + Shares

c) Find posts with engagement > 500.
# Posts with High Engagement
high_engagement <- data %>%
  filter(Total_Engagement > 500)
high_engagement
# Explanation:
# • Filters posts having engagement greater than 500.

d) Find most liked post.
# Most Liked Post
most_liked <- data %>%
  arrange(desc(Likes)) %>%
  head(1)
most_liked
# Explanation:
# • Sorts posts by likes in descending order.
# • Returns the post with highest likes.

e) Calculate average engagement.
# Average Engagement
avg_engagement <- mean(data$Total_Engagement)
avg_engagement
# Explanation:
# • mean() calculates average engagement across all posts.

f) Find posts with low engagement (<100).
# Low Engagement Posts
low_engagement <- data %>%
  filter(Total_Engagement < 100)
low_engagement
# Explanation:
# • Displays posts whose total engagement is less than 100.

