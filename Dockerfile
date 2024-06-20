# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV SECRET_KEY  ${{ secrets.SECRET_KEY }}
ENV POSTGRES_DB ${{ secrets.POSTGRES_DB }}
ENV POSTGRES_USER ${{ secrets.POSTGRES_USER }}
ENV POSTGRES_PASSWORD ${{ secrets.POSTGRES_PASSWORD }}
ENV DATABASE_URL ${{ secrets.DATABASE_URL }}

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
        gcc \
        libc-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /code

# Copy the requirements file into the container
COPY requirements.txt /code/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /code/

# Expose port 8000 to the outside world
EXPOSE 8000

# Command to run the application
CMD ["uwsgi", "--ini", "/code/polls/uwsgi.ini"]
