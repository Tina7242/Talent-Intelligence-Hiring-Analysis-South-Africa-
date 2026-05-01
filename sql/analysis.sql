-- =========================================
-- Talent Intelligence SQL Analysis
-- =========================================

-- 1. Talent Supply vs Demand
SELECT
  location,
  COUNT(*) AS total_candidates,
  ROUND(AVG(hiring_demand_score), 1) AS avg_demand,
  ROUND(AVG(talent_availability_score), 1) AS avg_supply,
  ROUND(AVG(hiring_demand_score - talent_availability_score), 1) AS demand_supply_gap
FROM `talent_candidates.candidates`
GROUP BY location
ORDER BY demand_supply_gap DESC;

-- 2. Salary Benchmarking
SELECT
  location,
  ROUND(AVG(current_salary_zar), 0) AS avg_current_salary,
  ROUND(AVG(expected_salary_zar), 0) AS avg_expected_salary,
  ROUND(AVG(expected_salary_zar - current_salary_zar), 0) AS salary_gap,
  ROUND(AVG((expected_salary_zar - current_salary_zar) / current_salary_zar) * 100, 1) AS percent_gap
FROM `talent_candidates.candidates`
GROUP BY location
ORDER BY percent_gap DESC;

-- 3. Skills Distribution

SELECT
  skill,
  COUNT(*) AS skill_count
FROM `talent_candidates.candidates`,
UNNEST(SPLIT(skills, ', ')) AS skill
GROUP BY skill
ORDER BY skill_count DESC;

-- 4. Experience Segmentation

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

-- 5. Role by Location

SELECT
  location,
  COUNT(*) AS total_candidates
FROM `talent_candidates.candidates`
WHERE job_title = 'Data Analyst'
GROUP BY location
ORDER BY total_candidates DESC;
