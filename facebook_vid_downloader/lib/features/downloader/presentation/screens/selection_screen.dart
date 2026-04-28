import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:facebook_vid_downloader/features/downloader/domain/entities/video.dart';
import 'package:facebook_vid_downloader/features/downloader/domain/entities/download_status.dart';
import 'package:facebook_vid_downloader/features/downloader/presentation/providers/download_notifier.dart';
import 'package:facebook_vid_downloader/features/downloader/presentation/widgets/video_format_tile.dart';

class SelectionScreen extends ConsumerWidget {
  final Video video;

  const SelectionScreen({super.key, required this.video});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadState = ref.watch(downloadNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Quality'),
      ),
      body: Column(
        children: [
          if (video.thumbnailUrl.isNotEmpty)
            Image.network(
              video.thumbnailUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              video.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: video.formats.length,
              itemBuilder: (context, index) {
                final format = video.formats[index];
                return VideoFormatTile(video: video, format: format);
              },
            ),
          ),
          if (downloadState.hasValue)
            _DownloadStatusWidget(status: downloadState.value!),
        ],
      ),
    );
  }
}

class _DownloadStatusWidget extends StatelessWidget {
  final DownloadStatus status;

  const _DownloadStatusWidget({required this.status});

  @override
  Widget build(BuildContext context) {
    if (status.state == DownloadState.idle) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: const Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (status.state == DownloadState.downloading) ...[
            const Text('Downloading...'),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: status.progress),
            Text('${(status.progress * 100).toStringAsFixed(0)}%'),
          ],
          if (status.state == DownloadState.completed) ...[
            const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text('Download Completed!'),
              ],
            ),
            TextButton(
              onPressed: () {
                // In a real app, you might want to open the file or show it in history
              },
              child: const Text('View File'),
            ),
          ],
          if (status.state == DownloadState.error) ...[
            const Row(
              children: [
                Icon(Icons.error, color: Colors.red),
                SizedBox(width: 8),
                Expanded(child: Text('Download Failed')),
              ],
            ),
            Text(status.errorMessage ?? 'Unknown error'),
          ],
        ],
      ),
    );
  }
}
