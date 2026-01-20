// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) {
  return _AlbumModel.fromJson(json);
}

/// @nodoc
mixin _$AlbumModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  num? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'artist_id')
  String? get artistId => throw _privateConstructorUsedError;
  @JsonKey(name: 'artist_name')
  String? get artistName => throw _privateConstructorUsedError;
  @JsonKey(name: 'artist_idstr')
  String? get artistIdstr => throw _privateConstructorUsedError;
  @JsonKey(name: 'album_name')
  String? get albumName => throw _privateConstructorUsedError;
  @JsonKey(name: 'album_id')
  String? get albumId => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_ccurl')
  String? get licenseCcurl => throw _privateConstructorUsedError;
  @JsonKey(name: 'position')
  num? get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'releasedate')
  String? get releasedate => throw _privateConstructorUsedError;
  @JsonKey(name: 'album_image')
  String? get albumImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio')
  String? get audio => throw _privateConstructorUsedError;
  @JsonKey(name: 'audiodownload')
  String? get audiodownload => throw _privateConstructorUsedError;
  @JsonKey(name: 'prourl')
  String? get prourl => throw _privateConstructorUsedError;
  @JsonKey(name: 'shorturl')
  String? get shorturl => throw _privateConstructorUsedError;
  @JsonKey(name: 'shareurl')
  String? get shareurl => throw _privateConstructorUsedError;
  @JsonKey(name: 'audiodownload_allowed')
  bool? get audiodownloadAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_id_free')
  bool? get contentIdFree => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this AlbumModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumModelCopyWith<AlbumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumModelCopyWith<$Res> {
  factory $AlbumModelCopyWith(
    AlbumModel value,
    $Res Function(AlbumModel) then,
  ) = _$AlbumModelCopyWithImpl<$Res, AlbumModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'duration') num? duration,
    @JsonKey(name: 'artist_id') String? artistId,
    @JsonKey(name: 'artist_name') String? artistName,
    @JsonKey(name: 'artist_idstr') String? artistIdstr,
    @JsonKey(name: 'album_name') String? albumName,
    @JsonKey(name: 'album_id') String? albumId,
    @JsonKey(name: 'license_ccurl') String? licenseCcurl,
    @JsonKey(name: 'position') num? position,
    @JsonKey(name: 'releasedate') String? releasedate,
    @JsonKey(name: 'album_image') String? albumImage,
    @JsonKey(name: 'audio') String? audio,
    @JsonKey(name: 'audiodownload') String? audiodownload,
    @JsonKey(name: 'prourl') String? prourl,
    @JsonKey(name: 'shorturl') String? shorturl,
    @JsonKey(name: 'shareurl') String? shareurl,
    @JsonKey(name: 'audiodownload_allowed') bool? audiodownloadAllowed,
    @JsonKey(name: 'content_id_free') bool? contentIdFree,
    @JsonKey(name: 'image') String? image,
  });
}

/// @nodoc
class _$AlbumModelCopyWithImpl<$Res, $Val extends AlbumModel>
    implements $AlbumModelCopyWith<$Res> {
  _$AlbumModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? artistId = freezed,
    Object? artistName = freezed,
    Object? artistIdstr = freezed,
    Object? albumName = freezed,
    Object? albumId = freezed,
    Object? licenseCcurl = freezed,
    Object? position = freezed,
    Object? releasedate = freezed,
    Object? albumImage = freezed,
    Object? audio = freezed,
    Object? audiodownload = freezed,
    Object? prourl = freezed,
    Object? shorturl = freezed,
    Object? shareurl = freezed,
    Object? audiodownloadAllowed = freezed,
    Object? contentIdFree = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as num?,
            artistId: freezed == artistId
                ? _value.artistId
                : artistId // ignore: cast_nullable_to_non_nullable
                      as String?,
            artistName: freezed == artistName
                ? _value.artistName
                : artistName // ignore: cast_nullable_to_non_nullable
                      as String?,
            artistIdstr: freezed == artistIdstr
                ? _value.artistIdstr
                : artistIdstr // ignore: cast_nullable_to_non_nullable
                      as String?,
            albumName: freezed == albumName
                ? _value.albumName
                : albumName // ignore: cast_nullable_to_non_nullable
                      as String?,
            albumId: freezed == albumId
                ? _value.albumId
                : albumId // ignore: cast_nullable_to_non_nullable
                      as String?,
            licenseCcurl: freezed == licenseCcurl
                ? _value.licenseCcurl
                : licenseCcurl // ignore: cast_nullable_to_non_nullable
                      as String?,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as num?,
            releasedate: freezed == releasedate
                ? _value.releasedate
                : releasedate // ignore: cast_nullable_to_non_nullable
                      as String?,
            albumImage: freezed == albumImage
                ? _value.albumImage
                : albumImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            audio: freezed == audio
                ? _value.audio
                : audio // ignore: cast_nullable_to_non_nullable
                      as String?,
            audiodownload: freezed == audiodownload
                ? _value.audiodownload
                : audiodownload // ignore: cast_nullable_to_non_nullable
                      as String?,
            prourl: freezed == prourl
                ? _value.prourl
                : prourl // ignore: cast_nullable_to_non_nullable
                      as String?,
            shorturl: freezed == shorturl
                ? _value.shorturl
                : shorturl // ignore: cast_nullable_to_non_nullable
                      as String?,
            shareurl: freezed == shareurl
                ? _value.shareurl
                : shareurl // ignore: cast_nullable_to_non_nullable
                      as String?,
            audiodownloadAllowed: freezed == audiodownloadAllowed
                ? _value.audiodownloadAllowed
                : audiodownloadAllowed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            contentIdFree: freezed == contentIdFree
                ? _value.contentIdFree
                : contentIdFree // ignore: cast_nullable_to_non_nullable
                      as bool?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlbumModelImplCopyWith<$Res>
    implements $AlbumModelCopyWith<$Res> {
  factory _$$AlbumModelImplCopyWith(
    _$AlbumModelImpl value,
    $Res Function(_$AlbumModelImpl) then,
  ) = __$$AlbumModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'duration') num? duration,
    @JsonKey(name: 'artist_id') String? artistId,
    @JsonKey(name: 'artist_name') String? artistName,
    @JsonKey(name: 'artist_idstr') String? artistIdstr,
    @JsonKey(name: 'album_name') String? albumName,
    @JsonKey(name: 'album_id') String? albumId,
    @JsonKey(name: 'license_ccurl') String? licenseCcurl,
    @JsonKey(name: 'position') num? position,
    @JsonKey(name: 'releasedate') String? releasedate,
    @JsonKey(name: 'album_image') String? albumImage,
    @JsonKey(name: 'audio') String? audio,
    @JsonKey(name: 'audiodownload') String? audiodownload,
    @JsonKey(name: 'prourl') String? prourl,
    @JsonKey(name: 'shorturl') String? shorturl,
    @JsonKey(name: 'shareurl') String? shareurl,
    @JsonKey(name: 'audiodownload_allowed') bool? audiodownloadAllowed,
    @JsonKey(name: 'content_id_free') bool? contentIdFree,
    @JsonKey(name: 'image') String? image,
  });
}

/// @nodoc
class __$$AlbumModelImplCopyWithImpl<$Res>
    extends _$AlbumModelCopyWithImpl<$Res, _$AlbumModelImpl>
    implements _$$AlbumModelImplCopyWith<$Res> {
  __$$AlbumModelImplCopyWithImpl(
    _$AlbumModelImpl _value,
    $Res Function(_$AlbumModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? artistId = freezed,
    Object? artistName = freezed,
    Object? artistIdstr = freezed,
    Object? albumName = freezed,
    Object? albumId = freezed,
    Object? licenseCcurl = freezed,
    Object? position = freezed,
    Object? releasedate = freezed,
    Object? albumImage = freezed,
    Object? audio = freezed,
    Object? audiodownload = freezed,
    Object? prourl = freezed,
    Object? shorturl = freezed,
    Object? shareurl = freezed,
    Object? audiodownloadAllowed = freezed,
    Object? contentIdFree = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _$AlbumModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as num?,
        artistId: freezed == artistId
            ? _value.artistId
            : artistId // ignore: cast_nullable_to_non_nullable
                  as String?,
        artistName: freezed == artistName
            ? _value.artistName
            : artistName // ignore: cast_nullable_to_non_nullable
                  as String?,
        artistIdstr: freezed == artistIdstr
            ? _value.artistIdstr
            : artistIdstr // ignore: cast_nullable_to_non_nullable
                  as String?,
        albumName: freezed == albumName
            ? _value.albumName
            : albumName // ignore: cast_nullable_to_non_nullable
                  as String?,
        albumId: freezed == albumId
            ? _value.albumId
            : albumId // ignore: cast_nullable_to_non_nullable
                  as String?,
        licenseCcurl: freezed == licenseCcurl
            ? _value.licenseCcurl
            : licenseCcurl // ignore: cast_nullable_to_non_nullable
                  as String?,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as num?,
        releasedate: freezed == releasedate
            ? _value.releasedate
            : releasedate // ignore: cast_nullable_to_non_nullable
                  as String?,
        albumImage: freezed == albumImage
            ? _value.albumImage
            : albumImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        audio: freezed == audio
            ? _value.audio
            : audio // ignore: cast_nullable_to_non_nullable
                  as String?,
        audiodownload: freezed == audiodownload
            ? _value.audiodownload
            : audiodownload // ignore: cast_nullable_to_non_nullable
                  as String?,
        prourl: freezed == prourl
            ? _value.prourl
            : prourl // ignore: cast_nullable_to_non_nullable
                  as String?,
        shorturl: freezed == shorturl
            ? _value.shorturl
            : shorturl // ignore: cast_nullable_to_non_nullable
                  as String?,
        shareurl: freezed == shareurl
            ? _value.shareurl
            : shareurl // ignore: cast_nullable_to_non_nullable
                  as String?,
        audiodownloadAllowed: freezed == audiodownloadAllowed
            ? _value.audiodownloadAllowed
            : audiodownloadAllowed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        contentIdFree: freezed == contentIdFree
            ? _value.contentIdFree
            : contentIdFree // ignore: cast_nullable_to_non_nullable
                  as bool?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumModelImpl implements _AlbumModel {
  const _$AlbumModelImpl({
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'name') this.name,
    @JsonKey(name: 'duration') this.duration,
    @JsonKey(name: 'artist_id') this.artistId,
    @JsonKey(name: 'artist_name') this.artistName,
    @JsonKey(name: 'artist_idstr') this.artistIdstr,
    @JsonKey(name: 'album_name') this.albumName,
    @JsonKey(name: 'album_id') this.albumId,
    @JsonKey(name: 'license_ccurl') this.licenseCcurl,
    @JsonKey(name: 'position') this.position,
    @JsonKey(name: 'releasedate') this.releasedate,
    @JsonKey(name: 'album_image') this.albumImage,
    @JsonKey(name: 'audio') this.audio,
    @JsonKey(name: 'audiodownload') this.audiodownload,
    @JsonKey(name: 'prourl') this.prourl,
    @JsonKey(name: 'shorturl') this.shorturl,
    @JsonKey(name: 'shareurl') this.shareurl,
    @JsonKey(name: 'audiodownload_allowed') this.audiodownloadAllowed,
    @JsonKey(name: 'content_id_free') this.contentIdFree,
    @JsonKey(name: 'image') this.image,
  });

  factory _$AlbumModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'duration')
  final num? duration;
  @override
  @JsonKey(name: 'artist_id')
  final String? artistId;
  @override
  @JsonKey(name: 'artist_name')
  final String? artistName;
  @override
  @JsonKey(name: 'artist_idstr')
  final String? artistIdstr;
  @override
  @JsonKey(name: 'album_name')
  final String? albumName;
  @override
  @JsonKey(name: 'album_id')
  final String? albumId;
  @override
  @JsonKey(name: 'license_ccurl')
  final String? licenseCcurl;
  @override
  @JsonKey(name: 'position')
  final num? position;
  @override
  @JsonKey(name: 'releasedate')
  final String? releasedate;
  @override
  @JsonKey(name: 'album_image')
  final String? albumImage;
  @override
  @JsonKey(name: 'audio')
  final String? audio;
  @override
  @JsonKey(name: 'audiodownload')
  final String? audiodownload;
  @override
  @JsonKey(name: 'prourl')
  final String? prourl;
  @override
  @JsonKey(name: 'shorturl')
  final String? shorturl;
  @override
  @JsonKey(name: 'shareurl')
  final String? shareurl;
  @override
  @JsonKey(name: 'audiodownload_allowed')
  final bool? audiodownloadAllowed;
  @override
  @JsonKey(name: 'content_id_free')
  final bool? contentIdFree;
  @override
  @JsonKey(name: 'image')
  final String? image;

  @override
  String toString() {
    return 'AlbumModel(id: $id, name: $name, duration: $duration, artistId: $artistId, artistName: $artistName, artistIdstr: $artistIdstr, albumName: $albumName, albumId: $albumId, licenseCcurl: $licenseCcurl, position: $position, releasedate: $releasedate, albumImage: $albumImage, audio: $audio, audiodownload: $audiodownload, prourl: $prourl, shorturl: $shorturl, shareurl: $shareurl, audiodownloadAllowed: $audiodownloadAllowed, contentIdFree: $contentIdFree, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.artistIdstr, artistIdstr) ||
                other.artistIdstr == artistIdstr) &&
            (identical(other.albumName, albumName) ||
                other.albumName == albumName) &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.licenseCcurl, licenseCcurl) ||
                other.licenseCcurl == licenseCcurl) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.releasedate, releasedate) ||
                other.releasedate == releasedate) &&
            (identical(other.albumImage, albumImage) ||
                other.albumImage == albumImage) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.audiodownload, audiodownload) ||
                other.audiodownload == audiodownload) &&
            (identical(other.prourl, prourl) || other.prourl == prourl) &&
            (identical(other.shorturl, shorturl) ||
                other.shorturl == shorturl) &&
            (identical(other.shareurl, shareurl) ||
                other.shareurl == shareurl) &&
            (identical(other.audiodownloadAllowed, audiodownloadAllowed) ||
                other.audiodownloadAllowed == audiodownloadAllowed) &&
            (identical(other.contentIdFree, contentIdFree) ||
                other.contentIdFree == contentIdFree) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    duration,
    artistId,
    artistName,
    artistIdstr,
    albumName,
    albumId,
    licenseCcurl,
    position,
    releasedate,
    albumImage,
    audio,
    audiodownload,
    prourl,
    shorturl,
    shareurl,
    audiodownloadAllowed,
    contentIdFree,
    image,
  ]);

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      __$$AlbumModelImplCopyWithImpl<_$AlbumModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumModelImplToJson(this);
  }
}

abstract class _AlbumModel implements AlbumModel {
  const factory _AlbumModel({
    @JsonKey(name: 'id') final String? id,
    @JsonKey(name: 'name') final String? name,
    @JsonKey(name: 'duration') final num? duration,
    @JsonKey(name: 'artist_id') final String? artistId,
    @JsonKey(name: 'artist_name') final String? artistName,
    @JsonKey(name: 'artist_idstr') final String? artistIdstr,
    @JsonKey(name: 'album_name') final String? albumName,
    @JsonKey(name: 'album_id') final String? albumId,
    @JsonKey(name: 'license_ccurl') final String? licenseCcurl,
    @JsonKey(name: 'position') final num? position,
    @JsonKey(name: 'releasedate') final String? releasedate,
    @JsonKey(name: 'album_image') final String? albumImage,
    @JsonKey(name: 'audio') final String? audio,
    @JsonKey(name: 'audiodownload') final String? audiodownload,
    @JsonKey(name: 'prourl') final String? prourl,
    @JsonKey(name: 'shorturl') final String? shorturl,
    @JsonKey(name: 'shareurl') final String? shareurl,
    @JsonKey(name: 'audiodownload_allowed') final bool? audiodownloadAllowed,
    @JsonKey(name: 'content_id_free') final bool? contentIdFree,
    @JsonKey(name: 'image') final String? image,
  }) = _$AlbumModelImpl;

  factory _AlbumModel.fromJson(Map<String, dynamic> json) =
      _$AlbumModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'duration')
  num? get duration;
  @override
  @JsonKey(name: 'artist_id')
  String? get artistId;
  @override
  @JsonKey(name: 'artist_name')
  String? get artistName;
  @override
  @JsonKey(name: 'artist_idstr')
  String? get artistIdstr;
  @override
  @JsonKey(name: 'album_name')
  String? get albumName;
  @override
  @JsonKey(name: 'album_id')
  String? get albumId;
  @override
  @JsonKey(name: 'license_ccurl')
  String? get licenseCcurl;
  @override
  @JsonKey(name: 'position')
  num? get position;
  @override
  @JsonKey(name: 'releasedate')
  String? get releasedate;
  @override
  @JsonKey(name: 'album_image')
  String? get albumImage;
  @override
  @JsonKey(name: 'audio')
  String? get audio;
  @override
  @JsonKey(name: 'audiodownload')
  String? get audiodownload;
  @override
  @JsonKey(name: 'prourl')
  String? get prourl;
  @override
  @JsonKey(name: 'shorturl')
  String? get shorturl;
  @override
  @JsonKey(name: 'shareurl')
  String? get shareurl;
  @override
  @JsonKey(name: 'audiodownload_allowed')
  bool? get audiodownloadAllowed;
  @override
  @JsonKey(name: 'content_id_free')
  bool? get contentIdFree;
  @override
  @JsonKey(name: 'image')
  String? get image;

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
