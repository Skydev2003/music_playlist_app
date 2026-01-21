import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:music_playlist_app/src/controllers/platlist_controller.dart';
import 'package:music_playlist_app/src/models/album_model.dart';

final currentSelectedAlbumProvider = StateProvider<AlbumModel?>((ref) => null);

final musicByAlbumProvider = Provider<List<AlbumModel>>((ref) {
  final allAlbums = ref.watch(albumProvider);
  final selectedAlbum = ref.watch(currentSelectedAlbumProvider);

  return allAlbums.when(
    data: (albums) {
      if (selectedAlbum == null) {
        return albums;
      }
      // Filter albums by the selected album's album_id
      return albums
          .where((album) => album.albumId == selectedAlbum.albumId)
          .toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
});

final musicPlayingProvider = StateProvider<int>((ref) => 0);

final isPlayingProvider = StateProvider<bool>((ref) => false);
