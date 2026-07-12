# 🏦 Bank Customer Churn Analysis

![MySQL](https://img.shields.io/badge/MySQL-8.0-orange?logo=mysql)
![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)
![SQL](https://img.shields.io/badge/SQL-EDA-blue)
![Status](https://img.shields.io/badge/Status-Completed-green)

---

## 📌 Project Overview

Customer retention is one of the most critical challenges in the banking industry. Acquiring new customers costs significantly more than retaining existing ones. This project performs a complete **Exploratory Data Analysis (EDA) using SQL** on bank customer data to identify churn patterns, high-risk segments, and provide actionable business recommendations.

The findings are visualized through an interactive **Power BI Dashboard** for business stakeholders.

---

## 🎯 Business Questions Answered

- 📊 What is the overall customer churn rate?
- 👥 Does **gender** influence churn behavior?
- 🌍 Does **geography** affect churn rate?
- 🎂 Which **age group** is most likely to leave?
- 💰 Does **account balance** influence churn?
- 📦 Does the **number of products** affect loyalty?
- ⚡ Do **inactive members** churn more than active ones?
- 🚨 Which customer segment is the **highest risk?**

---

## 📊 Dataset

| Property | Details |
|---|---|
| Source | Bank Customer Churn Prediction Dataset |
| Total Records | 10,000 customers |
| Target Variable | Churn (1 = Left, 0 = Stayed) |
| Features | 12 columns |

### Key Columns:
| Column | Description |
|---|---|
| `customer_id` | Unique customer identifier |
| `credit_score` | Customer's credit score |
| `country` | France / Spain / Germany |
| `gender` | Male / Female |
| `age` | Customer age |
| `tenure` | Years with the bank |
| `balance` | Account balance |
| `products_number` | Number of bank products used |
| `credit_card` | Has credit card (1/0) |
| `active_member` | Active customer (1/0) |
| `estimated_salary` | Customer's estimated salary |
| `churn` | **Target: Left bank (1) / Stayed (0)** |

---

## 🔍 Key Findings

### 📊 Overall Churn Rate
| Metric | Value |
|---|---|
| Total Customers | 10,000 |
| Churned Customers | 2,037 |
| **Churn Rate** | **20.37%** |

> 💡 **1 out of every 5 customers is leaving the bank!**

---

### 👥 Churn by Gender
| Gender | Churn Rate |
|---|---|
| Female | 25.07% 🔴 |
| Male | 16.46% 🟢 |

> 💡 **Female customers are significantly more likely to leave!**

---

### 🌍 Churn by Country
| Country | Churn Rate |
|---|---|
| Germany | 32.44% 🔴 |
| Spain | 16.67% 🟢 |
| France | 16.15% 🟢 |

> 💡 **Germany has DOUBLE the churn rate of France and Spain!**

---

### 🎂 Churn by Age Group
| Age Group | Churn Rate |
|---|---|
| 51-60 | 56.21% 🔴 |
| 41-50 | 33.97% 🟡 |
| 60+ | 24.78% 🟡 |
| 31-40 | 12.09% 🟢 |
| 18-30 | 7.52% 🟢 |

> 💡 **Churn peaks in the 51-60 age group!**

---

### ⚡ Churn by Activity Status
| Status | Churn Rate |
|---|---|
| Inactive | 26.85% 🔴 |
| Active | 14.27% 🟢 |

> 💡 **Inactive customers are TWICE as likely to churn!**

---

### 📦 Churn by Number of Products
| Products | Churn Rate |
|---|---|
| 4 products | 100.00% 🔴 |
| 3 products | 82.71% 🔴 |
| 1 product | 27.71% 🟡 |
| 2 products | 7.58% 🟢 |

> 💡 **2 products = sweet spot for customer loyalty!**

---

### 🚨 Highest Risk Segment
**Inactive customers aged 51-60 have an 85.71% churn rate** — the most critical segment identified in the entire analysis!

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL 8.0 | Data Analysis & EDA |
| SQL (CASE WHEN, GROUP BY, AVG, SUM) | Query Writing |
| Power BI | Interactive Dashboard |
| Excel/CSV | Data Storage |

---

## 📁 Project Structure

```
bank-churn-analysis/
│
├── 📊 Bank Customer Churn Prediction.csv    ← Dataset
├── 🔍 Churn.sql                             ← All SQL EDA queries
├── 📈 Bank_churn_Analysis.pbix              ← Power BI Dashboard
├── 📄 Bank Customer Churn Analysis.docx    ← Detailed Documentation
└── 📋 README.md                             ← Project Documentation
```

---

## 🚀 How to Run SQL Queries

1. Install **MySQL** and **MySQL Workbench**
2. Open MySQL Workbench and connect
3. Open `Churn.sql` file
4. Run queries section by section

---

## 📈 Power BI Dashboard

The Power BI dashboard (`Bank_churn_Analysis.pbix`) includes:
- Overall KPI cards (Total Customers, Churn Rate)
- Churn by Geography map
- Churn by Age Group chart
- Churn by Gender breakdown
- Active vs Inactive member analysis
- High Risk segment identification

> **Requires Power BI Desktop to open** (free download from Microsoft)

---

## 💡 Business Recommendations

| Priority | Action |
|---|---|
| 🔴 Immediate | Launch re-engagement campaigns for inactive customers aged 51-60 |
| 🔴 Immediate | Investigate and address Germany-specific churn factors |
| 🟡 Short-term | Create targeted retention programs for female customers |
| 🟡 Short-term | Encourage customers to use 2 products (sweet spot) |
| 🟢 Long-term | Build churn prediction model for early warning system |
| 🟢 Long-term | Implement personalized retention programs by segment |

---

## 👨‍💻 About Me

**Prateek Sharma**
NOC Engineer @ Reliance Jio | Transitioning to Data Analytics
📧 prateeksharma8764@gmail.com
🐙 GitHub: [Beleiver7](https://github.com/Beleiver7)

---

## ⭐ If you found this project helpful, please give it a star!
