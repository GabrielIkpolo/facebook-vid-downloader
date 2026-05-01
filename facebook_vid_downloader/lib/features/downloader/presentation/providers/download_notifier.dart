import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:facebook_vid_downloader/features/downloader/domain/entities/download_status.dart';
import 'package:facebook_vid_downloader/features/downloader/domain/services/download_service.dart';
import 'package:facebook_vid_downloader/features/downloader/domain/entities/video.dart';
import 'package:facebook_vid_downloader/features/history/presentation/providers/history_providers.dart';
import 'package:facebook_vid_downloader/features/history/data/models/download_history_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class DownloadNotifier extends AsyncNotifier<DownloadStatus> {
  @override
  Future<DownloadStatus> build() async {
    return const DownloadStatus();
  }

  Future<void> startDownload({
    required Video video,
    required VideoFormat format,
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

      final fileName = 'video_${format.formatId}.${format.ext}';
      final savePath = p.join(directory.path, fileName);

      await downloadService.downloadFile(
        url: format.url,
        savePath: savePath,
        onProgress: (progress) {
          state = AsyncValue.data(DownloadStatus(
            state: DownloadState.downloading,
            progress: progress,
          ));
        },
      );

      // Save to history
      final historyRepository = ref.read(historyRepositoryProvider);
      final historyModel = DownloadHistoryModel(
        title: video.title,
        url: format.url,
        filePath: savePath,
        downloadDate: DateTime.now(),
        format: format.ext,
        resolution: format.resolution ?? 'Unknown',
        filesize: format.filesize ?? 0,
      );
      await historyRepository.saveDownload(historyModel);

      // Invalidate history provider to refresh the list when user navigates to history screen
      ref.invalidate(historyNotifierProvider);

      // --- NEW: Save to Gallery for visibility ---
      try {
        final result = await ImageGallerySaver.saveFile(savePath);
        if (result != null && result['isSuccess'] == false) {
          print('Failed to save to gallery: ${result['errorMessage']}');
          // We don't throw an error here because the download itself was successful, 
          // just the "visibility" part failed.
        }
      } catch (e) {
        print('Error saving to gallery: $e');
      }

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
