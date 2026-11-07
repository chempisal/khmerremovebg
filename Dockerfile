# Dockerfile for AI RemoveBG Studio
FROM python:3.11-slim

# Install system dependencies for OpenCV and image operations
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Pre-download models during docker build so container starts instantly
RUN mkdir -p models && \
    curl -L "https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2netp.onnx" -o models/u2netp.onnx && \
    curl -L "https://github.com/danielgatis/rembg/releases/download/v0.0.0/isnet-general-use.onnx" -o models/isnet-general-use.onnx

ENV PORT=5000
ENV HOST=0.0.0.0
ENV NO_BROWSER=true

EXPOSE 5000

# Production WSGI server with gunicorn
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:${PORT:-5000} --workers 2 --timeout 180 --access-logfile - app:app"]

