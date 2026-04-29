# Backend Dockerfile

This Dockerfile builds a containerized Node.js environment to run the FB-Downloader backend. It includes `yt-dlp` and its dependencies.

## Prerequisites
* Docker installed on your machine.

## How to Build and Run

1.  **Build the image:**
    ```bash
    docker build -t fb-downloader-backend .
    ```

2.  **Run the container:**
    ```bash
    docker run -p 3000:3000 fb-downloader-backend
    ```

The server will be available at `http://localhost:3000`.
