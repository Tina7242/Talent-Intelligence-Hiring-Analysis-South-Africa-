# 📊 Talent Intelligence Hiring Analysis (South Africa)

## 📌 Project Overview

This project simulates a Talent Intelligence analysis to support hiring Data Analysts in South Africa. The goal is to evaluate talent availability, salary expectations, and hiring challenges using SQL and data visualisation.

---

##  Business Problem

A company needs to hire **15 Data Analysts within 6 months**.

Key questions:

* Where should we hire from?
* Are salaries competitive?
* Do we have access to the right skills?
* What risks could slow down hiring?

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
```

**Insight:**
Cape Town shows a higher demand than supply, indicating a more competitive hiring market.

---

### 2. Are salary expectations aligned with market rates?

```sql
SELECT
  location,
  ROUND(AVG(current_salary_zar), 0) AS avg_current_salary,
  ROUND(AVG(expected_salary_zar), 0) AS avg_expected_salary,
  ROUND(AVG(expected_salary_zar - current_salary_zar), 0) AS salary_gap,
  ROUND(AVG((expected_salary_zar - current_salary_zar) / current_salary_zar) * 100, 1) AS percent_gap
FROM `talent_candidates.candidates`
GROUP BY location
ORDER BY percent_gap DESC;
```

**Insight:**
Candidates expect approximately 15–20% higher salaries than their current compensation.

---

### 3. What skills are most common vs scarce?

```sql
SELECT
  skill,
  COUNT(*) AS skill_count
FROM `talent_candidates.candidates`,
UNNEST(SPLIT(skills, ', ')) AS skill
GROUP BY skill
ORDER BY skill_count DESC;
```

**Insight:**
SQL and Excel are widely available, while Python is less common, indicating a potential skills gap.

---

### 4. What is the experience distribution of candidates?

```sql
SELECT
  CASE
    WHEN years_experience BETWEEN 1 AND 2 THEN 'Junior'
    WHEN years_experience BETWEEN 3 AND 5 THEN 'Mid-Level'
    ELSE 'Senior'
  END AS experience_level,
  COUNT(*) AS candidate_count
FROM `talent_candidates.candidates`
GROUP BY experience_level
ORDER BY candidate_count DESC;
```

**Insight:**
The talent pool is concentrated in mid-level candidates.

---

### 5. Which locations are best for hiring Data Analysts?

```sql
SELECT
  location,
  COUNT(*) AS total_candidates
FROM `talent_candidates.candidates`
WHERE job_title = 'Data Analyst'
GROUP BY location
ORDER BY total_candidates DESC;
```

**Insight:**
Johannesburg and remote talent pools provide access to more candidates.

---

### 6. Where are the highest hiring risks?

```sql
SELECT
  location,
  ROUND(AVG(hiring_demand_score),1) AS demand,
  ROUND(AVG(talent_availability_score),1) AS supply,
  ROUND(AVG(hiring_demand_score - talent_availability_score),1) AS gap
FROM `talent_candidates.candidates`
GROUP BY location
HAVING gap > 10
ORDER BY gap DESC;
```

**Insight:**
Locations with high demand and low supply represent higher hiring risk.

---

##  Key Recommendations

* Expand hiring beyond Cape Town
* Adjust salary bands to match expectations
* Focus sourcing on Python-skilled candidates
* Improve hiring process efficiency
* Consider remote hiring strategies

---

##  Tools Used

* SQL (BigQuery)
* Excel
* Tableau

---

## ⚠️ Disclaimer

This is a simulated dataset created for portfolio purposes to demonstrate talent intelligence and analytics skills.

---

## Author

Tina Siyengo

