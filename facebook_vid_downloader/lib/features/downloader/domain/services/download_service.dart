import '../entities/download_status.dart';

abstract class DownloadService {
  Future<void> downloadFile({
    required String url,
    required String savePath,
    required Function(double progress) onProgress,
  });
}
