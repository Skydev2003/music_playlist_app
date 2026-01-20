
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  const factory AlbumModel({
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
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);
}
