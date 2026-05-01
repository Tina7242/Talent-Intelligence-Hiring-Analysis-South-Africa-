# 📊 Talent Intelligence Hiring Analysis (South Africa)

## 📌 Project Overview
This project simulates a Talent Intelligence analysis to support hiring Data Analysts in South Africa. The goal is to evaluate talent availability, salary expectations, and hiring challenges using SQL and data visualisation.

---

## 🧠 Business Problem
A company needs to hire **15 Data Analysts within 6 months**.

Key questions:
- Where should we hire from?
- Are salaries competitive?
- Do we have access to the right skills?
- What risks could slow down hiring?

---

## ❓ Key Business Questions & SQL Analysis

### 1. Where is talent supply vs demand most imbalanced?

```sql
SELECT
  location,
  COUNT(*) AS total_candidates,
  ROUND(AVG(hiring_demand_score), 1) AS avg_demand,
  ROUND(AVG(talent_availability_score), 1) AS avg_supply,
  ROUND(AVG(hiring_demand_score - talent_availability_score), 1) AS demand_supply_gap
FROM `talent_candidates.candidates`
GROUP BY location
ORDER BY demand_supply_gap DESC;
