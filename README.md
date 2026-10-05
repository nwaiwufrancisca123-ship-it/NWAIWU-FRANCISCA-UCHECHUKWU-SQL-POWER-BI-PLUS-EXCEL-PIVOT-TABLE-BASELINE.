# NWAIWU-FRANCISCA-UCHECHUKWU-SQL-POWER-BI-PLUS-EXCEL-PIVOT-TABLE-BASELINE.
NWAIWU FRANCISCA UCHECHUKWU SQL &amp; POWER BI audit of Global superstore sales data, plus an EXCEL/PIVOT TABLE KPI baseline-junior data analyst  portfolio.


# 📊 Global Superstore Data Audit — Portfolio Project

## Overview
A full data analysis audit of Global Superstore's transactional sales data (~51,290 order lines), built to investigate why the company's record-breaking revenue wasn't translating into proportional profit. The project covers a 10-question SQL audit with two Root Cause Analyses, a Power BI visualization layer, and a separate Excel/PivotTable KPI baseline built from the company's earliest 1,000 recorded orders.

*Role:* Junior Data Analyst | *Tools:* MySQL Workbench, Power BI, Excel

---

## 📁 Files in This Repository

| File | Description |
|---|---|
| Global_Superstore_Audit_Full_Report.docx | Full SQL audit report — Executive Summary, Data Quality Notes, Root Cause Analyses, 10 business questions with SQL + insights, Recommendations, Conclusion, Appendices |
| superstore_audit_queries.sql | All 10 SQL queries, commented and organized |
| Superstore_First1000_KPI_Report.xlsx | Excel workbook — PivotTable-based KPI baseline from the company's first 1,000 chronological orders, with charts and business insights |
| powerbi_export.pdf | Static export of the Power BI dashboard (see live link below for the interactive version) |

## 🔗 Live Interactive Versions
- [Power BI Dashboard (Publish to Web)](#) — filters and slicers fully interactive
- [Excel Workbook (OneDrive/Google Sheets)](#) — live, scrollable PivotTables

---

## 🔍 Key Findings

- *Revenue vs. Profit Gap:* $12.64M in total revenue generated only $28.61 average profit per transaction (~11.6% margin)
- *The Discount Dilemma:* Profit turns negative once discounts exceed ~20–25%; every tier at 30%+ loses money on average, bottoming out at *-$1,534 per order* at 85% off
- *The Product Paradox:* "Tables" is the only Sub-Category operating at a net loss (*-$64,083.39) despite generating *$757,034** in sales — driven by carrying the highest average discount (29%) of any category
- *Shipping Bottleneck:* 60% of orders ship via the slowest method (Standard Class, 5.0 days) even though the company ships Critical orders in under 2 days — a cost choice, not a capacity limit
- *Data Quality:* Identified and corrected a non-unique Product ID field, an unreliable Customer Name grouping key, a Locations table join fan-out bug, and a 52-row CSV import column-shift error — all documented with before/after evidence

---

## 🧮 Methodology Highlights
- Diagnosed and fixed multiple real-world data quality issues (duplicate keys, join fan-out, CSV parsing corruption) with verified before/after figures
- Applied the 5 Whys technique for two separate Root Cause Analyses
- Used documented proxy logic where source data lacked a required field (e.g., no Status/Returns table — proxy and its limitations explicitly stated)
- Built a reproducible Excel KPI baseline entirely with live formulas (zero hardcoded results)

---

## 📬 Contact
Feel free to connect or reach out with questions about this project. contact at
*Email* nwaiwufrancisca123@gmail.com
*Linkedin* https://www.linkedin.com/in/nwaiwu-francisca-37b230380
