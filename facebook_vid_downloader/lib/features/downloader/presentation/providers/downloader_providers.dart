import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Added for kDebugMode
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:facebook_vid_downloader/features/downloader/data/datasources/video_remote_datasource.dart';
import 'package:facebook_vid_downloader/features/downloader/data/repositories/video_repository_impl.dart';
import 'package:facebook_vid_downloader/features/downloader/domain/repositories/video_repository.dart';
import 'package:facebook_vid_downloader/features/downloader/data/services/download_service_impl.dart';
import 'package:facebook_vid_downloader/features/downloader/domain/services/download_service.dart';

// Base URL Provider
// Automatically switches between local development and production environments
final baseUrlProvider = Provider<String>((ref) {
  if (kDebugMode) {
    // Use localhost for desktop/web debug. 
    // Note: If testing on Android Emulator, you might need 'http://10.0.2.2:3000'
    return 'http://localhost:3000';
  }
  return 'https://facebook-vid-downloader.onrender.com';
});

// Dio Provider
final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 100),
    receiveTimeout: const Duration(seconds: 100),
  ));
});

// Remote Data Source Provider
final videoRemoteDataSourceProvider = Provider<VideoRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = ref.watch(baseUrlProvider);
  return VideoRemoteDataSourceImpl(
    dio: dio,
    baseUrl: baseUrl,
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
