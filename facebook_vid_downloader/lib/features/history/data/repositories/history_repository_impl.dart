import '../../domain/entities/download_history.dart';
import '../../domain/repositories/history_repository.dart';
import '../../data/models/download_history_model.dart';
import '../../../core/database_helper.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final DatabaseHelper dbHelper;

  HistoryRepositoryImpl({required this.dbHelper});

  @override
  Future<void> saveDownload(DownloadHistory history) async {
    final db = await dbHelper.database;
    await db.insert('download_history', history.toMap());
  }

  @override
  Future<List<DownloadHistory>> getHistory() async {
    final db = await dbHelper.database;
    final maps = await db.query('download_history', orderBy: 'downloadDate DESC');

    return List.generate(maps.length, (i) {
      final map = maps[i];
      return DownloadHistory.fromMap(map);
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
