import 'dart:io';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../domain/services/download_service.dart';

class DownloadServiceImp implements DownloadService {
  final Dio dio;

  DownloadServiceImp({required this.dio});

  @override
  Future<void> downloadFile({
    required String url,
    required String savePath,
    required Function(double progress) onProgress,
  }) async {
    // 1. Check and request permissions
    if (Platform.isAndroid) {
      await _requestAndroidPermissions();
    }

    // 2. Ensure directory exists
    final file = File(savePath);
    final directory = file.parent;
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    // 3. Start download
    try {
      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            onProgress(received / total);
          }
        },
      );
    } catch (e) {
      throw Exception('Download failed: $e');
    }
  }

  Future<void> _requestAndroidPermissions() async {
    if (Platform.isAndroid) {
      // For Android 13 (API 33) and above, we need Permission.videos
      // For older versions, we need Permission.storage
      
      // We can check the SDK version, but permission_handler usually handles this.
      // Let's try requesting both to be safe, or use the appropriate one.
      
      // On Android 13+, Permission.storage might return denied or not work as expected.
      // Let's try requesting videos permission first if it's a video downloader.
      
      final status = await Permission.videos.request();
      
      if (status.isGranted) {
        return;
      }

      // If videos permission is not granted (maybe on older Android), try storage permission
      final storageStatus = await Permission.storage.request();
      
      if (storageStatus.isGranted) {
        return;
      }

      if (status.isPermanentlyDenied || storageStatus.isPermanentlyDenied) {
        throw Exception('Storage permission is permanently denied. Please enable it in settings.');
      } else if (!status.isGranted && !storageStatus.isGranted) {
        throw Exception('Storage permission denied.');
      }
    }
  }
}
