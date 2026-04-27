import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/download_history.dart';
import '../../presentation/providers/history_providers.dart';
import 'package:intl/intl.dart';

class HistoryItemWidget extends ConsumerWidget {
  final DownloadHistory history;

  const HistoryItemWidget({super.key, required this.history});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');

    return ListTile(
      leading: const Icon(Icons.file_present, color: Colors.blue),
      title: Text(
        history.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dateFormat.format(history.downloadDate)),
          Text('${history.resolution} • ${history.format}'),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () async {
          await ref.read(historyNotifierProvider.notifier).delete(history.id!);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Deleted from history')),
          );
        },
      ),
    );
  }
}
