# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Clone the repository
RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/EverythingSuckz/TG-FileStreamBot . && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up a virtual environment
RUN python -m venv venv

# Activate the virtual environment and install dependencies
RUN . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose the port the app runs on (adjust if necessary)
EXPOSE 8080

# Command to run the application
CMD ["venv/bin/python", "-m", "WebStreamer"]
