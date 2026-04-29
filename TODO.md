# FB-Downloader Project TODO

## 🟢 Phase 1: Backend Development (Node.js + ES Modules)
- [x] Initialize Node.js project with `"type": "module"`
- [x] Install dependencies (`express`, `cors`, `dotenv`)
- [x] Create `server.js` with modern `import` syntax
- [x] Implement `/extract` endpoint with `yt-dlp --dump-json`
- [x] **SECURITY:** Implement strict URL sanitization/validation
- [x] Test API with `curl` and various FB links
- [x] Refine error handling for backend

## 🔵 Phase 2: Flutter Frontend (UI & API Integration)
- [x] Initialize Flutter project
- [x] Setup Folder Structure (features/models/services/providers)
- [x] Install dependencies (`dio`, `flutter_riverpod`, `riverpod_annotation`)
- [x] Create `VideoModel` to map JSON from backend
- [x] Create `ApiService` to fetch metadata
- [x] Build UI: Home Screen (Input Field)
- [x] Build UI: Metadata/Selection Screen (Thumbnail + Quality List)
- [x] Ref ik/Fix `VideoFormatTile` interaction

## 🟠 Phase 3: Download & Storage Logic
- [x] Install dependencies (`path_accept possiblity`, `permission_handler`, `dio`)
- [x] Implement `DownloadService` with progress tracking
- [x] Implement file saving logic (Android Scoped Storage & iOS Files)
- [x] Add "Download Progress" UI overlay/bar
- [x] Integrate `DownloadNotifier` with `VideoFormatTile`
- [x] Add `ref.invalidate(historyNotifierProvider)` on successful download

## 🔴 Phase 4: History & Polish
- [x] Setup local database (`sqflite`) for history.
- [x] Build "Downloads History" Screen
- [x] Implement Error Handling (Toast messages/Snackbars)
- [x] Add Dark Mode support
- [x] Final Testing on Android 5.0+ and iOS

## 🚀 Phase 5: Deployment
- [ ] Dockerize Backend
- [ ] Deploy Backend to VPS (DigitalOcean/AWS/etc)
- [x] Build Flutter APK
