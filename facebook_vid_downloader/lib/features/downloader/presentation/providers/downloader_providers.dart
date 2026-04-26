import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/video_remote_datasource.dart';
import '../../data/repositories/video_repository_impl.dart';
import '../../domain/repositories/video_repository.dart';
import '../../data/services/download_service_impl.dart';
import '../../domain/services/download_service.dart';

// Constants
const String kBaseUrl = 'http://localhost:3000';

// Dio Provider
final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
});

// Remote Data Source Provider
final videoRemoteDataSourceProvider = Provider<VideoRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return VideoRemoteDataSourceImpl(
    dio: dio,
    baseUrl: kBaseUrl,
  );
});

// Repository Provider
final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  final remoteDataSource = ref.watch(videoRemoteDataSourceProvider);
  return VideoRepositoryImpl(remoteDataSource: remoteDataSource);
});

// Download Service Provider
final downloadServiceProvider = Provider<DownloadService>((ref) {
  final dio = ref.watch(dioProvider);
  return DownloadServiceImp(dio: dio);
});
