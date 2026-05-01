# Use a slim Node.js image as base
FROM node:20-slim

# Install system dependencies: ffmpeg, python3, curl, and ca-certificates 
# (yt-dlp needs python/curl; ffmpeg is needed for merging audio/video)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install yt-dlp globally using curl
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp \
    && chmod a+rx /usr/local/bin/yt-dlp

# Set the working directory inside the container
WORKDIR /app

# Copy package files first to leverage Docker cache for npm install
COPY package*.json ./

# Install production dependencies only (to keep image small)
RUN npm ci --omit=dev

# Copy the rest of your application code
COPY . .

# Expose the port the app runs on (matches backend/server.js default)
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]
