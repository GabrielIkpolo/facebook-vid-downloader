import '../../domain/entities/download_history.dart';

class DownloadHistoryModel extends DownloadHistory {
  DownloadHistoryModel({
    super.id,
    required super.title,
    required super.url,
    required super.filePath,
    required super.downloadDate,
    required super.format,
    required super.resolution,
    required super.filesize,
  });

  factory DownloadHistoryModel.fromMap(Map<String, dynamic> map) {
    return DownloadHistoryModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      url: map['url'] as String,
      filePath: map['filePath'] as String,
      downloadDate: DateTime.parse(map['downloadDate'] as String),
      format: map['format'] as String,
      resolution: map['resolution'] as String,
      filesize: map['filesize'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'filePath': filePath,
      'downloadDate': downloadDate.toIso8601String(),
      'format': format,
      'resolution': resolution,
      'filesize': filesize,
    };
  }
}
