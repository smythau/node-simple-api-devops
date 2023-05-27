# Base image
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# Set metadata
LABEL maintainer="Austin Smyth <smythau@tcd.ie>"
LABEL description="This is a sample node.js api."

# Install Node.js and npm
RUN microdnf update && \
    microdnf install -y nodejs npm && \
    microdnf clean all

# Set working directory
WORKDIR /app

# Copy application files
COPY /node-simple-api/ .

# Install dependencies or run custom commands if needed
# RUN command1
# RUN command2

# Expose a port if the application requires it
EXPOSE 8080

# Set environment variables if necessary
# ENV ENV_VAR_NAME=value

# Define the command to run when the container starts
CMD ["npm", "start"]