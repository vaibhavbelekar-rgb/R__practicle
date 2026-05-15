#Q1
# Create Data Frame
df <- data.frame(
  name = c('raj','amit','neha','raj','amit'),
  marks = c('80','90',NA,'85','90'),
  city = c('pune','pune','mumbai','pune','mumbai')
)

# 1. Remove extra spaces from name
df$name <- trimws(df$name)

# 2. Convert name to lowercase
df$name <- tolower(df$name)

# 3. Convert marks into numeric and handle missing value
df$marks <- as.numeric(df$marks)

# Replace NA with mean marks
df$marks[is.na(df$marks)] <- mean(df$marks, na.rm = TRUE)

# 4. Standardize city names to lowercase
df$city <- tolower(df$city)

# 5. Filter students with marks greater than 80
filtered_df <- df[df$marks > 80, ]

# 6. Create new column grade
df$grade <- ifelse(df$marks >= 85, "A", "B")

print(df)

print(filtered_df)




# 1 & 2. Create Dataset
data <- data.frame(
  gender = c('male','female','male','female','male','female'),
  purchase = c('yes','no','yes','yes','no','yes'),
  amount = c(5000,7000,8000,6000,4000,9000)
)

print(data)

# 3. Calculate Mean of Amount
mean_amount <- mean(data$amount)
print(mean_amount)

# 4. Frequency Table for Gender
freq_gender <- table(data$gender)
print(freq_gender)

# 5. Cross Tabulation of Gender and Purchase
cross_tab <- table(data$gender, data$purchase)
print(cross_tab)

# 6. Find Total Purchase Amount
total_amount <- sum(data$amount)
print(total_amount)

# 7. Count Number of Yes Purchases
yes_count <- sum(data$purchase == "yes")
print(yes_count)





















