# 📊 Product Regional Sales Analysis (SQL Project)

## Overview
This project analyzes a sales dataset to uncover key business insights, such as:
- Which regions contribute the most to total sales
- Effectiveness of discounts and promotions
- Most preferred payment methods by region

The goal is to demonstrate SQL skills in **data exploration, aggregation, and business analysis**.

---

## Dataset
- **Rows:** 1,500+
- **Columns:** Date, Region, Product, Unit Price, Quantity, Discount, Promotion, Payment Method
- **Source:** Synthetic dataset for training purposes

---

## Business Questions
1. Total orders by region  
2. Average and total discounts given  
3. Payment methods most used in each region  
4. Regional sales contribution to overall revenue  
5. Sales with vs without promotions  

---

## SQL Scripts
All SQL queries are in [`Product-Regional-Sales`](scripts/Product-Regional-Sales.sql).  
Each query is well-documented with comments.

---

## Key Finding

> Source: SQL queries in `scripts/Product-Regional-Sales.sql`  

### 1) Executive summary
This analysis examines regional product sales to identify top regions, product demand, promotional effects, and salesperson performance. The SQL scripts used for the analysis are in `scripts/Product-Regional-Sales.sql`.

**Top-level KPIs**
- **Total sales:** 4,379,992.43  
- **Total orders returned:** 372

---

### 2) Regional performance

**Total quantity sold by region**
| Region   | Total Quantity Sold |
|---------:|--------------------:|
| North    | 3,372               |
| Central  | 3,032               |
| East     | 2,997               |
| West     | 2,967               |
| South    | 2,876               |

**Top revenue region**
- **North** — Revenue: **967,957.98**

---

### 3) Discounts (per-region)
| Region  | Total_Discount | Average_Discount (decimal) | Average_Discount (%) |
|:-------:|---------------:|---------------------------:|---------------------:|
| North   | 23.4           | 0.076                      | 7.6%                 |
| Central | 22.4           | 0.074                      | 7.4%                 |
| East    | 22.2           | 0.071                      | 7.1%                 |
| South   | 21.6           | 0.071                      | 7.1%                 |
| West    | 20.2           | 0.071                      | 7.1%                 |

The North region has the highest average discount (≈7.6%). This suggests discounts may be strategically used to stimulate sales or manage inventory levels

---

### 4) Product demand (top & bottom per region)

### Most demanding product in each region (by quantity sold)
| Region | MostDemanding | Quantity_Sold |
|:------:|:-------------:|--------------:|
| West   | Tablet        | 624           |
| North  | Desk          | 570           |
| Central| Tablet        | 564           |
| East   | Phone         | 527           |
| South  | Laptop        | 524           |


### Lowest demanding product in each region (by quantity sold)
| Region | LowestDemanding | Quantity_Sold |
|:------:|:---------------:|--------------:|
| South  | Desk            | 251           |
| Central| Phone           | 285           |
| West   | Phone           | 287           |
| North  | Phone           | 343           |
| East   | Monitor         | 354           |


---

### 5) Sales with vs. without promotions




---

### 6) Salesperson performance (highlight)
| Metric                              | Person  | Value          |
|:-----------------------------------:|:-------:|---------------:|
| Top salesperson (by revenue)        | **Bob** | 796,780.52     |
| Top salesperson (by quantity sold)  | **Alice**| 2,668 units   |
| Most returned orders (by salesperson)| **Carlos** | 76 orders    |

**Notes / Interpretation**
- Bob generates the highest revenue — assess product mix and average order value for Bob’s accounts.
- Alice sells the most units — good for volume-driven promotions or high-velocity products.
- Carlos has the highest number of returns — investigate common products/regions tied to returns (quality or fulfillment issue).

### 7). Payment Experience (by Region)
- Central → Online is the most used payment method.
- North, South, East → Cash dominates as the preferred method.
- West → Debit Card is the most used

---

## 7) Recommendations
1. **Investigate return causes** for Carlos (top returns) — product defects, shipping issues, or incorrect orders.  
2. **Review discount strategy** in the North — discounts are high; measure impact on margin.  
3. **Targeted promotions**: promote tablets in West (high demand) and desk in North; consider improving inventory for top products.
   #### Payment Experience
5. Central (Online) → Strengthen online payment channels, ensure fast and secure checkout, and offer online-exclusive discounts.
6. North, South, East (Cash) → Improve cash-handling logistics, but also run awareness campaigns or small incentives to nudge customers toward digital payments for efficiency.
7. West (Debit Card) → Partner with banks to give cardholders benefits (e.g., cashback or loyalty points). Ensure debit card systems are reliable and seamless. 


---

## Tools Used
- SQL Server (T-SQL)
- GitHub for version control

