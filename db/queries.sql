
SELECT
  p.patient_id,
  p.name,
  COUNT(ts.session_id) AS session_count
FROM patients p
  JOIN therapy_sessions ts 
    ON p.patient_id = ts.patient_id
GROUP BY p.patient_id, p.name
HAVING COUNT(ts.session_id) > 2;


WITH
  PatientDepartments AS (
    SELECT DISTINCT patient_id, department
    FROM therapy_sessions
  )
SELECT
  pd.department,
  ROUND(AVG(CAST(a.score AS NUMERIC) / a.max_score * 100), 2) AS avg_score_percentage
FROM PatientDepartments pd
  JOIN assessments a 
    ON pd.patient_id = a.patient_id
GROUP BY pd.department;


SELECT DISTINCT
  p.patient_id,
  p.name
FROM patients p
  JOIN assessments a 
    ON p.patient_id = a.patient_id
  LEFT JOIN therapy_sessions ts 
    ON p.patient_id = ts.patient_id
WHERE ts.session_id IS NULL;