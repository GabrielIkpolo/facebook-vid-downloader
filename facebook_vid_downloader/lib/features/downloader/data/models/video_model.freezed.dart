// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoModel {

 String get title;@JsonKey(name: 'thumbnail') String get thumbnailUrl;@JsonKey(name: 'formats') List<VideoFormatModel> get formats;
/// Create a copy of VideoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoModelCopyWith<VideoModel> get copyWith => _$VideoModelCopyWithImpl<VideoModel>(this as VideoModel, _$identity);

  /// Serializes this VideoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoModel&&(identical(other.title, title) || other.title == title)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other.formats, formats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,thumbnailUrl,const DeepCollectionEquality().hash(formats));

@override
String toString() {
  return 'VideoModel(title: $title, thumbnailUrl: $thumbnailUrl, formats: $formats)';
}


}

/// @nodoc
abstract mixin class $VideoModelCopyWith<$Res>  {
  factory $VideoModelCopyWith(VideoModel value, $Res Function(VideoModel) _then) = _$VideoModelCopyWithImpl;
@useResult
$Res call({
 String title,@JsonKey(name: 'thumbnail') String thumbnailUrl,@JsonKey(name: 'formats') List<VideoFormatModel> formats
});




}
/// @nodoc
class _$VideoModelCopyWithImpl<$Res>
    implements $VideoModelCopyWith<$Res> {
  _$VideoModelCopyWithImpl(this._self, this._then);

  final VideoModel _self;
  final $Res Function(VideoModel) _then;

/// Create a copy of VideoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? thumbnailUrl = null,Object? formats = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,formats: null == formats ? _self.formats : formats // ignore: cast_nullable_to_non_nullable
as List<VideoFormatModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoModel].
extension VideoModelPatterns on VideoModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoModel value)  $default,){
final _that = this;
switch (_that) {
case _VideoModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoModel value)?  $default,){
final _that = this;
switch (_that) {
case _VideoModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title, @JsonKey(name: 'thumbnail')  String thumbnailUrl, @JsonKey(name: 'formats')  List<VideoFormatModel> formats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoModel() when $default != null:
return $default(_that.title,_that.thumbnailUrl,_that.formats);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title, @JsonKey(name: 'thumbnail')  String thumbnailUrl, @JsonKey(name: 'formats')  List<VideoFormatModel> formats)  $default,) {final _that = this;
switch (_that) {
case _VideoModel():
return $default(_that.title,_that.thumbnailUrl,_that.formats);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title, @JsonKey(name: 'thumbnail')  String thumbnailUrl, @JsonKey(name: 'formats')  List<VideoFormatModel> formats)?  $default,) {final _that = this;
switch (_that) {
case _VideoModel() when $default != null:
return $default(_that.title,_that.thumbnailUrl,_that.formats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoModel implements VideoModel {
  const _VideoModel({required this.title, @JsonKey(name: 'thumbnail') required this.thumbnailUrl, @JsonKey(name: 'formats') required final  List<VideoFormatModel> formats}): _formats = formats;
  factory _VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);

@override final  String title;
@override@JsonKey(name: 'thumbnail') final  String thumbnailUrl;
 final  List<VideoFormatModel> _formats;
@override@JsonKey(name: 'formats') List<VideoFormatModel> get formats {
  if (_formats is EqualUnmodifiableListView) return _formats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formats);
}


/// Create a copy of VideoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoModelCopyWith<_VideoModel> get copyWith => __$VideoModelCopyWithImpl<_VideoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoModel&&(identical(other.title, title) || other.title == title)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other._formats, _formats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,thumbnailUrl,const DeepCollectionEquality().hash(_formats));

@override
String toString() {
  return 'VideoModel(title: $title, thumbnailUrl: $thumbnailUrl, formats: $formats)';
}


}

/// @nodoc
abstract mixin class _$VideoModelCopyWith<$Res> implements $VideoModelCopyWith<$Res> {
  factory _$VideoModelCopyWith(_VideoModel value, $Res Function(_VideoModel) _then) = __$VideoModelCopyWithImpl;
@override @useResult
$Res call({
 String title,@JsonKey(name: 'thumbnail') String thumbnailUrl,@JsonKey(name: 'formats') List<VideoFormatModel> formats
});




}
/// @nodoc
class __$VideoModelCopyWithImpl<$Res>
    implements _$VideoModelCopyWith<$Res> {
  __$VideoModelCopyWithImpl(this._self, this._then);

  final _VideoModel _self;
  final $Res Function(_VideoModel) _then;

/// Create a copy of VideoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? thumbnailUrl = null,Object? formats = null,}) {
  return _then(_VideoModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,formats: null == formats ? _self._formats : formats // ignore: cast_nullable_to_non_nullable
as List<VideoFormatModel>,
  ));
}


}


/// @nodoc
mixin _$VideoFormatModel {

@JsonKey(name: 'format_id') String get formatId; String get ext;@JsonKey(name: 'url') String get url;@JsonKey(name: 'resolution') String? get resolution;@JsonKey(name: 'filesize') int? get filesize;
/// Create a copy of VideoFormatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoFormatModelCopyWith<VideoFormatModel> get copyWith => _$VideoFormatModelCopyWithImpl<VideoFormatModel>(this as VideoFormatModel, _$identity);

  /// Serializes this VideoFormatModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoFormatModel&&(identical(other.formatId, formatId) || other.formatId == formatId)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.url, url) || other.url == url)&&(identical(other.resolution, resolution) || other.resolution == resolution)&&(identical(other.filesize, filesize) || other.filesize == filesize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,formatId,ext,url,resolution,filesize);

@override
String toString() {
  return 'VideoFormatModel(formatId: $formatId, ext: $ext, url: $url, resolution: $resolution, filesize: $filesize)';
}


}

/// @nodoc
abstract mixin class $VideoFormatModelCopyWith<$Res>  {
  factory $VideoFormatModelCopyWith(VideoFormatModel value, $Res Function(VideoFormatModel) _then) = _$VideoFormatModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'format_id') String formatId, String ext,@JsonKey(name: 'url') String url,@JsonKey(name: 'resolution') String? resolution,@JsonKey(name: 'filesize') int? filesize
});




}
/// @nodoc
class _$VideoFormatModelCopyWithImpl<$Res>
    implements $VideoFormatModelCopyWith<$Res> {
  _$VideoFormatModelCopyWithImpl(this._self, this._then);

  final VideoFormatModel _self;
  final $Res Function(VideoFormatModel) _then;

/// Create a copy of VideoFormatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formatId = null,Object? ext = null,Object? url = null,Object? resolution = freezed,Object? filesize = freezed,}) {
  return _then(_self.copyWith(
formatId: null == formatId ? _self.formatId : formatId // ignore: cast_nullable_to_non_nullable
as String,ext: null == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,resolution: freezed == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as String?,filesize: freezed == filesize ? _self.filesize : filesize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoFormatModel].
extension VideoFormatModelPatterns on VideoFormatModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoFormatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoFormatModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoFormatModel value)  $default,){
final _that = this;
switch (_that) {
case _VideoFormatModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoFormatModel value)?  $default,){
final _that = this;
switch (_that) {
case _VideoFormatModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'format_id')  String formatId,  String ext, @JsonKey(name: 'url')  String url, @JsonKey(name: 'resolution')  String? resolution, @JsonKey(name: 'filesize')  int? filesize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoFormatModel() when $default != null:
return $default(_that.formatId,_that.ext,_that.url,_that.resolution,_that.filesize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'format_id')  String formatId,  String ext, @JsonKey(name: 'url')  String url, @JsonKey(name: 'resolution')  String? resolution, @JsonKey(name: 'filesize')  int? filesize)  $default,) {final _that = this;
switch (_that) {
case _VideoFormatModel():
return $default(_that.formatId,_that.ext,_that.url,_that.resolution,_that.filesize);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'format_id')  String formatId,  String ext, @JsonKey(name: 'url')  String url, @JsonKey(name: 'resolution')  String? resolution, @JsonKey(name: 'filesize')  int? filesize)?  $default,) {final _that = this;
switch (_that) {
case _VideoFormatModel() when $default != null:
return $default(_that.formatId,_that.ext,_that.url,_that.resolution,_that.filesize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoFormatModel implements VideoFormatModel {
  const _VideoFormatModel({@JsonKey(name: 'format_id') required this.formatId, required this.ext, @JsonKey(name: 'url') required this.url, @JsonKey(name: 'resolution') this.resolution, @JsonKey(name: 'filesize') this.filesize});
  factory _VideoFormatModel.fromJson(Map<String, dynamic> json) => _$VideoFormatModelFromJson(json);

@override@JsonKey(name: 'format_id') final  String formatId;
@override final  String ext;
@override@JsonKey(name: 'url') final  String url;
@override@JsonKey(name: 'resolution') final  String? resolution;
@override@JsonKey(name: 'filesize') final  int? filesize;

/// Create a copy of VideoFormatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoFormatModelCopyWith<_VideoFormatModel> get copyWith => __$VideoFormatModelCopyWithImpl<_VideoFormatModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoFormatModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoFormatModel&&(identical(other.formatId, formatId) || other.formatId == formatId)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.url, url) || other.url == url)&&(identical(other.resolution, resolution) || other.resolution == resolution)&&(identical(other.filesize, filesize) || other.filesize == filesize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,formatId,ext,url,resolution,filesize);

@override
String toString() {
  return 'VideoFormatModel(formatId: $formatId, ext: $ext, url: $url, resolution: $resolution, filesize: $filesize)';
}


}

/// @nodoc
abstract mixin class _$VideoFormatModelCopyWith<$Res> implements $VideoFormatModelCopyWith<$Res> {
  factory _$VideoFormatModelCopyWith(_VideoFormatModel value, $Res Function(_VideoFormatModel) _then) = __$VideoFormatModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'format_id') String formatId, String ext,@JsonKey(name: 'url') String url,@JsonKey(name: 'resolution') String? resolution,@JsonKey(name: 'filesize') int? filesize
});




}
/// @nodoc
class __$VideoFormatModelCopyWithImpl<$Res>
    implements _$VideoFormatModelCopyWith<$Res> {
  __$VideoFormatModelCopyWithImpl(this._self, this._then);

  final _VideoFormatModel _self;
  final $Res Function(_VideoFormatModel) _then;

/// Create a copy of VideoFormatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formatId = null,Object? ext = null,Object? url = null,Object? resolution = freezed,Object? filesize = freezed,}) {
  return _then(_VideoFormatModel(
formatId: null == formatId ? _self.formatId : formatId // ignore: cast_nullable_to_non_nullable
as String,ext: null == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,resolution: freezed == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as String?,filesize: freezed == filesize ? _self.filesize : filesize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
