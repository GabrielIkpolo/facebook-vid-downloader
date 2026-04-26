import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/download_status.dart';
import '../../domain/services/download_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

class DownloadNotifier extends AsyncNotifier<DownloadStatus> {
  @override
  Future<DownloadStatus> build() async {
    return const DownloadStatus();
  }

  Future<void> startDownload({
    required String url,
    required String fileName,
    required DownloadService downloadService,
  }) async {
    state = const AsyncValue.data(DownloadStatus(state: DownloadState.downloading));

    try {
      // Get directory to save file
      Directory? directory;
      if (Platform.isAndroid) {
        directory = await getExternalStorageDirectory();
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory == null) {
        throw Exception('Could not find a valid directory to save the file.');
      }

      final savePath = p.join(directory.path, fileName);

      await downloadService.downloadFile(
        url: url,
        savePath: savePath,
        onProgress: (progress) {
          state = AsyncValue.data(DownloadStatus(
            state: DownloadState.downloading,
            progress: progress,
          ));
        },
      );

      state = AsyncValue.data(DownloadStatus(
        state: DownloadState.completed,
        progress: 1.0,
        filePath: savePath,
      ));
    } catch (e) {
      state = AsyncValue.data(DownloadStatus(
        state: DownloadState.error,
        errorMessage: e.toString(),
      ));
    }
  }
}

final downloadNotifierProvider = AsyncNotifierProvider<DownloadNotifier, DownloadStatus>(() {
  return DownloadNotifier();
});
