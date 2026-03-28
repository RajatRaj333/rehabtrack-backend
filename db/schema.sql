
CREATE TABLE users
(
  user_id VARCHAR(20) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'data_entry', 'viewer')),
  description TEXT
);


CREATE TABLE patients
(
  patient_id VARCHAR(20) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT,
  gender VARCHAR(20),
  diagnosis VARCHAR(200),
  location VARCHAR(100),
  created_by VARCHAR
(20) NOT NULL REFERENCES users
(user_id),
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE assessments
(
  assessment_id SERIAL PRIMARY KEY,
  patient_id VARCHAR(20) REFERENCES patients(patient_id),
  assessment_tool VARCHAR(100) NOT NULL,
  score INT NOT NULL,
  max_score INT NOT NULL,
  administration_date DATE NOT NULL,
 created_by VARCHAR
(20) NOT NULL REFERENCES users
(user_id),
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE therapy_sessions
(
  session_id SERIAL PRIMARY KEY,
  patient_id VARCHAR(20) REFERENCES patients(patient_id),
  department VARCHAR(100) CHECK (department IN ('Neuromodulation', 'Physiotherapy', 'Cognitive Rehab')),
  therapist_name VARCHAR(100),
  session_date DATE NOT NULL,
  notes TEXT,
 created_by VARCHAR
(20) NOT NULL REFERENCES users
(user_id),
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE INDEX idx_assessments_patient ON assessments(patient_id);
CREATE INDEX idx_sessions_patient ON therapy_sessions(patient_id);
CREATE INDEX idx_sessions_department ON therapy_sessions(department);