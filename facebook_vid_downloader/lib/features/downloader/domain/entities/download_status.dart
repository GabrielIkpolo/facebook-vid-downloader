enum DownloadState { idle, downloading, completed, error }

class DownloadStatus {
  final DownloadState state;
  final double progress; // 0.0 to 1.0
  final String? errorMessage;
  final String? filePath;

  const DownloadStatus({
    this.state = DownloadState.idle,
    this.progress = 0.0,
    this.errorMessage,
    this.filePath,
  });

  DownloadStatus copyWith({
    DownloadState? state,
    double? progress,
    String? errorMessage,
    String? filePath,
  }) {
    return DownloadStatus(
      state: state ?? this.state,
      progress: progress ?? this.progress,
      errorMessage: errorMessage ?? this.errorMessage,
      filePath: filePath ?? this.filePath,
    );
  }
}
