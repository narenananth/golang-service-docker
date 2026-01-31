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
