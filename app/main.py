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
       
        
        conn = psycopg2.connect(
            host=os.environ.get("DB_HOST", "localhost"),
            database=os.environ.get("DB_NAME", "rehabtrack"),
            user=os.environ.get("DB_USER", "postgres"),
            password=os.environ.get("DB_PASSWORD", "postgres")
        )
        
        conn.close()
        return {"status": "ok", "db": "connected"}
        
    except Exception as e:
        
        raise HTTPException(status_code=500, detail=f"Database connection failed: {str(e)}")