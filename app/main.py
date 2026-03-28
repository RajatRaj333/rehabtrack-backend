import os
import psycopg2
from fastapi import FastAPI, HTTPException

app = FastAPI()

@app.get("/health")
def health_check():
    """
    Health check endpoint that verifies the database connection.
    """
    try:
        # Connect to the database using environment variables
        # If the variables aren't found, it falls back to default values
        conn = psycopg2.connect(
            host=os.environ.get("DB_HOST", "localhost"),
            database=os.environ.get("DB_NAME", "rehabtrack"),
            user=os.environ.get("DB_USER", "postgres"),
            password=os.environ.get("DB_PASSWORD", "postgres")
        )
        # If connection is successful, close it and return the required JSON
        conn.close()
        return {"status": "ok", "db": "connected"}
        
    except Exception as e:
        # If the database isn't ready or credentials fail, return an error
        raise HTTPException(status_code=500, detail=f"Database connection failed: {str(e)}")