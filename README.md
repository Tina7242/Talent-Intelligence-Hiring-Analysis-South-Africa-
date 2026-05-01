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
Are salary expectations aligned with market rates?
SELECT
  location,
  ROUND(AVG(current_salary_zar), 0) AS avg_current_salary,
  ROUND(AVG(expected_salary_zar), 0) AS avg_expected_salary,
  ROUND(AVG(expected_salary_zar - current_salary_zar), 0) AS salary_gap,
  ROUND(AVG((expected_salary_zar - current_salary_zar) / current_salary_zar) * 100, 1) AS percent_gap
FROM `project_id.dataset.talent_candidates_clean`
GROUP BY location
ORDER BY percent_gap DESC;
