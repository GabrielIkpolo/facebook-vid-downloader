// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => _VideoModel(
  title: json['title'] as String,
  thumbnailUrl: json['thumbnail'] as String,
  formats: (json['formats'] as List<dynamic>)
      .map((e) => VideoFormatModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VideoModelToJson(_VideoModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumbnail': instance.thumbnailUrl,
      'formats': instance.formats,
    };

_VideoFormatModel _$VideoFormatModelFromJson(Map<String, dynamic> json) =>
    _VideoFormatModel(
      formatId: json['format_id'] as String,
      ext: json['ext'] as String,
      url: json['url'] as String,
      resolution: json['resolution'] as String?,
      filesize: (json['filesize'] as num?)?.toInt(),
      isCombined: json['is_combined'] as bool? ?? false,
    );

Map<String, dynamic> _$VideoFormatModelToJson(_VideoFormatModel instance) =>
    <String, dynamic>{
      'format_id': instance.formatId,
      'ext': instance.ext,
      'url': instance.url,
      'resolution': instance.resolution,
      'filesize': instance.filesize,
      'is_combined': instance.isCombined,
    };
