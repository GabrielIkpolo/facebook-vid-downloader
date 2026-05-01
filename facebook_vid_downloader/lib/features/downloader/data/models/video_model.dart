import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
abstract class VideoModel with _$VideoModel {
  const VideoModel._();

  const factory VideoModel({
    required String title,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'thumbnail') required String thumbnailUrl,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'formats') required List<VideoFormatModel> formats,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);
}

@freezed
abstract class VideoFormatModel with _$VideoFormatModel {
  const VideoFormatModel._();

  const factory VideoFormatModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'format_id') required String formatId,
    required String ext,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'url') required String url,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'resolution') String? resolution,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'filesize') int? filesize,
    @Default(false) @JsonKey(name: 'is_combined') bool isCombined,
  }) = _VideoFormatModel;

  factory VideoFormatModel.fromJson(Map<String, dynamic> json) => _$VideoFormatModelFromJson(json);
}
