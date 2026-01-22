import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:music_playlist_app/src/screens/music_screens.dart';
import 'package:music_playlist_app/src/providers/audio_player_provider.dart';
import 'package:music_playlist_app/src/providers/music_list_provider.dart';

import '../controllers/platlist_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
    final currentMusic = ref.watch(musicByAlbumProvider).isEmpty
        ? null
        : ref.watch(musicByAlbumProvider)[ref.watch(
            currentPlayingIndexProvider,
          )];
    final isPlaying = ref
        .watch(playbackStateProvider)
        .maybeWhen(data: (state) => state.playing, orElse: () => false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: const Text(
          'My Playlist',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: state.when(
        data: (albums) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  child: ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: (context, index) {
                      final album = albums[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          onTap: () {
                            ref
                                    .read(currentSelectedAlbumProvider.notifier)
                                    .state =
                                album;
                            ref
                                    .read(currentPlayingIndexProvider.notifier)
                                    .state =
                                0;
                            if (ref.watch(musicByAlbumProvider).isNotEmpty) {
                              final firstSong = ref
                                  .watch(musicByAlbumProvider)
                                  .first;
                              ref
                                  .read(audioPlayerProvider.notifier)
                                  .playMusic(firstSong.audio ?? '');
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MusicScreens(album: album),
                              ),
                            );
                          },
                          leading: SizedBox(
                            width: 80,
                            height: 80,
                            child: CachedNetworkImage(
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.music_note),
                              ),
                            ),
                          ),
                          title: Text(
                            album.name ?? 'Unknown',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            album.artistName ?? 'Unknown Artist',
                            style: const TextStyle(fontSize: 14),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              ref
                                      .read(
                                        currentSelectedAlbumProvider.notifier,
                                      )
                                      .state =
                                  album;
                              ref
                                      .read(
                                        currentPlayingIndexProvider.notifier,
                                      )
                                      .state =
                                  0;
                              if (ref.watch(musicByAlbumProvider).isNotEmpty) {
                                final firstSong = ref
                                    .watch(musicByAlbumProvider)
                                    .first;
                                ref
                                    .read(audioPlayerProvider.notifier)
                                    .playMusic(firstSong.audio ?? '');
                              }
                            },
                            icon: const Icon(Icons.play_circle),
                            iconSize: 32,
                            color: Colors.blue[700],
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (currentMusic != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border(top: BorderSide(color: Colors.grey[300]!)),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: currentMusic.albumImage != null
                                ? Image.network(
                                    currentMusic.albumImage!,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.music_note),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentMusic.name ?? 'Unknown',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                currentMusic.artistName ?? 'Unknown Artist',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (isPlaying) {
                                  ref
                                      .read(audioPlayerProvider.notifier)
                                      .pauseMusic();
                                } else {
                                  ref
                                      .read(audioPlayerProvider.notifier)
                                      .resumeMusic();
                                }
                              },
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.blue[700],
                              ),
                              iconSize: 24,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            const SizedBox(width: 12),
                            IconButton(
                              onPressed: () {
                                final datas = ref.read(musicByAlbumProvider);
                                final currentIndex = ref.read(
                                  currentPlayingIndexProvider,
                                );
                                if (currentIndex < datas.length - 1) {
                                  final newIndex = currentIndex + 1;
                                  ref
                                          .read(
                                            currentPlayingIndexProvider
                                                .notifier,
                                          )
                                          .state =
                                      newIndex;
                                  final song = datas[newIndex];
                                  ref
                                      .read(audioPlayerProvider.notifier)
                                      .playMusic(song.audio ?? '');
                                }
                              },
                              icon: Icon(
                                Icons.skip_next,
                                color: Colors.blue[700],
                              ),
                              iconSize: 24,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
