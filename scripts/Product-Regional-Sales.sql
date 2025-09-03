-- ================================
-- 📊 PRODUCT REGIONAL SALES ANALYSIS
-- ================================

-- 🔹 Total revenue from all sales
SELECT SUM(TotalPrice) AS Total_Sales
FROM dbo.product_region;

-- 🔹 Total_Quantity_Sold
SELECT SUM(Final_Quantity) AS Total_Quantity_Sold
FROM dbo.product_region

-- 🔹 Total Order
SELECT COUNT(OrderID) AS Total_Order
FROM dbo.product_region

-- 🔹 Total returned items (limitation: dataset tracks returns separately)
SELECT SUM(Returned) AS Total_Returned
FROM dbo.product_region;

-- 🔹 Add computed column: final quantity (sold - returned)
ALTER TABLE dbo.product_region
ADD Final_Quantity AS (Quantity - Returned);

-- Preview dataset with new column
SELECT * FROM dbo.product_region;

-- 🔹 Quantity sold per region
SELECT Region, SUM(Final_Quantity) AS Total_Quantity
FROM dbo.product_region
GROUP BY Region
ORDER BY Total_Quantity DESC;

-- 🔹 Region with highest revenue
SELECT Region, ROUND(SUM(TotalPrice), 2) AS Revenue
FROM dbo.product_region
GROUP BY Region
ORDER BY Revenue DESC;

-- 🔹 Discount totals and averages per region
SELECT Region,
       ROUND(SUM(Discount), 1) AS Total_Discount,
       ROUND(AVG(Discount), 3) AS Average_Discount
FROM dbo.product_region
GROUP BY Region
ORDER BY Total_Discount DESC;

-- 🔹 Revenue contribution of each region (% of total)
SELECT Region,
       ROUND(SUM(TotalPrice), 2) AS Region_Revenue,
       ROUND((SUM(TotalPrice) * 100.0 /
              NULLIF((SELECT SUM(TotalPrice) FROM dbo.product_region), 0)), 2) AS Contribution_Percent
FROM dbo.product_region
GROUP BY Region
ORDER BY Contribution_Percent DESC;


-- ================================
-- 👤 SALESPERSON PERFORMANCE
-- ================================

-- 🔹 Top salesperson by revenue
SELECT Salesperson,
       ROUND(SUM(TotalPrice), 2) AS Revenue
FROM dbo.product_region
GROUP BY Salesperson
ORDER BY Revenue DESC;

-- 🔹 Top salesperson by quantity sold
SELECT Salesperson,
       ROUND(SUM(Final_Quantity), 2) AS Total_Quantity_Sold
FROM dbo.product_region
GROUP BY Salesperson
ORDER BY Total_Quantity_Sold DESC;

-- 🔹 Salesperson with the most returns
SELECT Salesperson,
       SUM(Returned) AS Total_Returned
FROM dbo.product_region
GROUP BY Salesperson
ORDER BY Total_Returned DESC;


-- ================================
-- 📦 PRODUCT & PROMOTIONS
-- ================================

-- 🔹 Replace NULL promotions with 'No Promotion' for clarity
UPDATE dbo.product_region
SET Promotion = 'No Promotion'
WHERE Promotion IS NULL;

-- 🔹 Most demanded product in each region
WITH RegionTotals AS (
    SELECT Region, Product, SUM(Final_Quantity) AS Quantity_Sold
    FROM dbo.product_region
    GROUP BY Region, Product
),
Ranked AS (
    SELECT Region, Product, Quantity_Sold,
           RANK() OVER (PARTITION BY Region ORDER BY Quantity_Sold DESC) AS Rnk
    FROM RegionTotals
)
SELECT Region, Product AS MostDemanding, Quantity_Sold
FROM Ranked
WHERE Rnk = 1;

-- 🔹 Least demanded product in each region
WITH RegionTotals AS (
    SELECT Region, Product, SUM(Final_Quantity) AS Quantity_Sold
    FROM dbo.product_region
    GROUP BY Region, Product
),
Ranked AS (
    SELECT Region, Product, Quantity_Sold,
           RANK() OVER (PARTITION BY Region ORDER BY Quantity_Sold ASC) AS Rnk
    FROM RegionTotals
)
SELECT Region, Product AS LowestDemanding, Quantity_Sold
FROM Ranked
WHERE Rnk = 1;

-- 🔹 Top revenue product in each region
WITH RegionTotals AS (
    SELECT Region, Product, SUM(TotalPrice) AS Revenue
    FROM dbo.product_region
    GROUP BY Region, Product
),
Ranked AS (
    SELECT Region, Product, Revenue,
           RANK() OVER (PARTITION BY Region ORDER BY Revenue DESC) AS Rnk
    FROM RegionTotals
)
SELECT Region, Product AS BestSellingProduct, Revenue
FROM Ranked
WHERE Rnk = 1;

-- 🔹 Lowest revenue product in each region
WITH RegionTotals AS (
    SELECT Region, Product, SUM(TotalPrice) AS Revenue
    FROM dbo.product_region
    GROUP BY Region, Product
),
Ranked AS (
    SELECT Region, Product, Revenue,
           RANK() OVER (PARTITION BY Region ORDER BY Revenue ASC) AS Rnk
    FROM RegionTotals
)
SELECT Region, Product AS WorstSellingProduct, Revenue
FROM Ranked
WHERE Rnk = 1;

-- 🔹 Best-selling product overall (by quantity)
SELECT Product, SUM(Final_Quantity) AS Total_Quantity_Sold
FROM dbo.product_region
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC;

-- 🔹 Revenue with vs without promotion (per region)
SELECT Region,
       ROUND(SUM(CASE WHEN Promotion = 'No Promotion' THEN TotalPrice ELSE 0 END), 2) AS SalesWithoutPromotion,
       ROUND(SUM(CASE WHEN Promotion <> 'No Promotion' THEN TotalPrice ELSE 0 END), 2) AS SalesWithPromotion
FROM dbo.product_region
GROUP BY Region;

-- 🔹 Quantity sold with vs without promotion (per region)
SELECT Region,
       ROUND(SUM(CASE WHEN Promotion = 'No Promotion' THEN Final_Quantity ELSE 0 END), 2) AS QuantityWithoutPromotion,
       ROUND(SUM(CASE WHEN Promotion <> 'No Promotion' THEN Final_Quantity ELSE 0 END), 2) AS QuantityWithPromotion
FROM dbo.product_region
GROUP BY Region;


-- ================================
-- 💳 PAYMENT & SHIPPING
-- ================================

-- 🔹 Most common payment method in each region
WITH PaymentCounts AS (
    SELECT Region, PaymentMethod,
           COUNT(*) AS PaymentCount,
           ROW_NUMBER() OVER (PARTITION BY Region ORDER BY COUNT(*) DESC) AS PaymentRank
    FROM dbo.product_region
    GROUP BY Region, PaymentMethod
)
SELECT Region, PaymentMethod AS MostCommonPaymentMethod
FROM PaymentCounts
WHERE PaymentRank = 1;
