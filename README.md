# RehabTrack Backend Assignment

This project is a lightweight backend system for RehabTrack.

## Tech Stack
- PostgreSQL
- FastAPI
- Docker Compose

## Project Structure
- `db/schema.sql` → database schema
- `db/seed.sql` → seed/sample data
- `db/queries.sql` → analytical SQL queries
- `app/main.py` → FastAPI health check API

## How to Run

1. Copy `.env.example` to `.env`
2. Run:

```bash
docker compose up --build