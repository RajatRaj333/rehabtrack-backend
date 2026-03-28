INSERT INTO users
  (user_id, name, email, role, description)
VALUES
  ('U-001', 'Admin User', 'admin@rehabtrack.local', 'admin', 'Full access — can create, edit, delete all records'),
  ('U-002', 'Riya Thomas', 'riya@rehabtrack.local', 'data_entry', 'Can create and edit patient and assessment records'),
  ('U-003', 'Viewer Account', 'viewer@rehabtrack.local', 'viewer', 'Read-only access across all data');

INSERT INTO patients
  (patient_id, name, age, gender, diagnosis, location, created_by)
VALUES
  ('PT-001', 'Arjun Mehta', 68, 'Male', 'Parkinson''s Disease', 'Branch A', 'U-002'),
  ('PT-002', 'Sunita Rao', 72, 'Female', 'Alzheimer''s (Early)', 'Branch B', 'U-002'),
  ('PT-003', 'David Fernandez', 55, 'Male', 'Post-Stroke Rehab', 'Branch A', 'U-002'),
  ('PT-004', 'Meena Krishnan', 61, 'Female', 'Depression + MCI', 'Branch C', 'U-002'),
  ('PT-005', 'Rajan Pillai', 79, 'Male', 'Vascular Dementia', 'Branch B', 'U-002');


INSERT INTO assessments
  (patient_id, assessment_tool, score, max_score, administration_date, created_by)
VALUES
  ('PT-001', 'MoCA', 24, 30, '2024-01-10', 'U-002'),
  ('PT-001', 'MMSE', 27, 30, '2024-01-10', 'U-002'),
  ('PT-001', 'HAM-D', 18, 52, '2024-01-12', 'U-002'),
  ('PT-001', 'PHQ-9', 12, 27, '2024-01-12', 'U-002'),
  ('PT-001', 'Berg Balance', 42, 56, '2024-01-14', 'U-002'),
  ('PT-002', 'MoCA', 19, 30, '2024-01-15', 'U-002'),
  ('PT-002', 'MMSE', 22, 30, '2024-01-15', 'U-002'),
  ('PT-002', 'HAM-D', 22, 52, '2024-01-16', 'U-002'),
  ('PT-002', 'Berg Balance', 38, 56, '2024-01-17', 'U-002'),
  ('PT-002', 'Grip Strength (kg)', 18, 60, '2024-01-17', 'U-002'),
  ('PT-003', 'MoCA', 28, 30, '2024-02-01', 'U-002'),
  ('PT-003', 'PHQ-9', 6, 27, '2024-02-01', 'U-002'),
  ('PT-003', 'Grip Strength (kg)', 32, 60, '2024-02-03', 'U-002'),
  ('PT-004', 'MMSE', 20, 30, '2024-02-10', 'U-002'),
  ('PT-004', 'HAM-D', 14, 52, '2024-02-10', 'U-002'),
  ('PT-004', 'Berg Balance', 50, 56, '2024-02-12', 'U-002'),
  ('PT-005', 'MoCA', 16, 30, '2024-02-20', 'U-002'),
  ('PT-005', 'MMSE', 18, 30, '2024-02-20', 'U-002'),
  ('PT-005', 'HAM-D', 26, 52, '2024-02-21', 'U-002'),
  ('PT-005', 'PHQ-9', 18, 27, '2024-02-21', 'U-002'),
  ('PT-005', 'Grip Strength (kg)', 14, 60, '2024-02-22', 'U-002');


INSERT INTO therapy_sessions
  (patient_id, department, therapist_name, session_date, notes, created_by)
VALUES
  ('PT-001', 'Neuromodulation', 'Dr. Anand', '2024-01-11', 'tDCS session 1, tolerated well', 'U-002'),
  ('PT-001', 'Physiotherapy', 'Ms. Priya', '2024-01-13', 'Gait training, 30 mins', 'U-002'),
  ('PT-001', 'Physiotherapy', 'Ms. Priya', '2024-01-20', 'Balance exercises added', 'U-002'),
  ('PT-001', 'Neuromodulation', 'Dr. Anand', '2024-01-25', 'tDCS session 2', 'U-002'),
  ('PT-002', 'Cognitive Rehab', 'Ms. Kavitha', '2024-01-18', 'Memory exercises, baseline set', 'U-002'),
  ('PT-002', 'Physiotherapy', 'Mr. Suresh', '2024-01-19', 'Upper limb strengthening', 'U-002'),
  ('PT-002', 'Cognitive Rehab', 'Ms. Kavitha', '2024-01-26', 'Attention training added', 'U-002'),
  ('PT-003', 'Physiotherapy', 'Ms. Priya', '2024-02-05', 'Gait retraining post-stroke', 'U-002'),
  ('PT-003', 'Physiotherapy', 'Ms. Priya', '2024-02-12', 'Functional task training', 'U-002'),
  ('PT-004', 'Neuromodulation', 'Dr. Anand', '2024-02-14', 'rTMS session 1', 'U-002'),
  ('PT-004', 'Cognitive Rehab', 'Ms. Kavitha', '2024-02-15', 'Mood journaling introduced', 'U-002'),
  ('PT-005', 'Cognitive Rehab', 'Ms. Kavitha', '2024-02-22', 'Orientation exercises', 'U-002'),
  ('PT-005', 'Physiotherapy', 'Mr. Suresh', '2024-02-23', 'Seated strength training', 'U-002');