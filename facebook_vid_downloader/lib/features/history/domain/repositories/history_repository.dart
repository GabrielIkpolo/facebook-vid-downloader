import '../entities/download_history.dart';

abstract class HistoryRepository {
  Future<void> saveDownload(DownloadHistory history);
  Future<List<DownloadHistory>> getHistory();
  Future<void> deleteHistory(int id);
  Future<void> clearHistory();
}
