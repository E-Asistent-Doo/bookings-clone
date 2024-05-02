# Use golang as the base image for building
FROM golang:1.21.6-alpine as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files
COPY go.mod .
COPY go.sum .

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /docker-gs-ping cmd/web/*.go

# Use alpine as the base image for the final stage
FROM alpine:latest

# Install CA certificates
RUN apk --no-cache add ca-certificates

# Set the working directory
WORKDIR /app

# Copy the built binary from the previous stage
COPY --from=builder /docker-gs-ping .
COPY --from=builder /app/email-templates ./email-templates
COPY --from=builder /app/templates ./templates
COPY --from=builder /app/static ./static


# Make the binary executable
RUN chmod +x ./docker-gs-ping

# Health check for PostgreSQL
HEALTHCHECK CMD pg_isready -h postgres -U postgres

# Run the application with command-line parameters
CMD ["./docker-gs-ping", "-cache=true", "-production=true", "-dbhost=db", "-mailhog-host=mailhog"]
