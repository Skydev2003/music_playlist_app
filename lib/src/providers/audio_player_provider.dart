import 'package:audio_session/audio_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerNotifier extends StateNotifier<AsyncValue<AudioPlayer>> {
  AudioPlayerNotifier() : super(const AsyncValue.loading()) {
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    try {
      // Initialize audio session
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.music());

      final audioPlayer = AudioPlayer();
      state = AsyncValue.data(audioPlayer);
    } catch (e, stack) {
      print('Error initializing audio player: $e');
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> playMusic(String audioUrl) async {
    final audioPlayer = state.maybeWhen(
      data: (player) => player,
      orElse: () => null,
    );
    if (audioPlayer != null) {
      try {
        print('Playing: $audioUrl');
        await audioPlayer.setUrl(audioUrl);
        await audioPlayer.play();
        print('Audio playing successfully');
      } catch (e) {
        print('Error playing music: $e');
        rethrow;
      }
    } else {
      print('Audio player not initialized');
    }
  }

  Future<void> pauseMusic() async {
    final audioPlayer = state.maybeWhen(
      data: (player) => player,
      orElse: () => null,
    );
    if (audioPlayer != null) {
      try {
        await audioPlayer.pause();
      } catch (e) {
        print('Error pausing music: $e');
      }
    }
  }

  Future<void> resumeMusic() async {
    final audioPlayer = state.maybeWhen(
      data: (player) => player,
      orElse: () => null,
    );
    if (audioPlayer != null) {
      try {
        await audioPlayer.play();
      } catch (e) {
        print('Error resuming music: $e');
      }
    }
  }

  Future<void> stopMusic() async {
    final audioPlayer = state.maybeWhen(
      data: (player) => player,
      orElse: () => null,
    );
    if (audioPlayer != null) {
      try {
        await audioPlayer.stop();
      } catch (e) {
        print('Error stopping music: $e');
      }
    }
  }

  Future<void> seekToPosition(Duration position) async {
    final audioPlayer = state.maybeWhen(
      data: (player) => player,
      orElse: () => null,
    );
    if (audioPlayer != null) {
      try {
        await audioPlayer.seek(position);
      } catch (e) {
        print('Error seeking: $e');
      }
    }
  }

  @override
  void dispose() {
    state.maybeWhen(
      data: (player) {
        player.dispose();
        return null;
      },
      orElse: () => null,
    );
    super.dispose();
  }
}

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AsyncValue<AudioPlayer>>(
      (ref) => AudioPlayerNotifier(),
    );

final currentPlayingIndexProvider = StateProvider<int>((ref) => 0);

final isPlayingProvider = StateProvider<bool>((ref) => false);

// Stream providers for position and duration
final positionStreamProvider = StreamProvider<Duration>((ref) {
  final audioPlayerAsync = ref.watch(audioPlayerProvider);
  return audioPlayerAsync.when(
    data: (audioPlayer) {
      return audioPlayer.positionStream;
    },
    loading: () => Stream.value(Duration.zero),
    error: (_, __) => Stream.value(Duration.zero),
  );
});

final durationStreamProvider = StreamProvider<Duration>((ref) {
  final audioPlayerAsync = ref.watch(audioPlayerProvider);
  return audioPlayerAsync.when(
    data: (audioPlayer) {
      return audioPlayer.durationStream.map(
        (duration) => duration ?? Duration.zero,
      );
    },
    loading: () => Stream.value(Duration.zero),
    error: (_, __) => Stream.value(Duration.zero),
  );
});

final playbackStateProvider = StreamProvider<PlayerState>((ref) {
  final audioPlayerAsync = ref.watch(audioPlayerProvider);
  return audioPlayerAsync.when(
    data: (audioPlayer) {
      return audioPlayer.playerStateStream;
    },
    loading: () => Stream.value(PlayerState(false, ProcessingState.idle)),
    error: (_, __) => Stream.value(PlayerState(false, ProcessingState.idle)),
  );
});

final currentDurationProvider = StateProvider<Duration>((ref) => Duration.zero);

final totalDurationProvider = StateProvider<Duration>((ref) => Duration.zero);
