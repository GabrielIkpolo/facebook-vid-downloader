import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/video.dart';
import '../../domain/repositories/video_repository.dart';

class DownloaderNotifier extends AsyncNotifier<Video?> {
  @override
  Future<Video?> build() async {
    return null;
  }

  Future<void> extractVideo(String url, VideoRepository repository) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final video = await repository.extractVideoMetadata(url);
      return video;
    });
  }
}

final downloaderNotifierProvider = AsyncNotifierProvider<DownloaderNotifier, Video?>(() {
  return DownloaderNotifier();
});
