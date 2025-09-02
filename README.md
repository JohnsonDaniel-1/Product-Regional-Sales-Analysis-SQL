# 📊 Product Regional Sales Analysis (SQL Project)

## Overview
This project analyzes a sales dataset to uncover key business insights, such as:
- Which regions contribute the most to total sales
- Effectiveness of discounts and promotions
- Most preferred payment methods by region

The goal is to demonstrate SQL skills in **data exploration, aggregation, and business analysis**.

---

## Dataset
- **Rows:** 1,500
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
- **Total Quantity returned:** 372
- **Total Quantity Sold:** 15244
- **Total Order:** 1500

---
### 2) Product with Highest Quantity Demand Across all region
- **Tablet:** 2519
---

### 3) Regional performance

**Total quantity sold by region**
| Region   | Total Quantity Sold |
|---------:|--------------------:|
| North    | 3,372               |
| Central  | 3,032               |
| East     | 2,997               |
| West     | 2,967               |
| South    | 2,876               |

---

### b) Top revenue region
- **North** — Revenue: **967,957.98**

---

### 4) Sales with Promotion vs Sales without Promotion
| Region  | SalesWithoutPromotion  |  SalesWithPromotion |
|:-------:|-----------------------:|--------------------:|
| North   | 250252.91              | 717705.07           |
| East    | 236882.59              | 646751.12           |
| West    | 151958.26              | 701520.6            |
| Central | 264534.06              | 582619.63           |
| South   | 170618.96              | 657149.23           |

### b) Quantity_Sold with Promotion vs Quantity_Sold without promotion
| Region  | SalesWithoutPromotion  |  SalesWithPromotion |
|:-------:|-----------------------:|--------------------:|
| North	 | 900	                 | 2472                |
| Central |	852	                 | 2180                |
| East	 | 714	                 | 2283                |
| West	 | 568	                 | 2399                |
| South	 | 661	                 | 2215                |

---

### 5) Discounts (per-region)
| Region  | Total_Discount | Average_Discount | Average_Discount (%) |
|:-------:|---------------:|-----------------:|---------------------:|
| North   | 23.4           | 0.076            | 7.6%                 |
| Central | 22.4           | 0.074            | 7.4%                 |
| East    | 22.2           | 0.071            | 7.1%                 |
| South   | 21.6           | 0.071            | 7.1%                 |
| West    | 20.2           | 0.071            | 7.1%                 |

The North region has the highest average discount (≈7.6%). This suggests discounts may be strategically used to stimulate sales or manage inventory levels

---

### 6) Product demand (top & bottom per region)

### Most demanding product in each region
| Region | Product | Quantity_Sold |
|:------:|:-------:|--------------:|
| West   | Tablet  | 624           |
| North  | Desk    | 570           |
| Central| Tablet  | 564           |
| East   | Phone   | 527           |
| South  | Laptop  | 524           |


### Lowest demanding product in each region 
| Region | Product     | Quantity_Sold |
|:------:|:-----------:|--------------:|
| South  | Desk        | 251           |
| Central| Phone       | 285           |
| West   | Phone       | 287           |
| North  | Phone       | 343           |
| East   | Monitor     | 354           |


### b) Product revenue (top & bottom per region)

### Product with Highest in each region in each region
| Region | Product         | Revenue       |
|:------:|:----------------|--------------:|
| North	| Monitor	      | 172222.04     |
| Central| Tablet	         | 165311.14     |
| South	| Laptop	         | 157696.02     |
| West	| Tablet	         | 149878.34     |
| East	| Printer         | 149017.84     |

### Product with Highest in each region in each region
| Region  | Product        | Revenue        |
|:-------:|:---------------|---------------:|
| South	 | Desk	         | 68565.67       |
| Central |	Phone	         | 72442.83       |
| West	 | Phone	         | 78585.67       |
| North	 | Phone	         | 79577.45       |
| East	 | Tablet	      | 106910.27      |

---

### 7) Salesperson performance (highlight)
| Metric                              | Person  | Value          |
|:-----------------------------------:|:-------:|---------------:|
| Top salesperson (by revenue)        | **Bob** | 796,780.52     |
| Top salesperson (by quantity sold)  | **Alice**| 2,668 units   |
| Most returned orders (by salesperson)| **Carlos** | 76 orders  |

**Notes / Interpretation**
- Bob generates the highest revenue — assess product mix and average order value for Bob’s accounts.
- Alice sells the most units — good for volume-driven promotions or high-velocity products.
- Carlos has the highest number of returns — investigate common products/regions tied to returns (quality or fulfillment issue).

---

### 8). Payment Experience (by Region)
- Central → Online is the most used payment method.
- North, South, East → Cash dominates as the preferred method.
- West → Debit Card is the most used

---

## 9) Recommendations  
   ### Payment Experience
-  Central (Online) → Strengthen online payment channels, ensure fast and secure checkout, and offer online-exclusive discounts.
-  North, South, East (Cash) → optimize cash-handling logistics, but also run awareness campaigns or small incentives to nudge customers toward digital payments for efficiency.
-  West (Debit Card) → Partner with banks to give cardholders benefits (e.g., cashback or loyalty points). Ensure debit card systems are reliable and seamless.
   ### Regional Sales & Product Demand
- Tablets are the highest-demand product overall (2,519 units). Ensure strong inventory and promotional focus across all regions.
  ### Region-specific product strategies:
- North: Desk (high demand) → Ensure stock availability for desks in North to avoid revenue loss due to stockouts .
- South: Desk (lowest demand) → Review pricing or reposition desks in South to reduce low-performing SKUs
- West: Tablet (top seller) → maintain promotions; potential to bundle with accessories.
   ### Promotion Effectiveness
- Promotions significantly boost sales volume (e.g., North: 2,472 with vs 900 without). Scale successful promotions, but monitor margin impact. Test data-driven promotional campaigns to balance revenue and profitability.
- Run A/B testing of promotion types( e.g discount vs bundle) to identify the most profitable strategy
   ### Discount Strategy
- North has the highest average discount (7.6%). Perform a margin impact analysis to determine whether discounts drive sustainable revenue growth or reduce profitability.. Consider **tiered discounts** tied to customer loyalty rather than blanket reductions.
  ### Returns Management
- Since total returns are relatively low (372 units), continue monitoring but create a returns dashboard to detect unusual spikes early.


---

## Tools Used
- SQL Server (T-SQL)
  

