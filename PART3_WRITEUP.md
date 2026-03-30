
## 1. If queries on the `therapy_sessions` table become slower as data grows, what would I investigate first and what would I do?

- First, I would inspect the slow query using `EXPLAIN ANALYZE` to see whether PostgreSQL is using indexes or falling back to sequential scans.
- I would verify that the existing indexes on `patient_id` and `department` are actually helping the query patterns being used.
- If the slowdown is caused by frequent filtering on dates, I would consider adding an index on `session_date`.
- If data grows much larger over time, I would also review query patterns and consider partitioning or archiving older session data.

## 2. If a `data_entry` user accidentally deleted a patient record, what in the current schema would help recover or prevent it, and what would I add?

- In the current schema, foreign keys help maintain relational consistency, but they do not help recover deleted records.
- If a patient record is hard-deleted, related assessment and therapy data can also become a problem depending on delete behavior.
- To prevent this, I would prefer soft deletes using fields like `is_deleted` and `deleted_at` instead of permanent deletion.
- I would also restrict delete permissions so that `data_entry` users cannot permanently delete patient records.
- For recovery, I would rely on regular backups and audit logging.

## 3. If 10 clinic staff needed to use this system simultaneously, what is the first thing you would change in the current setup, and why?

- First, I would make sure the API and database are prepared for concurrent usage instead of assuming a single-user local setup.
- I would improve connection handling so multiple requests do not create unmanaged database connections.
- I would also keep configuration environment-based and ensure the database uses persistent storage reliably.
- This is the first change I would make because once multiple staff use the system together, concurrency and connection handling become more important than local development simplicity.