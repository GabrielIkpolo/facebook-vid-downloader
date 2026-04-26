# Project Plan: FB-Downloader

## 1. System Architecture
* **Frontend (Mobile):** Flutter (Dart)
    * *Role:* User Interface, URL input, Metadata display, Quality selection, and direct file downloading.
* **Backend (API):** Node.js (ES Modules)
    * *Role:* Orchestrating `yt-dlp`, extracting video metadata, and returning structured JSON to the mobile app.
* **Engine:** `yt-dlp` (running on the server).

## 2. Technical Stack
### **Backend (The Brain)**
* **Runtime:** Node.js (Latest LTS)
* **Framework:** Express.js (using ES Modules)
* **Logic:** `child_process` to execute `yt-dlp`
* **Security:** `dompurify` or regex-based URL validation to prevent Command Injection.

### **Frontend (The Face)**
* **Framework:** Flutter
* **State Management:** `Riverpod` (Modern, testable, and handles async data perfectly).
* **Networking:** `Dio` (For API calls and handling large file downloads with progress).
* **Storage:** `path_provider` & `permission_handler`.
* **Local Database:** `Isar` or `sqflite` (to store download history).

## 3. Development Phases

### **Phase 1: Backend Foundation (The "Extractor" API)**
1. Initialize Node.js project with `"type": "module"`.
2. Implement the `/extract` endpoint.
3. Implement strict URL validation (Crucial for security).
4. Test with various Facebook video types (Reels, Watch, Profile videos).

### **Phase 2: Flutter Core (The "UI & Connectivity")**
1. Setup Flutter project architecture (Feature-first folder structure).
2. Create the `ApiService` using `Dio` to talk to the Node.js backend.
3. Build the "Home" screen (URL input + Loading states).
4. Build the "Selection" screen (Displaying thumbnail, title, and quality options).

### **Phase 3: The Download Engine (The "Heavy Lifting")**
1. Implement the background download logic using `Dio`.
2. Implement real-time progress tracking (percentage/MBs).
3. Handle Android/iOS file system permissions and saving to the Gallery/Downloads folder.

### **Phase 4: Polishing & History**
1. Implement the "Downloads History" tab within the app to view completed and failed downloads.
2. Add Dark Mode support.
3. Add Share Integration.

## 4. Security Strategy (Crucial)
Because we are passing a string from a mobile user directly to a terminal command (`yt-dlp`), we are at risk of **Command Injection**.
* **Rule:** We will never pass the raw string. We will validate that the string starts with `https://facebook.com` or `https://www.facebook.com` and contains no special shell characters (like `;`, `&`, `|`, `$`, etc.) before passing it to `exec`.

## 5. Potential Challenges & Risks
1. **Legal/Policy Risks:** Both Google Play Store and Apple App Store have strict policies regarding "Copyright Infringement." To get approved, the app must be marketed as a "Video Manager" or "Social Media Tool" and should include a disclaimer that users must only download content they have permission for.
2. **Facebook Updates:** Facebook frequently changes its code to prevent scraping. This means your backend (`yt-dlp`) will need frequent updates.
3. **Storage Permissions:** Android 11+ (Scoped Storage) and iOS privacy settings make saving files to public folders more complex. You will need to handle `permission_handler` carefully.
