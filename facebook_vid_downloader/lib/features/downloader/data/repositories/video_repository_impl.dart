import '../../domain/entities/video.dart';
import '../../domain/repositories/video_repository.dart';
import '../datasources/video_remote_datasource.dart';
import '../models/video_model.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteDataSource remoteDataSource;

  VideoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Video> extractVideoMetadata(String url) async {
    final videoModel = await remoteDataSource.extractVideoMetadata(url);
    
    // Map VideoModel to Video entity
    return Video(
      title: videoModel.title,
      thumbnailUrl: videoModel.thumbnailUrl,
      formats: videoModel.formats.map((f) => VideoFormat(
        formatId: f.formatId,
        ext: f.ext,
        url: f.url,
        resolution: f.resolution,
        filesize: f.filesize,
        isCombined: f.isCombined,
      )).toList(),
    );
  }
}
