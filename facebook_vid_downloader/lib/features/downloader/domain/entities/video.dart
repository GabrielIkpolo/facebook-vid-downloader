class Video {
  final String title;
  final String thumbnailUrl;
  final List<VideoFormat> formats;

  const Video({
    required this.title,
    required this.thumbnailUrl,
    required this.formats,
  });
}

class VideoFormat {
  final String formatId;
  final String ext;
  final String url;
  final String? resolution;
  final int? filesize;

  const VideoFormat({
    required this.formatId,
    required this.ext,
    required this.url,
    this.resolution,
    this.filesize,
  });
}
