# --- Code Block 1 ---
library(readxl)
data <- read_excel("../R Practical - 7 Solution/data/Excel/analysis_data.xlsx")
# Pearson Correlation
correlation <- cor(data$Income,
                   data$SpendingScore,
                   method = "pearson",
                   use = "complete.obs")
correlation

# --- Code Block 2 ---
# Correlation significance test
cor_test <- cor.test(data$Income,
                      data$SpendingScore,
                      method = "pearson")
cor_test

# --- Code Block 3 ---
# Histogram of actual Income
hist(data$Income,
     probability = TRUE,
     main = "Income Distribution",
     col = "lightblue")
# Generate normal curve
x <- seq(min(data$Income),
         max(data$Income),
         length = 100)
y <- dnorm(x,
         mean = mean(data$Income),
         sd = sd(data$Income))
lines(x, y, col = "red", lwd = 2)

# --- Code Block 4 ---
# One-sample t-test
t_test <- t.test(data$Income,
                 mu = 50000)
t_test

# --- Code Block 5 ---
# Convert Purchase to success count
success <- sum(data$Purchase == "Yes")
total <- nrow(data)
# Binomial test
binom_test <- binom.test(success,
                         total,
                         p = 0.50)
binom_test

# --- Code Block 6 ---
# Correlation Matrix
cor_matrix <- cor(data[, c("Age",
                           "Income",
                           "SpendingScore")],
                  use = "complete.obs")
cor_matrix

# --- Code Block 7 ---
# Display correlation matrix
print(cor_matrix)

# --- Code Block 8 ---
hist(data$SpendingScore,
     probability = TRUE,
     col = "lightgreen",
     main = "SpendingScore Distribution")
x <- seq(min(data$SpendingScore),
         max(data$SpendingScore),
         length = 100)
y <- dnorm(x,
         mean = mean(data$SpendingScore),
         sd = sd(data$SpendingScore))
lines(x, y, col = "red", lwd = 2)

# --- Code Block 9 ---
t_test_spending <- t.test(data$SpendingScore,
                          mu = 60)
t_test_spending

# --- Code Block 10 ---
kruskal_result <- kruskal.test(SpendingScore ~ Region,
                               data = data)
kruskal_result

# --- Code Block 11 ---
cor(data$Income,
    data$SpendingScore,
    method = "pearson")

# --- Code Block 12 ---
cor.test(data$Income,
         data$SpendingScore,
         method = "pearson")

# --- Code Block 13 ---
# Simulated risky customer counts
risky_customers <- rpois(100,
                         lambda = 5)
hist(risky_customers,
     main = "Poisson Distribution",
     col = "orange")

# --- Code Block 14 ---
t.test(data$Income,
       mu = 40000)

# --- Code Block 15 ---
safe <- sum(data$Purchase == "Yes")
total <- nrow(data)
binom.test(safe,
           total,
           p = 0.60)

# --- Code Block 16 ---
spearman_cor <- cor(data$Age,
                    data$Income,
                    method = "spearman")
spearman_cor

# --- Code Block 17 ---
# Binomial distribution
purchase_events <- rbinom(100,
                          size = 10,
                          prob = 0.5)
hist(purchase_events,
     col = "skyblue",
     main = "Binomial Distribution")

# --- Code Block 18 ---
t.test(data$Age,
       mu = 35)

# --- Code Block 19 ---
region_table <- table(data$Region)
chisq.test(region_table)

# --- Code Block 20 ---
cor(data$Income,
    data$SpendingScore,
    method = "pearson")

# --- Code Block 21 ---
cor(data$Income,
    data$SpendingScore,
    method = "spearman")

# --- Code Block 22 ---
hist(data$SpendingScore,
     probability = TRUE,
     col = "pink",
     main = "SpendingScore Distribution")
x <- seq(min(data$SpendingScore),
         max(data$SpendingScore),
         length = 100)
y <- dnorm(x,
         mean = mean(data$SpendingScore),
         sd = sd(data$SpendingScore))
lines(x, y, col = "blue", lwd = 2)

# --- Code Block 23 ---
t.test(data$SpendingScore,
       mu = 55)

# --- Code Block 24 ---
wilcox.test(data$Age,
            data$SpendingScore)

# --- Code Block 25 ---
# Convert Purchase to binary
data$PurchaseBinary <- ifelse(data$Purchase == "Yes", 1, 0)
cor(data$PurchaseBinary,
    data$Income)

# --- Code Block 26 ---
purchase_trials <- rbinom(100,
                          size = 20,
                          prob = 0.6)
hist(purchase_trials,
     col = "lightgreen",
     main = "Purchase Trials Distribution")

# --- Code Block 27 ---
success <- sum(data$PurchaseBinary)
total <- nrow(data)
binom.test(success,
           total,
           p = 0.5)

# --- Code Block 28 ---
t.test(data$Income,
       mu = 55000)

# --- Code Block 29 ---
purchase_table <- table(data$Purchase)
chisq.test(purchase_table)

# --- Code Block 30 ---
numeric_data <- data[, sapply(data, is.numeric)]
cor_matrix <- cor(numeric_data,
                  use = "complete.obs")
cor_matrix

# --- Code Block 31 ---
cor_matrix

# --- Code Block 32 ---
demand <- rpois(100,
                lambda = 8)
hist(demand,
     col = "yellow",
     main = "Simulated Demand Distribution")

# --- Code Block 33 ---
t.test(data$Income,
       mu = 60000)

# --- Code Block 34 ---
kruskal.test(Age ~ Region,
             data = data)

