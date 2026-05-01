# FB-Downloader Project

A professional, high-performance video downloader application that allows users to download videos from Facebook (including Reels and Watch) directly to their devices. This project features a modern Flutter frontend with Riverpod state management and a robust Node.js backend powered by `yt-dlp`.

## 🚀 Features

* **High Quality Downloads:** Automatically prioritizes combined video + audio streams for the best user experience.
* **Real-time Progress:** Smooth progress tracking during downloads using Dio.
* **Download History:** A dedicated history tab to view all past, completed, and failed downloads (powered by SQLite).
* **Modern UI:** Beautiful Material 3 design with Dark Mode support.
* **Cross-Platform Ready:** Optimized for Android, iOS, and Desktop (Windows/Linux/macOS) using `sqflite_common_ffi`.
* **Secure Backend:** Robust URL validation to prevent command injection attacks when interacting with the `yt-dlp` engine.

---

## 🏗️ System Architecture

The project is divided into two main components:

### 1. **Backend (API & Engine)**
*   **Runtime:** Node.js (ES Modules)
*   **Framework:** Express.js
*   **Core Engine:** `yt-dlp` for metadata extraction and orchestration.
*   **Functionality:** Provides a `/extract` endpoint that returns structured JSON containing video titles, thumbnails, and available format options.

### 2. **Frontend (Mobile & Desktop App)**
*   **Framework:** Flutter (Dart)
*   **State Management:** Riverpod (for reactive UI and async data handling).
*   **Networking:** Dio (handles API requests and large file downloads with progress updates).
*   **Local Storage:** `sqflite` for download history.

---

## 🛠️ Setup & Installation

### **Prerequisites**
- [Node.js](https://nodejs.org/) (Latest LTS)
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- `yt-dlp` installed on your system path.

### **Backend Setup**
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the server:
   ```bash
   node server.js
   ```
The API will be running at `http://localhost:3000`.

### **Frontend Setup**
1. Navigate to the Flutter directory:
   ```bash
   cd facebook_vid_downloader
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. (Optional) Generate code for Freezed/Riverpod:
   ```bash
   flutter pub run build_runner build --delete-facing-files
   ```
4. Run the application:
   ```bash
   flutter run
   ```

---

## 🛡️ Security Note
The backend implements strict regex validation and character blacklisting to ensure that only valid Facebook URLs are processed, protecting against shell command injection when executing `yt-dlp`.

## 📄 License
This project is for educational purposes. Please respect copyright laws and terms of service of the platforms you use.
