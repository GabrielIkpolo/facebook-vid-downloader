# FB-Downloader Project TODO

## 🟢 Phase 1: Backend Development (Node.js + ES Modules)
- [x] Initialize Node.js project with `"type": "module"`
- [x] Install dependencies (`express`, `cors`, `dotenv`)
- [x] Create `server.js` with modern `import` syntax
- [x] Implement `/extract` endpoint with `yt-dlp --dump-json`
- [x] **SECURITY:** Implement strict URL sanitization/validation
- [x] Test API with `curl` and various FB links

## 🔵 Phase 2: Flutter Frontend (UI & API Integration)
- [x] Initialize Flutter project
- [x] Setup Folder Structure (features/models/services/providers)
- [x] Install dependencies (`dio`, `flutter_riverpod`, `riverpod_annotation`)
- [x] Create `VideoModel` to map JSON from backend
- [x] Create `ApiService` to fetch metadata
- [x] Build UI: Home Screen (Input Field)
- [x] Build UI: Metadata/Selection Screen (Thumbnail + Quality List)

## 🟠 Phase 3: Download & Storage Logic
- [x] Install dependencies (`path_provider`, `permission_handler`, `dio`)
- [x] Implement `DownloadService` with progress tracking
- [x] Implement file saving logic (Android Scoped Storage & iOS Files)
- [x] Add "Download Progress" UI overlay/bar

## 🔴 Phase 4: History & Polish
- [ ] Setup local database (`Isar` or `sqflite`) for history. Now sing sqflite.
- [ ] Build "Downloads History" Screen
- [ ] Implement Error Handling (Toast messages/Snackbars)
- [ ] Add Dark Mode support
- [ ] Final Testing on Android 5.0+ and iOS

## 🚀 Phase 5: Deployment
- [ ] Dockerize Backend
- [ ] Deploy Backend to VPS (DigitalOcean/AWS/etc)
- [ ] Build Flutter APK/IPA
