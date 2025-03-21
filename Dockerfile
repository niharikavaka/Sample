# Use official Python 3.8 image as the base image
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies for Playwright and utilities
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    libgtk-3-0 libdbus-1-3 libgbm-dev \
    libnss3 \
    libnspr4 \
    libasound2 \
    && apt-get clean

# Copy the requirements file to the container
COPY requirements.txt .

# Install Python dependencies (Playwright and Allure)
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m playwright install
RUN pip install allure-pytest

# Copy the rest of the code into the container
COPY . .

# Set the default command to run the tests
CMD ["pytest", "test_elements.py"]
