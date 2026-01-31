# Step 1: build the Go app
FROM golang:1.22-alpine AS builder

WORKDIR /app
COPY . .

RUN go build -o server main.go

# Step 2: run the app in a small image
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/server .

EXPOSE 8080

CMD ["./server"]
