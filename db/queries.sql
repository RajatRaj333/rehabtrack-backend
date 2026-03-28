-- Query 1: List all patients who have had more than 2 therapy sessions, along with their session count.
-- How it works: We join the patients and therapy_sessions tables, count the sessions per patient, 
-- and use HAVING to filter only those with more than 2.
SELECT
  p.patient_id,
  p.name,
  COUNT(ts.session_id) AS session_count
FROM patients p
  JOIN therapy_sessions ts ON p.patient_id = ts.patient_id
GROUP BY p.patient_id, p.name
HAVING COUNT(ts.session_id) > 2;

-- Query 2: For each department, show the average assessment score as a percentage of max score across all patients seen in that department.
-- How it works: First, we find out which patients went to which departments using a CTE (WITH clause). 
-- Then we join that to their assessments, calculate the percentage (score / max_score * 100), and find the average.
WITH
  PatientDepartments
  AS
  (
    SELECT DISTINCT patient_id, department
    FROM therapy_sessions
  )
SELECT
  pd.department,
  ROUND(AVG(CAST(a.score AS NUMERIC) / a.max_score * 100), 2) AS avg_score_percentage
FROM PatientDepartments pd
  JOIN assessments a ON pd.patient_id = a.patient_id
GROUP BY pd.department;

-- Query 3: Find any patients who have at least one assessment on record but no therapy sessions at all.
-- How it works: We use a LEFT JOIN on therapy_sessions. If a patient has no sessions, 
-- the ts.session_id will be NULL, which is exactly what we filter for in the WHERE clause.
SELECT DISTINCT
  p.patient_id,
  p.name
FROM patients p
  JOIN assessments a ON p.patient_id = a.patient_id
  LEFT JOIN therapy_sessions ts ON p.patient_id = ts.patient_id
WHERE ts.session_id IS NULL;