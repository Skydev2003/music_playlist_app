import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:music_playlist_app/src/models/album_model.dart';

class AlubumNotifier extends StateNotifier<AsyncValue<List<AlbumModel>>> {
  AlubumNotifier() : super(const AsyncValue.data([]));

  Future<void> fetchAlbums() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      var dio = Dio();
      Response response = await dio.get(
        'https://api.jamendo.com/v3.0/tracks?client_id=f3865169&format=json&tags=chill,acoustic',
      );
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
          response.data['results'],
        );
        return data.map((e) => AlbumModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load albums');
      }
    });
  }
}

final albumProvider = StateNotifierProvider<AlubumNotifier, AsyncValue<List<AlbumModel>>>(
  (ref) => AlubumNotifier(),
);

final albumGroupByAlbumId = Provider<Map<String, List<AlbumModel>>>((ref) {
  final albumAsyncValue = ref.watch(albumProvider);

  return albumAsyncValue.when(
    data: (albums) {
      final Map<String, List<AlbumModel>> groupedAlbums = {};
      for (var album in albums) {
        final albumId = album.albumId ?? 'unknown';
        if (!groupedAlbums.containsKey(albumId)) {
          groupedAlbums[albumId] = [];
        }
        groupedAlbums[albumId]!.add(album);
      }
      return groupedAlbums;
    },
    loading: () => {},
    error: (_, __) => {},
  );
});