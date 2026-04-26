import '../entities/video.dart';

abstract class VideoRepository {
  Future<Video> extractVideoMetadata(String url);
}
