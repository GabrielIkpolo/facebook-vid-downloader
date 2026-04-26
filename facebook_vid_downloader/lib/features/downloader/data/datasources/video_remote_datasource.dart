import 'package:dio/dio.dart';
import '../models/video_model.dart';

abstract class VideoRemoteDataSource {
  Future<VideoModel> extractVideoMetadata(String url);
}

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  final Dio dio;
  final String baseUrl;

  VideoRemoteDataSourceImpl({
    required this.dio,
    required this.baseUrl,
  });

  @override
  Future<VideoModel> extractVideoMetadata(String url) async {
    try {
      final response = await dio.get(
        '$baseUrl/extract',
        queryParameters: {'url': url},
      );

      if (response.statusCode == 200) {
        return VideoModel.fromJson(response.data);
      } else {
        throw Exception('Failed to extract video metadata');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? e.message;
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
