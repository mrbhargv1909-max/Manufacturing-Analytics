# 🏭 Manufacturing Analytics: Production & Quality Analysis

An end-to-end manufacturing analytics project demonstrating operational data modeling, data quality checks, KPI analysis, and dashboard reporting using **SQL, Excel, Power BI, and Tableau**.

---

## 🛠️ Tech Stack & Skills

- **MySQL:** Relational schema design, data profiling, duplicate and null checks, and analysis queries.
- **Microsoft Excel:** KPI analysis and interactive production and quality dashboards.
- **Power BI:** Interactive reporting with operational filters and production and quality measures.
- **Tableau:** Packaged workbooks for exploring production, delivery, cost, and quality metrics.

---

## 📥 Project Files & Downloads

- 📊 **Source Dataset:** [Download Manufacturing_Dataset.xlsx](Manufacturing_Dataset.xlsx)
- 📑 **Excel Analytics Workbook:** [Download Manufacturing_Analytics.xlsx](Manufacturing_Analytics.xlsx)
- 📈 **Power BI Report:** [Download Manufacturing_Analytics.pbix](Manufacturing_Analytics.pbix)
- 📉 **Tableau Workbook:** [Download Manufacturing_Analytics.twbx](Manufacturing_Analytics.twbx)
- 🗄️ **SQL Script:** [View Manufacturing_Analytics.sql](Manufacturing_Analytics.sql)

---

## 📋 Project Scope

The project brings together manufacturing production data and dashboards for exploring operational performance. The available reports cover:

1. Manufactured, produced, and processed quantities.
2. Production trends over time.
3. Machine utilization and efficiency measures.
4. Operation, department, and item-category comparisons.
5. Delivery status and repeat-order measures.
6. Rejected and wasted quantities, with quality views by department, machine, employee, and item.
7. Filters for dimensions such as month, region, city, department, and operation.

---

## ⚙️ Implementation Summary

### 1. Data Model & SQL Analysis

The SQL script defines a production fact table and supporting dimensions for buyers, customers, employees, operations, machines, departments, items, and dates. It includes row-count queries and data checks for duplicate keys, nulls, blank text, and selected field values.

### 2. Excel Analysis

The Excel workbook provides interactive production and quality dashboards with KPI cards, charts, and slicers for exploring output, delivery, utilization, rejection, and wastage measures.

### 3. Power BI & Tableau Reporting

The Power BI and Tableau reports present production and quality views, including monthly trends, operation costs, department comparisons, delivery status, utilization, and rejected quantities.

---

## 📊 Dashboards & Visual Deliverables

### 1. Excel Production Dashboard

![Excel Production Dashboard](Excel%20Production%20Dashboard.jpeg)

### 2. Excel Quality Dashboard

![Excel Quality Dashboard](Excel%20Quality%20Dashboard.jpeg)

### 3. Power BI Production Dashboard

![Power BI Production Dashboard](Power%20BI%20Production%20Dashboard.png)

### 4. Power BI Quality Dashboard

![Power BI Quality Dashboard](Power%20BI%20Quality%20Dashboard.jpeg)

### 5. Tableau Production Dashboard

![Tableau Production Dashboard](Tableau%20Production%20Dashboard.jpeg)

### 6. Tableau Quality Dashboard

![Tableau Quality Dashboard](Tableau%20Quality%20Dashboard.jpeg)

---

## 🔍 Key Analysis Areas

- **Production performance:** Compare production quantities and monthly trends across departments and item categories.
- **Equipment performance:** Review machine utilization, efficiency, and operation-level average cost.
- **Delivery performance:** Explore early, late, and on-time delivery status.
- **Product quality:** Review rejected and wasted quantities and rejection or wastage measures across available dimensions.

KPI definitions and displayed values can vary by report. Confirm each measure's calculation and refresh the data connections before comparing results across tools.

---

## 🚀 Getting Started

1. Review `Manufacturing_Analytics.sql` and adapt the database setup and loading steps for your MySQL environment.
2. Load the source data from `Manufacturing_Dataset.xlsx` into the corresponding tables.
3. Open `Manufacturing_Analytics.xlsx` in Microsoft Excel.
4. Open `Manufacturing_Analytics.pbix` in Power BI Desktop or `Manufacturing_Analytics.twbx` in Tableau Desktop or Tableau Reader.

---

## 🏁 Conclusion

This project combines SQL-based data modeling and quality checks with Excel, Power BI, and Tableau dashboards. Together, the files provide multiple ways to explore production output, equipment utilization, delivery performance, operating cost, and product quality.
