# --- Code Block 1 ---
a) Create OrderSize (Small, Medium, Large)
sales_data$OrderSize <- ifelse(sales_data$Quantity <= 3, "Small",
ifelse(sales_data$Quantity <= 7, "Medium", "Large"))
head(sales_data)
b) Sort by Quantity descending
sales_data[order(-sales_data$Quantity), ]
c) Sort by City and Revenue
sales_data[order(sales_data$City, -sales_data$Revenue), ]
d) Create Tax column
sales_data$Tax <- sales_data$FinalAmount * 0.18
head(sales_data)
e) Create TotalBill column
sales_data$TotalBill <- sales_data$FinalAmount + sales_data$Tax
head(sales_data)

# --- Code Block 2 ---
library(dplyr)
a) Select CustomerName and Product
select(sales_data, CustomerName, Product)
b) Select numeric columns
select_if(sales_data, is.numeric)
c) Remove Discount column
select(sales_data, -Discount)
d) Filter Pune customers
filter(sales_data, City == "Pune")
e) Filter multiple conditions (Price > 20000 and Quantity > 5)
filter(sales_data, Price > 20000 & Quantity > 5)

# --- Code Block 3 ---
a) Create Tax variable
sales_data <- sales_data %>%
mutate(Tax = FinalAmount * 0.18)
b) Create Profit variable
sales_data <- sales_data %>%
mutate(Profit = FinalAmount * 0.20)
c) Create OrderCategory
sales_data <- sales_data %>%
mutate(OrderCategory = ifelse(Revenue > 30000, "High",
ifelse(Revenue > 10000, "Medium", "Low")))
d) Create DiscountCategory
sales_data <- sales_data %>%
mutate(DiscountCategory = ifelse(Discount > 10, "High Discount",
"Low Discount"))
e) Create PaymentType variable
sales_data <- sales_data %>%
mutate(PaymentType = PaymentMethod)
f) Sort by Revenue descending using arrange()
arrange(sales_data, desc(Revenue))

# --- Code Block 4 ---
a) Total revenue by city
sales_data %>%
group_by(City) %>%
summarise(TotalRevenue = sum(Revenue))
b) Average price by product
sales_data %>%
group_by(Product) %>%
summarise(AveragePrice = mean(Price))
c) Total quantity sold by product
sales_data %>%
group_by(Product) %>%
summarise(TotalQuantity = sum(Quantity))
d) Maximum revenue by city
sales_data %>%
group_by(City) %>%
summarise(MaxRevenue = max(Revenue))
e) Minimum revenue by product
sales_data %>%
group_by(Product) %>%
summarise(MinRevenue = min(Revenue))

# --- Code Block 5 ---
1) Count orders per customer
sales_data %>%
group_by(CustomerName) %>%
summarise(OrderCount = n())
2) Total revenue per customer
sales_data %>%
group_by(CustomerName) %>%
summarise(TotalRevenue = sum(Revenue))
3) Average order value
mean(sales_data$Revenue)
4) Top customer
sales_data %>%
group_by(CustomerName) %>%
summarise(TotalRevenue = sum(Revenue)) %>%
arrange(desc(TotalRevenue))
5) Sort customers by revenue
sales_data %>%
group_by(CustomerName) %>%
summarise(TotalRevenue = sum(Revenue)) %>%
arrange(desc(TotalRevenue))

