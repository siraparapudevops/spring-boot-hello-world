# Use the official Python image as the base image
FROM python:3.8-slim

# Install system packages (vim, netstat, nginx, wget)
RUN apt-get update && \
    apt-get install -y vim net-tools nginx wget && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the Flask app code into the container
COPY app app

# Expose the port that the Flask app will run on
EXPOSE 5000

# Start Nginx
CMD service nginx start && python -m app.run
