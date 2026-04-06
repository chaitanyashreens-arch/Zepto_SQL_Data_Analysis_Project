Zepto E-commerce SQL Data Analyst Portfolio Project
Domain: Retail / E-Commerce Analytics
Tools Used: SQL (PostgreSQL), pgAdmin

1.  Introduction
This project analyzes an e-commerce inventory dataset sourced from product listings of Zepto. The dataset reflects real-world retail scenarios, including pricing variations, stock availability, and multiple SKUs for the same product.
The analysis simulates how data analysts work in real business environments by transforming raw data into meaningful insights using SQL.

2. Objectives
The key objectives of this project are:
•	To create and manage a structured database
•	To perform Exploratory Data Analysis (EDA)
•	To clean and preprocess inconsistent data
•	To analyze pricing, discounts, and inventory
•	To generate business insights for decision-making

3. Dataset Description
The dataset consists of product-level inventory data where each row represents a unique SKU.
Key Features:
•	Duplicate product names due to variations (size, weight, packaging)
•	Mixed pricing formats (paise and rupees)
•	Presence of missing and invalid values
•	Real-world e-commerce catalog complexity
Columns:
•	sku_id – Unique identifier
•	name – Product name
•	category – Product category
•	mrp – Maximum Retail Price
•	discountPercent – Discount percentage
•	discountedSellingPrice – Final selling price
•	availableQuantity – Available stock
•	weightInGms – Product weight
•	outOfStock – Stock status
•	quantity – Units per package

4. Methodology
4.1 Database Creation
A PostgreSQL table was created using appropriate data types such as NUMERIC for pricing and BOOLEAN for stock status. The sku_id was defined as the primary key to ensure uniqueness.

4.2 Data Exploration
Initial exploration was performed to understand the dataset:
•	Counted total number of records
•	Viewed sample data for structure understanding
•	Checked for null values across all columns
•	Identified distinct product categories
•	Compared in-stock vs out-of-stock products
•	Detected duplicate product entries (multiple SKUs per product)

4.3 Data Cleaning
Data cleaning steps included:
•	Identifying rows with invalid pricing (MRP or selling price = 0)
•	Removing incorrect records
•	Converting price values from paise to rupees for consistency
•	Ensuring all numeric fields are standardized

4.4 Data Analysis
SQL queries were written to answer business-focused questions related to pricing, inventory, and product performance.

5. 📊 Key Analysis & Insights
🔹 Discount Analysis
•	Identified top products offering the highest discounts
•	Some categories show consistently higher discount patterns

🔹 Inventory Insights
•	Several high-priced products are out of stock, indicating potential revenue loss
•	Stock availability varies significantly across categories

🔹 Revenue Estimation
•	Estimated total revenue by multiplying selling price with available quantity
•	Certain categories contribute more significantly to potential revenue

🔹 Pricing Strategy
•	Identified expensive products (MRP > ₹500) with low discounts
•	Indicates presence of premium or less competitive pricing strategies

🔹 Value for Money Analysis
•	Calculated price per gram to compare product value
•	Bulk products tend to offer better value than smaller packages

🔹 Product Segmentation
•	Products were grouped into:
o	Low weight
o	Medium weight
o	Bulk category
•	Helps in inventory and pricing strategy decisions

🔹 Inventory Distribution
•	Calculated total inventory weight per category
•	Revealed uneven distribution across product categories

6. 📈 Business Implications
•	Stock Management: Out-of-stock high-value items may reduce revenue opportunities
•	Pricing Optimization: Discount strategies can be refined for competitiveness
•	Inventory Planning: Category-wise stock balancing is required
•	Product Strategy: Clear segmentation between budget and premium products

7.  Challenges Faced
•	Handling inconsistent pricing formats (paise vs rupees)
•	Managing duplicate product entries
•	Fixing column inconsistencies and null values
•	Cleaning invalid data records

8. ✅ Conclusion
This project demonstrates how SQL can be effectively used to analyze real-world e-commerce data.
It highlights essential data analyst skills such as:
•	Data cleaning and preprocessing
•	Exploratory data analysis
•	Writing business-driven SQL queries
•	Generating actionable insights
The project provides a strong foundation for real-world roles in e-commerce and retail analytics.

