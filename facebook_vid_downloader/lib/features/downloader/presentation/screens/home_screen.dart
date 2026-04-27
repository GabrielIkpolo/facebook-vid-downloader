import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/providers/downloader_providers.dart';
import '../../presentation/providers/downloader_notifier.dart';
import 'selection_screen.dart';
import '../../../features/history/presentation/screens/history_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _urlController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final downloaderState = ref.watch(downloaderNotifierProvider);
    final repository = ref.watch(videoRepositoryProvider);

    // Listen for changes in the downloader state to navigate
    ref.listen<AsyncValue<Video?>>(downloaderNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (video) {
          if (video != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelectionScreen(video: video),
              ),
            );
          }
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('FB Video Downloader'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              final currentMode = ref.read(themeModeProvider);
              ref.read(themeModeProvider.notifier).state =
                  currentMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
            },
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HistoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.download, size: 100, color: Colors.deepPurple),
            const SizedBox(height: 32),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Facebook Video URL',
                hintText: 'https://www.facebook.com/watch/?v=...',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: downloaderState.isLoading
                    ? null
                    : () async {
                        final url = _urlController.text.trim();
                        if (url.isNotEmpty) {
                          await ref.read(downloaderNotifierProvider.notifier)
                              .extractVideo(url, repository);
                        }
                      },
                child: downloaderState.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Extract Video'),
              ),
            ),
            if (downloaderState.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Error: ${downloaderState.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
