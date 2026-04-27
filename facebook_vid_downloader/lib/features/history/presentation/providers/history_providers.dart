import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/database_helper.dart';
import '../../data/models/download_history_model.dart';
import '../../data/repositories/history_repository_impl.dart';
import '../../domain/entities/download_history.dart';
import '../../domain/repositories/history_repository.dart';

final databaseHelperProvider = Provider<DatabaseHelper>((ref) {
  return DatabaseHelper.instance;
});

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  final dbHelper = ref.watch(databaseHelperProvider);
  return HistoryRepositoryImpl(dbHelper: dbHelper);
});

final historyNotifierProvider = AsyncNotifierProvider<HistoryNotifier, List<DownloadHistory>>(() {
  return HistoryNotifier();
});

class HistoryNotifier extends AsyncNotifier<List<DownloadHistory>> {
  @override
  Future<List<DownloadHistory>> build() async {
    final repository = ref.watch(historyRepositoryProvider);
    return repository.getHistory();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(historyRepositoryProvider);
      return repository.getHistory();
    });
  }

  Future<void> delete(int id) async {
    final repository = ref.read(historyRepositoryProvider);
    await repository.deleteHistory(id);
    await refresh();
  }

  Future<void> clear() async {
    final repository = ref.read(historyRepositoryProvider);
    await repository.clearHistory();
    await refresh();
  }
}
