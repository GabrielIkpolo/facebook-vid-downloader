import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String title,
    @JsonKey(name: 'thumbnail') required String thumbnailUrl,
    @JsonKey(name: 'formats') required List<VideoFormatModel> formats,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);
}

@freezed
class VideoFormatModel with _$VideoFormatModel {
  const factory VideoFormatModel({
    @JsonKey(name: 'format_id') required String formatId,
    required String ext,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'resolution') String? resolution,
    @JsonKey(name: 'filesize') int? filesize,
  }) = _VideoFormatModel;

  factory VideoFormatModel.fromJson(Map<String, dynamic> json) => _$VideoFormatModelFromJson(json);
}
