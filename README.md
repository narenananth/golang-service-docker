# golang-service-docker

Very simple Golang web service running in Docker.

## What it does

- Starts a web server on port 8080.
- `GET /` returns a hello message.
- `GET /health` returns "OK".

## How to run with Docker

```bash
# build the image
docker build -t golang-service-docker .

# run the container
docker run -p 8080:8080 golang-service-docker

# test it
curl http://localhost:8080/
curl http://localhost:8080/health


3. Commit.

**Repo 1 done.**  

***

## Repo 2: `postgres-tools`  
Pure shell scripts for Postgres backups + health check. Very simple.

### A. Create the repo

1. GitHub → **+ → New repository**  
2. Name: `postgres-tools`  
3. Description: `Simple Postgres backup and healthcheck scripts`  
4. Public, add README → **Create**

***

### B. Backup script

1. **Add file → Create new file**  
2. File name: `backup.sh`  
3. Paste:

```bash
#!/usr/bin/env bash

# Very simple Postgres backup script

DB_NAME="postgres"      # change if needed
DB_USER="postgres"      # change if needed
DB_HOST="localhost"     # or container name
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p "$BACKUP_DIR"

FILE_NAME="$BACKUP_DIR/${DB_NAME}_backup_${TIMESTAMP}.sql"

echo "Creating backup: $FILE_NAME"

PGPASSWORD="${PGPASSWORD:-postgres}" pg_dump \
  -h "$DB_HOST" \
  -U "$DB_USER" \
  "$DB_NAME" > "$FILE_NAME"

if [ $? -eq 0 ]; then
  echo "Backup completed successfully."
else
  echo "Backup failed."
  rm -f "$FILE_NAME"
fi
