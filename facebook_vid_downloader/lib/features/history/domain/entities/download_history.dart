class DownloadHistory {
  final int? id;
  final String title;
  final String url;
  final String filePath;
  final DateTime downloadDate;
  final String format;
  final String resolution;
  final int filesize;

  const DownloadHistory({
    this.id,
    required this.title,
    required this.url,
    required this.filePath,
    required this.downloadDate,
    required this.format,
    required this.resolution,
    required this.filesize,
  });
}
