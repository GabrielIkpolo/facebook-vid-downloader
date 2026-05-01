import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:facebook_vid_downloader/features/downloader/domain/entities/video.dart';
import 'package:facebook_vid_downloader/features/downloader/presentation/providers/downloader_providers.dart';
import 'package:facebook_vid_downloader/features/downloader/presentation/providers/download_notifier.dart';

class VideoFormatTile extends ConsumerWidget {
  final Video video;
  final VideoFormat format;

  const VideoFormatTile({super.key, required this.video, required this.format});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resolution = format.resolution ?? 'Unknown Resolution';
    final filesize = format.filesize != null
        ? '${(format.filesize! / (1024 * 1024)).toStringAsFixed(2)} MB'
        : 'Unknown Size';

    return ListTile(
      leading: Icon(format.isCombined ? Icons.videocam : Icons.videocam_outlined),
      title: Text('$resolution (${format.ext})'),
      subtitle: Text(
        '${filesize}${format.isCombined ? " • Video + Audio" : ""}',
      ),
      trailing: const Icon(Icons.download),
      onTap: () async {
        final downloadNotifier = ref.read(downloadNotifierProvider.notifier);
        final downloadService = ref.read(downloadServiceProvider);

        await downloadNotifier.startDownload(
          video: video,
          format: format,
          downloadService: downloadService,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Download process initiated')),
        );
      },
    );
  }
}
