import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:music_playlist_app/src/screens/music_screens.dart';

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
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'My Playlist',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: state.when(
        data: (albums) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
            child: ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                
                final album = albums[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicScreens(album: album),
                      ),
                    );
                  },
                  leading: SizedBox(
                    width: 100,
                    height: 100,
                    
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      imageUrl: album.albumImage ?? '',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.music_note),
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
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
