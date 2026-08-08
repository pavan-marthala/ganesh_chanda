// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationRequest {

 String get title; String get body; String? get imageUrl; String get channelId; List<String> get tokens; Map<String, dynamic> get data;
/// Create a copy of NotificationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationRequestCopyWith<NotificationRequest> get copyWith => _$NotificationRequestCopyWithImpl<NotificationRequest>(this as NotificationRequest, _$identity);

  /// Serializes this NotificationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&const DeepCollectionEquality().equals(other.tokens, tokens)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,body,imageUrl,channelId,const DeepCollectionEquality().hash(tokens),const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'NotificationRequest(title: $title, body: $body, imageUrl: $imageUrl, channelId: $channelId, tokens: $tokens, data: $data)';
}


}

/// @nodoc
abstract mixin class $NotificationRequestCopyWith<$Res>  {
  factory $NotificationRequestCopyWith(NotificationRequest value, $Res Function(NotificationRequest) _then) = _$NotificationRequestCopyWithImpl;
@useResult
$Res call({
 String title, String body, String? imageUrl, String channelId, List<String> tokens, Map<String, dynamic> data
});




}
/// @nodoc
class _$NotificationRequestCopyWithImpl<$Res>
    implements $NotificationRequestCopyWith<$Res> {
  _$NotificationRequestCopyWithImpl(this._self, this._then);

  final NotificationRequest _self;
  final $Res Function(NotificationRequest) _then;

/// Create a copy of NotificationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? body = null,Object? imageUrl = freezed,Object? channelId = null,Object? tokens = null,Object? data = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<String>,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationRequest].
extension NotificationRequestPatterns on NotificationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationRequest value)  $default,){
final _that = this;
switch (_that) {
case _NotificationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String body,  String? imageUrl,  String channelId,  List<String> tokens,  Map<String, dynamic> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationRequest() when $default != null:
return $default(_that.title,_that.body,_that.imageUrl,_that.channelId,_that.tokens,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String body,  String? imageUrl,  String channelId,  List<String> tokens,  Map<String, dynamic> data)  $default,) {final _that = this;
switch (_that) {
case _NotificationRequest():
return $default(_that.title,_that.body,_that.imageUrl,_that.channelId,_that.tokens,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String body,  String? imageUrl,  String channelId,  List<String> tokens,  Map<String, dynamic> data)?  $default,) {final _that = this;
switch (_that) {
case _NotificationRequest() when $default != null:
return $default(_that.title,_that.body,_that.imageUrl,_that.channelId,_that.tokens,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationRequest implements NotificationRequest {
  const _NotificationRequest({this.title = '', this.body = '', this.imageUrl, this.channelId = '', final  List<String> tokens = const [], final  Map<String, dynamic> data = const {}}): _tokens = tokens,_data = data;
  factory _NotificationRequest.fromJson(Map<String, dynamic> json) => _$NotificationRequestFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String body;
@override final  String? imageUrl;
@override@JsonKey() final  String channelId;
 final  List<String> _tokens;
@override@JsonKey() List<String> get tokens {
  if (_tokens is EqualUnmodifiableListView) return _tokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tokens);
}

 final  Map<String, dynamic> _data;
@override@JsonKey() Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of NotificationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationRequestCopyWith<_NotificationRequest> get copyWith => __$NotificationRequestCopyWithImpl<_NotificationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&const DeepCollectionEquality().equals(other._tokens, _tokens)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,body,imageUrl,channelId,const DeepCollectionEquality().hash(_tokens),const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'NotificationRequest(title: $title, body: $body, imageUrl: $imageUrl, channelId: $channelId, tokens: $tokens, data: $data)';
}


}

/// @nodoc
abstract mixin class _$NotificationRequestCopyWith<$Res> implements $NotificationRequestCopyWith<$Res> {
  factory _$NotificationRequestCopyWith(_NotificationRequest value, $Res Function(_NotificationRequest) _then) = __$NotificationRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String body, String? imageUrl, String channelId, List<String> tokens, Map<String, dynamic> data
});




}
/// @nodoc
class __$NotificationRequestCopyWithImpl<$Res>
    implements _$NotificationRequestCopyWith<$Res> {
  __$NotificationRequestCopyWithImpl(this._self, this._then);

  final _NotificationRequest _self;
  final $Res Function(_NotificationRequest) _then;

/// Create a copy of NotificationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? body = null,Object? imageUrl = freezed,Object? channelId = null,Object? tokens = null,Object? data = null,}) {
  return _then(_NotificationRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String,tokens: null == tokens ? _self._tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<String>,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
