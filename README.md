# KPMG-Style Financial Analytics Case Study

## Project Overview
This project simulates a **real-world KPMG Data & Analytics advisory engagement**, transforming raw financial data into **executive-level insights and strategic recommendations**.

The objective goes beyond reporting metrics — it focuses on **business decision-making**, cost optimization, risk mitigation, and profitability analysis, aligned with consulting best practices.

---

## Business Objective
To support leadership decision-making by:
- Identifying regional and industry profitability drivers
- Detecting loss-making clients
- Managing revenue and profit volatility
- Delivering actionable, executive-ready recommendations

---

## Tools & Technologies
- **Microsoft Excel** — Data cleaning & data quality remediation  
- **MySQL** — Exploratory Data Analysis (EDA) & SQL views  
- **Tableau Public** — Interactive executive dashboard  
- **GitHub** — Version control & documentation  

---

## Step 1: Data Cleaning & Quality Remediation (Excel)

### Data Quality Issues Identified
- Missing values in `Operating_Cost_ZAR`
- Duplicate records
- Revenue outliers (extreme gains and losses)

### Cleaning Actions Taken
- Imputed missing operating costs using **industry-level medians**
- Removed duplicate records using Excel’s built-in validation tools
- Identified outliers using the **Interquartile Range (IQR) method**
- Documented issues transparently using a `Data_Quality_Issue` flag

✔ Result: A clean, analysis-ready dataset suitable for financial analytics and reporting.

---

## Step 2: Data Loading & Validation (MySQL)

- Exported the cleaned dataset from Excel as CSV
- Imported data into **MySQL Workbench**
- Validated row counts, schema consistency, and missing values
- Standardized column names for SQL compatibility

---

## Step 3: Exploratory Data Analysis (EDA) in SQL

Key business questions answered:
- Which regions drive overall profitability?
- Which industries generate high revenue but weaker margins?
- Which clients consistently produce losses?
- How volatile are revenue and profit trends over time?

EDA was conducted using aggregation, filtering, and trend analysis in SQL.

---

## Step 4: SQL Views for Scalable Reporting

Reusable SQL views were created to support analytics and dashboarding:

- **Regional Profitability View**
- **Industry Performance View**
- **Loss-Making Client Identification**
- **Monthly Revenue vs Profit Trends**

These views enable clean separation between raw data and reporting logic.

---

## Step 5: Executive Dashboard (Tableau)

An interactive Tableau dashboard was built to provide:
- Regional profit contribution analysis
- Industry-level margin comparison
- Identification of loss-making clients
- Monthly revenue vs profit trend analysis
- Global filters for Region, Industry, and Client

The dashboard is designed for **executive decision-making**, not just visualization.

---

## Executive Insights & Strategic Recommendations

### 1. High-Value Client Retention (Gauteng Focus)
**Insight:** Gauteng is the primary driver of profitability, contributing nearly **R70M**, significantly outperforming other regions.

**Recommendation:** Implement a **Gauteng Key Account Management Program** to reduce churn risk and protect core revenue.

---

### 2. Margin Protection & Cost Optimization (Retail Sector)
**Insight:** Retail generates high revenue (over **R90M**) but shows weaker margin consistency compared to Financial Services.

**Recommendation:** Conduct a **deep-dive cost audit** to identify operational inefficiencies eroding profitability.

---

### 3. Financial Risk Mitigation (Loss-Making Clients)
**Insight:** Specific clients (e.g. Client IDs 1033, 1002, 1040) consistently generate losses.

**Recommendation:** Launch a **Path to Profitability Review**:
- Renegotiate pricing
- Restructure unprofitable services
- Exit engagements with no viable recovery path

---

### 4. Volatility Management (Monthly Trends)
**Insight:** Revenue and profit trends show extreme volatility, with profit declining faster during low-revenue months.

**Recommendation:** Transition toward a **more flexible cost model** to protect margins during seasonal downturns.

---

## Skills
This project demonstrates my ability to:
- Perform end-to-end data analytics
- Translate data into **business strategy**
- Communicate insights to non-technical stakeholders
- Operate in a **professional consulting environment**

This aligns directly with expectations for a **Junior Data Analyst role at KPMG**.

---

## Contact
**Thandiwe Dlomo**  
📧 thandiwedlomo.datascience@gmail.com  


---

