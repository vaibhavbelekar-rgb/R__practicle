# --- Code Block 1 ---
# Create Customer Object
customer <- list(
  Name = "Rahul",
  Age = 30,
  Income = 55000,
  Membership = "Gold"
)
# Assign S3 Class
class(customer) <- "Customer"
customer

# --- Code Block 2 ---
# Access Attributes
customer$Age
customer$Income
customer$Membership

# --- Code Block 3 ---
# Custom Print Method
print.Customer <- function(obj)
{
  cat("Customer Details\n")
  cat("------------------\n")
  cat("Name :", obj$Name, "\n")
  cat("Age :", obj$Age, "\n")
  cat("Income :", obj$Income, "\n")
  cat("Membership :", obj$Membership, "\n")
}
# Print Object
print(customer)

# --- Code Block 4 ---
# Display Individual Details
customer$Name
customer$Age
customer$Income
customer$Membership

# --- Code Block 5 ---
# Modify Membership
customer$Membership <- "Platinum"
# Display Updated Object
print(customer)

# --- Code Block 6 ---
# Define S4 Class
setClass(
  "Customer",
  slots = list(
    Age = "numeric",
    Income = "numeric",
    Membership = "character"
  )
)

# --- Code Block 7 ---
# Create Customer Object
customer1 <- new(
  "Customer",
  Age = 35,
  Income = 75000,
  Membership = "Gold"
)
customer1

# --- Code Block 8 ---
# Custom Show Method
setMethod(
  "show",
  "Customer",
  function(object)
  {
    cat("Customer Details\n")
    cat("------------------\n")
    cat("Age :", object@Age, "\n")
    cat("Income :", object@Income, "\n")
    cat("Membership :", object@Membership, "\n")
  }
)
# Display Object
customer1

# --- Code Block 9 ---
library(readxl)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "customers")
# Copy Dataset
data_copy <- data

# --- Code Block 10 ---
# Modify Income Column in Copied Dataset
data_copy$Income <- data_copy$Income + 5000
# Display Modified Copy
head(data_copy)

# --- Code Block 11 ---
# Display Original Dataset
head(data)

# --- Code Block 12 ---
# Compare Original and Modified Dataset
identical(data, data_copy)

# --- Code Block 13 ---
library(readxl)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "sales")
# Create Large Object
large_data <- rbind(data,
                    data,
                    data,
                    data,
                    data)
# Display First Records
head(large_data)

# --- Code Block 14 ---
# Check Memory Usage
object.size(large_data)

# --- Code Block 15 ---
# Remove Object
rm(large_data)

# --- Code Block 16 ---
# Garbage Collection
gc()

# --- Code Block 17 ---
library(readxl)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "customers")
# Convert Dataset into List
customer_list <- split(data, seq(nrow(data)))
# Display First Customer
customer_list[[1]]

# --- Code Block 18 ---
# Assign S3 Class to Each Customer
customer_list <- lapply(customer_list, function(x)
{
  class(x) <- "Customer"
  return(x)
})
# Check Class
class(customer_list[[1]])

# --- Code Block 19 ---
# Access Customer Details
customer_list[[1]]$Name
customer_list[[1]]$Age

# --- Code Block 20 ---
# Modify Customer Income
customer_list[[1]]$Income <- 80000
# Display Updated Customer
customer_list[[1]]

# --- Code Block 21 ---
# Display Structure
str(customer_list)

# --- Code Block 22 ---
library(readxl)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "customers")
# Check Class
class(data)

# --- Code Block 23 ---
# Inspect Structure
str(data)

# --- Code Block 24 ---
# Extract Attributes
attributes(data)

# --- Code Block 25 ---
# Summary of Dataset
summary(data)

# --- Code Block 26 ---
# Create S4 Class
setClass(
  "SpendingProfile",
  slots = list(
    SpendingScore = "numeric",
    Income = "numeric"
  )
)

# --- Code Block 27 ---
# Display Class Definition
getClass("SpendingProfile")

# --- Code Block 28 ---
library(readxl)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "customers")
# Create Object
profile1 <- new(
  "SpendingProfile",
  SpendingScore = 78,
  Income = 65000
)
profile1

# --- Code Block 29 ---
# Access Slot Values
profile1@SpendingScore
profile1@Income

# --- Code Block 30 ---
# Modify Slot Values
profile1@SpendingScore <- 90
profile1@Income <- 75000
# Display Updated Object
profile1

# --- Code Block 31 ---
library(readxl)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "sales")
# Create Summary
sales_summary <- summary(data)
# Create Nested List
company_data <- list(
  Dataset = data,
  Summary = sales_summary
)
company_data

# --- Code Block 32 ---
# Access Dataset
company_data$Dataset
# Access Summary
company_data$Summary

# --- Code Block 33 ---
# Add New Element
company_data$CompanyName <- "Retail Analytics Pvt Ltd"
# Display Updated List
company_data

# --- Code Block 34 ---
# Assign S3 Class
class(company_data) <- "CompanyData"
# Check Class
class(company_data)

# --- Code Block 35 ---
# Display Structure
str(company_data)

# --- Code Block 36 ---
library(readxl)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "customers")
# Convert into S3 Object
customer_object <- data
class(customer_object) <- "CustomerData"
# Check Class
class(customer_object)

# --- Code Block 37 ---
# Function to Calculate Average Income
average_income <- function(obj)
{
  mean(obj$Income)
}

# --- Code Block 38 ---
# Apply Function
average_income(customer_object)

# --- Code Block 39 ---
# Add New Attribute
attr(customer_object, "Source") <- "Customer Survey Data"
# Display Attributes
attributes(customer_object)

# --- Code Block 40 ---
# Check Object Structure
str(customer_object)
# Verify Class
class(customer_object)
# Check Missing Values
sum(is.na(customer_object))

# --- Code Block 41 ---
# S3 Object Creation
library(readxl)
# Load Dataset
data <- read_excel("../R Practical - 8 Solution/data/Excel/data.xlsx",
                   sheet = "customers")
# Create S3 Object
s3_customer <- data
class(s3_customer) <- "CustomerS3"
# Check Class
class(s3_customer)

# --- Code Block 42 ---
# S4 Object Creation
setClass(
  "CustomerS4",
  slots = list(
    Age = "numeric",
    Income = "numeric",
    Membership = "character"
  )
)
# Create S4 Object
s4_customer <- new(
  "CustomerS4",
  Age = 35,
  Income = 65000,
  Membership = "Gold"
)
s4_customer

# --- Code Block 43 ---
# S3 Flexible Assignment
s3_customer$new_column <- "Flexible"
# S4 Strict Validation
# Example:
# s4_customer@Age <- "Thirty"
# This will generate an error

# --- Code Block 44 ---
# S3 Summary Method
# Custom Summary Function for S3
summary.CustomerS3 <- function(object)
{
  cat("Average Income :", mean(object$Income), "\n")
  cat("Average Age :", mean(object$Age), "\n")
}
# Apply Summary
summary(s3_customer)

# --- Code Block 45 ---
# S4 Summary Method
# Create Summary Method for S4
setMethod(
  "summary",
  "CustomerS4",
  function(object)
  {
    cat("Customer Summary\n")
    cat("----------------\n")
    cat("Age :", object@Age, "\n")
    cat("Income :", object@Income, "\n")
    cat("Membership :", object@Membership, "\n")
  }
)
# Apply Summary
summary(s4_customer)

