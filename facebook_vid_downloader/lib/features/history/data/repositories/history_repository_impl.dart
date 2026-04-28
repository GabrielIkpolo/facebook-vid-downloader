import 'package:facebook_vid_downloader/features/history/domain/entities/download_history.dart';
import 'package:facebook_vid_downloader/features/history/domain/repositories/history_repository.dart';
import 'package:facebook_vid_downloader/features/history/data/models/download_history_model.dart';
import 'package:facebook_vid_downloader/core/database_helper.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final DatabaseHelper dbHelper;

  HistoryRepositoryImpl({required this.dbHelper});

  @override
  Future<void> saveDownload(DownloadHistory history) async {
    final db = await dbHelper.database;
    // Convert entity to model to use toMap()
    final model = DownloadHistoryModel(
      id: history.id,
      title: history.title,
      url: history.url,
      filePath: history.filePath,
      downloadDate: history.downloadDate,
      format: history.format,
      resolution: history.resolution,
      filesize: history.filesize,
    );
    await db.insert('download_history', model.toMap());
  }

  @override
  Future<List<DownloadHistory>> getHistory() async {
    final db = await dbHelper.database;
    final maps = await db.query('download_history', orderBy: 'downloadDate DESC');

    return List.generate(maps.length, (i) {
      final map = maps[i];
      return DownloadHistoryModel.fromMap(map);
    });
  }

  @override
  Future<void> deleteHistory(int id) async {
    final db = await dbHelper.database;
    await db.delete('download_history', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> clearHistory() async {
    final db = await dbHelper.database;
    await db.delete('download_history');
  }
}
