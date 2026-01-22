import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:music_playlist_app/src/models/album_model.dart';
import 'package:music_playlist_app/src/providers/audio_player_provider.dart';
import 'package:music_playlist_app/src/providers/music_list_provider.dart'
    hide isPlayingProvider;

String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  if (duration.inHours == 0) {
    return "$twoDigitMinutes:$twoDigitSeconds";
  } else {
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}

class MusicScreens extends ConsumerStatefulWidget {
  final AlbumModel album;
  const MusicScreens({super.key, required this.album});

  @override
  ConsumerState<MusicScreens> createState() => _MusicScreensState();
}

class _MusicScreensState extends ConsumerState<MusicScreens> {
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Set the selected album
      ref.read(currentSelectedAlbumProvider.notifier).state = widget.album;
      // Reset playing index
      ref.read(currentPlayingIndexProvider.notifier).state = 0;
      ref.read(isPlayingProvider.notifier).state = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final datas = ref.watch(musicByAlbumProvider);
    final audioPlayerAsyncValue = ref.watch(audioPlayerProvider);
    final currentIndex = ref.watch(currentPlayingIndexProvider);
    final playbackStateAsync = ref.watch(playbackStateProvider);

    final currentMusic = currentIndex < datas.length
        ? datas[currentIndex]
        : null;

    // Extract isPlaying from playbackState
    final isPlaying = playbackStateAsync.maybeWhen(
      data: (state) => state.playing,
      orElse: () => false,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        centerTitle: true,
      
      ),
      body: Column(
        children: [
          // Now Playing Section
          Expanded(
            flex: 2,
            child: currentMusic != null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Album Cover
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: currentMusic.albumImage != null
                                ? DecorationImage(
                                    image: NetworkImage(
                                      currentMusic.albumImage!,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            color: Colors.grey[800],
                          ),
                          child: currentMusic.albumImage == null
                              ? const Icon(
                                  Icons.music_note,
                                  size: 80,
                                  color: Colors.grey,
                                )
                              : null,
                        ),
                        const SizedBox(height: 30),
                        // Song Title
                        Text(
                          currentMusic.name ?? 'Unknown',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        // Artist Name
                        Text(
                          currentMusic.artistName ?? 'Unknown Artist',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text(
                      'No music selected',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
          // Progress Bar
          if (currentMusic != null)
            Consumer(
              builder: (context, ref, child) {
                final positionAsync = ref.watch(positionStreamProvider);
                final durationAsync = ref.watch(durationStreamProvider);

                return positionAsync.when(
                  data: (position) {
                    return durationAsync.when(
                      data: (duration) {
                        return Container(
                          color: const Color(0xFF1F2937),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SliderTheme(
                                data: SliderThemeData(
                                  trackHeight: 4.0,
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 6.0,
                                  ),
                                  overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 10.0,
                                  ),
                                ),
                                child: Slider(
                                  min: 0.0,
                                  max: duration.inMilliseconds.toDouble(),
                                  value: position.inMilliseconds
                                      .toDouble()
                                      .clamp(
                                        0.0,
                                        duration.inMilliseconds.toDouble(),
                                      ),
                                  onChanged: (double value) {
                                    ref
                                        .read(audioPlayerProvider.notifier)
                                        .seekToPosition(
                                          Duration(milliseconds: value.toInt()),
                                        );
                                  },
                                  activeColor: Colors.blue,
                                  inactiveColor: Colors.grey[700],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _formatDuration(position),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      _formatDuration(duration),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      loading: () => SizedBox.shrink(),
                      error: (_, __) => SizedBox.shrink(),
                    );
                  },
                  loading: () => SizedBox.shrink(),
                  error: (_, __) => SizedBox.shrink(),
                );
              },
            ),
          // Controls
          if (currentMusic != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      if (currentIndex > 0) {
                        final previousIndex = currentIndex - 1;
                        ref.read(currentPlayingIndexProvider.notifier).state =
                            previousIndex;
                        final previousMusic = datas[previousIndex];
                        final audioUrl = previousMusic.audio ?? '';
                        if (audioUrl.isNotEmpty) {
                          audioPlayerAsyncValue.whenData((audioPlayer) async {
                            try {
                              await audioPlayer.setUrl(audioUrl);
                              await audioPlayer.play();
                              ref.read(isPlayingProvider.notifier).state = true;
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error: ${e.toString()}'),
                                ),
                              );
                            }
                          });
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: () async {
                      final audioUrl = currentMusic.audio ?? '';
                      if (audioUrl.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('ไม่มี URL เพลง')),
                        );
                        return;
                      }

                      audioPlayerAsyncValue.whenData((audioPlayer) async {
                        try {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.setUrl(audioUrl);
                            await audioPlayer.play();
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: ${e.toString()}')),
                          );
                        }
                      });
                    },
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (currentIndex < datas.length - 1) {
                        final nextIndex = currentIndex + 1;
                        ref.read(currentPlayingIndexProvider.notifier).state =
                            nextIndex;
                        final nextMusic = datas[nextIndex];
                        final audioUrl = nextMusic.audio ?? '';
                        if (audioUrl.isNotEmpty) {
                          audioPlayerAsyncValue.whenData((audioPlayer) async {
                            try {
                              await audioPlayer.setUrl(audioUrl);
                              await audioPlayer.play();
                              ref.read(isPlayingProvider.notifier).state = true;
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error: ${e.toString()}'),
                                ),
                              );
                            }
                          });
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          // Tabs
          Container(
            color: const Color(0xFF1F2937),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTabIndex = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedTabIndex == 0
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'UP NEXT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedTabIndex == 0
                              ? Colors.blue
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTabIndex = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedTabIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'LYRICS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedTabIndex == 1
                              ? Colors.blue
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tab Content
          Expanded(
            flex: 2,
            child: _selectedTabIndex == 0
                ? ListView.builder(
                    itemCount: datas.length,
                    itemBuilder: (context, index) {
                      final music = datas[index];
                      final isCurrentlyPlaying = currentIndex == index;

                      return Container(
                        color: isCurrentlyPlaying
                            ? Colors.blue.withOpacity(0.2)
                            : Colors.transparent,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: music.albumImage != null
                                  ? DecorationImage(
                                      image: NetworkImage(music.albumImage!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              color: Colors.grey[800],
                            ),
                            child: music.albumImage == null
                                ? const Icon(
                                    Icons.music_note,
                                    color: Colors.grey,
                                    size: 24,
                                  )
                                : null,
                          ),
                          title: Text(
                            music.name ?? 'Unknown',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: isCurrentlyPlaying
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          subtitle: Text(
                            music.artistName ?? 'Unknown Artist',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          onTap: () async {
                            ref
                                    .read(currentPlayingIndexProvider.notifier)
                                    .state =
                                index;

                            final audioUrl = music.audio ?? '';
                            if (audioUrl.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('ไม่มี URL เพลง')),
                              );
                              return;
                            }

                            audioPlayerAsyncValue.whenData((audioPlayer) async {
                              try {
                                await audioPlayer.setUrl(audioUrl);
                                await audioPlayer.play();
                                ref.read(isPlayingProvider.notifier).state =
                                    true;
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error: ${e.toString()}'),
                                  ),
                                );
                              }
                            });
                          },
                        ),
                      );
                    },
                  )
                : Container(
                    color: const Color(0xFF1F2937),
                    child: Center(
                      child: Text(
                        'Lyrics coming soon...',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
