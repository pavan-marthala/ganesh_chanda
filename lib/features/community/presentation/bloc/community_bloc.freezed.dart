// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommunityEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommunityEvent()';
}


}

/// @nodoc
class $CommunityEventCopyWith<$Res>  {
$CommunityEventCopyWith(CommunityEvent _, $Res Function(CommunityEvent) __);
}


/// Adds pattern-matching-related methods to [CommunityEvent].
extension CommunityEventPatterns on CommunityEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateCommunityRequested value)?  createCommunityRequested,TResult Function( _LoadCurrentCommunityRequested value)?  loadCurrentCommunityRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCommunityRequested() when createCommunityRequested != null:
return createCommunityRequested(_that);case _LoadCurrentCommunityRequested() when loadCurrentCommunityRequested != null:
return loadCurrentCommunityRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateCommunityRequested value)  createCommunityRequested,required TResult Function( _LoadCurrentCommunityRequested value)  loadCurrentCommunityRequested,}){
final _that = this;
switch (_that) {
case _CreateCommunityRequested():
return createCommunityRequested(_that);case _LoadCurrentCommunityRequested():
return loadCurrentCommunityRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateCommunityRequested value)?  createCommunityRequested,TResult? Function( _LoadCurrentCommunityRequested value)?  loadCurrentCommunityRequested,}){
final _that = this;
switch (_that) {
case _CreateCommunityRequested() when createCommunityRequested != null:
return createCommunityRequested(_that);case _LoadCurrentCommunityRequested() when loadCurrentCommunityRequested != null:
return loadCurrentCommunityRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Community community)?  createCommunityRequested,TResult Function()?  loadCurrentCommunityRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCommunityRequested() when createCommunityRequested != null:
return createCommunityRequested(_that.community);case _LoadCurrentCommunityRequested() when loadCurrentCommunityRequested != null:
return loadCurrentCommunityRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Community community)  createCommunityRequested,required TResult Function()  loadCurrentCommunityRequested,}) {final _that = this;
switch (_that) {
case _CreateCommunityRequested():
return createCommunityRequested(_that.community);case _LoadCurrentCommunityRequested():
return loadCurrentCommunityRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Community community)?  createCommunityRequested,TResult? Function()?  loadCurrentCommunityRequested,}) {final _that = this;
switch (_that) {
case _CreateCommunityRequested() when createCommunityRequested != null:
return createCommunityRequested(_that.community);case _LoadCurrentCommunityRequested() when loadCurrentCommunityRequested != null:
return loadCurrentCommunityRequested();case _:
  return null;

}
}

}

/// @nodoc


class _CreateCommunityRequested implements CommunityEvent {
  const _CreateCommunityRequested({required this.community});
  

 final  Community community;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCommunityRequestedCopyWith<_CreateCommunityRequested> get copyWith => __$CreateCommunityRequestedCopyWithImpl<_CreateCommunityRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCommunityRequested&&(identical(other.community, community) || other.community == community));
}


@override
int get hashCode => Object.hash(runtimeType,community);

@override
String toString() {
  return 'CommunityEvent.createCommunityRequested(community: $community)';
}


}

/// @nodoc
abstract mixin class _$CreateCommunityRequestedCopyWith<$Res> implements $CommunityEventCopyWith<$Res> {
  factory _$CreateCommunityRequestedCopyWith(_CreateCommunityRequested value, $Res Function(_CreateCommunityRequested) _then) = __$CreateCommunityRequestedCopyWithImpl;
@useResult
$Res call({
 Community community
});


$CommunityCopyWith<$Res> get community;

}
/// @nodoc
class __$CreateCommunityRequestedCopyWithImpl<$Res>
    implements _$CreateCommunityRequestedCopyWith<$Res> {
  __$CreateCommunityRequestedCopyWithImpl(this._self, this._then);

  final _CreateCommunityRequested _self;
  final $Res Function(_CreateCommunityRequested) _then;

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? community = null,}) {
  return _then(_CreateCommunityRequested(
community: null == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as Community,
  ));
}

/// Create a copy of CommunityEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityCopyWith<$Res> get community {
  
  return $CommunityCopyWith<$Res>(_self.community, (value) {
    return _then(_self.copyWith(community: value));
  });
}
}

/// @nodoc


class _LoadCurrentCommunityRequested implements CommunityEvent {
  const _LoadCurrentCommunityRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadCurrentCommunityRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommunityEvent.loadCurrentCommunityRequested()';
}


}




/// @nodoc
mixin _$CommunityState {

 Community? get community; StateStatus get communityStatus; String? get communityError;
/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityStateCopyWith<CommunityState> get copyWith => _$CommunityStateCopyWithImpl<CommunityState>(this as CommunityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityState&&(identical(other.community, community) || other.community == community)&&(identical(other.communityStatus, communityStatus) || other.communityStatus == communityStatus)&&(identical(other.communityError, communityError) || other.communityError == communityError));
}


@override
int get hashCode => Object.hash(runtimeType,community,communityStatus,communityError);

@override
String toString() {
  return 'CommunityState(community: $community, communityStatus: $communityStatus, communityError: $communityError)';
}


}

/// @nodoc
abstract mixin class $CommunityStateCopyWith<$Res>  {
  factory $CommunityStateCopyWith(CommunityState value, $Res Function(CommunityState) _then) = _$CommunityStateCopyWithImpl;
@useResult
$Res call({
 Community? community, StateStatus communityStatus, String? communityError
});


$CommunityCopyWith<$Res>? get community;

}
/// @nodoc
class _$CommunityStateCopyWithImpl<$Res>
    implements $CommunityStateCopyWith<$Res> {
  _$CommunityStateCopyWithImpl(this._self, this._then);

  final CommunityState _self;
  final $Res Function(CommunityState) _then;

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? community = freezed,Object? communityStatus = null,Object? communityError = freezed,}) {
  return _then(_self.copyWith(
community: freezed == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as Community?,communityStatus: null == communityStatus ? _self.communityStatus : communityStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,communityError: freezed == communityError ? _self.communityError : communityError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityCopyWith<$Res>? get community {
    if (_self.community == null) {
    return null;
  }

  return $CommunityCopyWith<$Res>(_self.community!, (value) {
    return _then(_self.copyWith(community: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommunityState].
extension CommunityStatePatterns on CommunityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityState value)  $default,){
final _that = this;
switch (_that) {
case _CommunityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityState value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Community? community,  StateStatus communityStatus,  String? communityError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
return $default(_that.community,_that.communityStatus,_that.communityError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Community? community,  StateStatus communityStatus,  String? communityError)  $default,) {final _that = this;
switch (_that) {
case _CommunityState():
return $default(_that.community,_that.communityStatus,_that.communityError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Community? community,  StateStatus communityStatus,  String? communityError)?  $default,) {final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
return $default(_that.community,_that.communityStatus,_that.communityError);case _:
  return null;

}
}

}

/// @nodoc


class _CommunityState implements CommunityState {
  const _CommunityState({this.community, this.communityStatus = StateStatus.initial, this.communityError});
  

@override final  Community? community;
@override@JsonKey() final  StateStatus communityStatus;
@override final  String? communityError;

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityStateCopyWith<_CommunityState> get copyWith => __$CommunityStateCopyWithImpl<_CommunityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityState&&(identical(other.community, community) || other.community == community)&&(identical(other.communityStatus, communityStatus) || other.communityStatus == communityStatus)&&(identical(other.communityError, communityError) || other.communityError == communityError));
}


@override
int get hashCode => Object.hash(runtimeType,community,communityStatus,communityError);

@override
String toString() {
  return 'CommunityState(community: $community, communityStatus: $communityStatus, communityError: $communityError)';
}


}

/// @nodoc
abstract mixin class _$CommunityStateCopyWith<$Res> implements $CommunityStateCopyWith<$Res> {
  factory _$CommunityStateCopyWith(_CommunityState value, $Res Function(_CommunityState) _then) = __$CommunityStateCopyWithImpl;
@override @useResult
$Res call({
 Community? community, StateStatus communityStatus, String? communityError
});


@override $CommunityCopyWith<$Res>? get community;

}
/// @nodoc
class __$CommunityStateCopyWithImpl<$Res>
    implements _$CommunityStateCopyWith<$Res> {
  __$CommunityStateCopyWithImpl(this._self, this._then);

  final _CommunityState _self;
  final $Res Function(_CommunityState) _then;

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? community = freezed,Object? communityStatus = null,Object? communityError = freezed,}) {
  return _then(_CommunityState(
community: freezed == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as Community?,communityStatus: null == communityStatus ? _self.communityStatus : communityStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,communityError: freezed == communityError ? _self.communityError : communityError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityCopyWith<$Res>? get community {
    if (_self.community == null) {
    return null;
  }

  return $CommunityCopyWith<$Res>(_self.community!, (value) {
    return _then(_self.copyWith(community: value));
  });
}
}

// dart format on
