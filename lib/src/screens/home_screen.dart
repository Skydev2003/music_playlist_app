import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/platlist_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Fetch albums when the widget is first built
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(albumProvider.notifier).fetchAlbums();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(albumProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Playlist',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: state.when(
        data: (albums) {
          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index];
              return ListTile(
                onTap: () {
                  // Handle album tap
                },
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    imageUrl: album.albumImage ??
                        '',
                  ),
                ),
                title: Text(album.name ?? 'Unknown'),
                subtitle: Text(album.artistName ?? 'Unknown Artist'),
                trailing:  IconButton.outlined(
                  onPressed:() {},
                  icon: Icon(Icons.play_arrow),
                  iconSize: 30,
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
