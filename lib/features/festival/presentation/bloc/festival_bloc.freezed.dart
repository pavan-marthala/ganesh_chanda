// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'festival_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FestivalEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FestivalEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FestivalEvent()';
}


}

/// @nodoc
class $FestivalEventCopyWith<$Res>  {
$FestivalEventCopyWith(FestivalEvent _, $Res Function(FestivalEvent) __);
}


/// Adds pattern-matching-related methods to [FestivalEvent].
extension FestivalEventPatterns on FestivalEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetFestivalByIdRequested value)?  getFestivalByIdRequested,TResult Function( _LoadFestivalsRequested value)?  loadFestivalsRequested,TResult Function( _CreateFestivalRequested value)?  createFestivalRequested,TResult Function( _UpdateFestivalRequested value)?  updateFestivalRequested,TResult Function( _DeleteFestivalRequested value)?  deleteFestivalRequested,TResult Function( _AssignVolunteerRequested value)?  assignVolunteerRequested,TResult Function( _RemoveVolunteerRequested value)?  removeVolunteerRequested,TResult Function( _UpdateSummary value)?  updateSummary,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetFestivalByIdRequested() when getFestivalByIdRequested != null:
return getFestivalByIdRequested(_that);case _LoadFestivalsRequested() when loadFestivalsRequested != null:
return loadFestivalsRequested(_that);case _CreateFestivalRequested() when createFestivalRequested != null:
return createFestivalRequested(_that);case _UpdateFestivalRequested() when updateFestivalRequested != null:
return updateFestivalRequested(_that);case _DeleteFestivalRequested() when deleteFestivalRequested != null:
return deleteFestivalRequested(_that);case _AssignVolunteerRequested() when assignVolunteerRequested != null:
return assignVolunteerRequested(_that);case _RemoveVolunteerRequested() when removeVolunteerRequested != null:
return removeVolunteerRequested(_that);case _UpdateSummary() when updateSummary != null:
return updateSummary(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetFestivalByIdRequested value)  getFestivalByIdRequested,required TResult Function( _LoadFestivalsRequested value)  loadFestivalsRequested,required TResult Function( _CreateFestivalRequested value)  createFestivalRequested,required TResult Function( _UpdateFestivalRequested value)  updateFestivalRequested,required TResult Function( _DeleteFestivalRequested value)  deleteFestivalRequested,required TResult Function( _AssignVolunteerRequested value)  assignVolunteerRequested,required TResult Function( _RemoveVolunteerRequested value)  removeVolunteerRequested,required TResult Function( _UpdateSummary value)  updateSummary,}){
final _that = this;
switch (_that) {
case _GetFestivalByIdRequested():
return getFestivalByIdRequested(_that);case _LoadFestivalsRequested():
return loadFestivalsRequested(_that);case _CreateFestivalRequested():
return createFestivalRequested(_that);case _UpdateFestivalRequested():
return updateFestivalRequested(_that);case _DeleteFestivalRequested():
return deleteFestivalRequested(_that);case _AssignVolunteerRequested():
return assignVolunteerRequested(_that);case _RemoveVolunteerRequested():
return removeVolunteerRequested(_that);case _UpdateSummary():
return updateSummary(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetFestivalByIdRequested value)?  getFestivalByIdRequested,TResult? Function( _LoadFestivalsRequested value)?  loadFestivalsRequested,TResult? Function( _CreateFestivalRequested value)?  createFestivalRequested,TResult? Function( _UpdateFestivalRequested value)?  updateFestivalRequested,TResult? Function( _DeleteFestivalRequested value)?  deleteFestivalRequested,TResult? Function( _AssignVolunteerRequested value)?  assignVolunteerRequested,TResult? Function( _RemoveVolunteerRequested value)?  removeVolunteerRequested,TResult? Function( _UpdateSummary value)?  updateSummary,}){
final _that = this;
switch (_that) {
case _GetFestivalByIdRequested() when getFestivalByIdRequested != null:
return getFestivalByIdRequested(_that);case _LoadFestivalsRequested() when loadFestivalsRequested != null:
return loadFestivalsRequested(_that);case _CreateFestivalRequested() when createFestivalRequested != null:
return createFestivalRequested(_that);case _UpdateFestivalRequested() when updateFestivalRequested != null:
return updateFestivalRequested(_that);case _DeleteFestivalRequested() when deleteFestivalRequested != null:
return deleteFestivalRequested(_that);case _AssignVolunteerRequested() when assignVolunteerRequested != null:
return assignVolunteerRequested(_that);case _RemoveVolunteerRequested() when removeVolunteerRequested != null:
return removeVolunteerRequested(_that);case _UpdateSummary() when updateSummary != null:
return updateSummary(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String festivalId)?  getFestivalByIdRequested,TResult Function( String communityId)?  loadFestivalsRequested,TResult Function( Festival festival)?  createFestivalRequested,TResult Function( Festival festival,  String communityId)?  updateFestivalRequested,TResult Function( String festivalId,  String communityId)?  deleteFestivalRequested,TResult Function( String festivalId,  String volunteerId,  String communityId)?  assignVolunteerRequested,TResult Function( String festivalId,  String volunteerId,  String communityId)?  removeVolunteerRequested,TResult Function()?  updateSummary,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetFestivalByIdRequested() when getFestivalByIdRequested != null:
return getFestivalByIdRequested(_that.festivalId);case _LoadFestivalsRequested() when loadFestivalsRequested != null:
return loadFestivalsRequested(_that.communityId);case _CreateFestivalRequested() when createFestivalRequested != null:
return createFestivalRequested(_that.festival);case _UpdateFestivalRequested() when updateFestivalRequested != null:
return updateFestivalRequested(_that.festival,_that.communityId);case _DeleteFestivalRequested() when deleteFestivalRequested != null:
return deleteFestivalRequested(_that.festivalId,_that.communityId);case _AssignVolunteerRequested() when assignVolunteerRequested != null:
return assignVolunteerRequested(_that.festivalId,_that.volunteerId,_that.communityId);case _RemoveVolunteerRequested() when removeVolunteerRequested != null:
return removeVolunteerRequested(_that.festivalId,_that.volunteerId,_that.communityId);case _UpdateSummary() when updateSummary != null:
return updateSummary();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String festivalId)  getFestivalByIdRequested,required TResult Function( String communityId)  loadFestivalsRequested,required TResult Function( Festival festival)  createFestivalRequested,required TResult Function( Festival festival,  String communityId)  updateFestivalRequested,required TResult Function( String festivalId,  String communityId)  deleteFestivalRequested,required TResult Function( String festivalId,  String volunteerId,  String communityId)  assignVolunteerRequested,required TResult Function( String festivalId,  String volunteerId,  String communityId)  removeVolunteerRequested,required TResult Function()  updateSummary,}) {final _that = this;
switch (_that) {
case _GetFestivalByIdRequested():
return getFestivalByIdRequested(_that.festivalId);case _LoadFestivalsRequested():
return loadFestivalsRequested(_that.communityId);case _CreateFestivalRequested():
return createFestivalRequested(_that.festival);case _UpdateFestivalRequested():
return updateFestivalRequested(_that.festival,_that.communityId);case _DeleteFestivalRequested():
return deleteFestivalRequested(_that.festivalId,_that.communityId);case _AssignVolunteerRequested():
return assignVolunteerRequested(_that.festivalId,_that.volunteerId,_that.communityId);case _RemoveVolunteerRequested():
return removeVolunteerRequested(_that.festivalId,_that.volunteerId,_that.communityId);case _UpdateSummary():
return updateSummary();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String festivalId)?  getFestivalByIdRequested,TResult? Function( String communityId)?  loadFestivalsRequested,TResult? Function( Festival festival)?  createFestivalRequested,TResult? Function( Festival festival,  String communityId)?  updateFestivalRequested,TResult? Function( String festivalId,  String communityId)?  deleteFestivalRequested,TResult? Function( String festivalId,  String volunteerId,  String communityId)?  assignVolunteerRequested,TResult? Function( String festivalId,  String volunteerId,  String communityId)?  removeVolunteerRequested,TResult? Function()?  updateSummary,}) {final _that = this;
switch (_that) {
case _GetFestivalByIdRequested() when getFestivalByIdRequested != null:
return getFestivalByIdRequested(_that.festivalId);case _LoadFestivalsRequested() when loadFestivalsRequested != null:
return loadFestivalsRequested(_that.communityId);case _CreateFestivalRequested() when createFestivalRequested != null:
return createFestivalRequested(_that.festival);case _UpdateFestivalRequested() when updateFestivalRequested != null:
return updateFestivalRequested(_that.festival,_that.communityId);case _DeleteFestivalRequested() when deleteFestivalRequested != null:
return deleteFestivalRequested(_that.festivalId,_that.communityId);case _AssignVolunteerRequested() when assignVolunteerRequested != null:
return assignVolunteerRequested(_that.festivalId,_that.volunteerId,_that.communityId);case _RemoveVolunteerRequested() when removeVolunteerRequested != null:
return removeVolunteerRequested(_that.festivalId,_that.volunteerId,_that.communityId);case _UpdateSummary() when updateSummary != null:
return updateSummary();case _:
  return null;

}
}

}

/// @nodoc


class _GetFestivalByIdRequested implements FestivalEvent {
  const _GetFestivalByIdRequested(this.festivalId);
  

 final  String festivalId;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetFestivalByIdRequestedCopyWith<_GetFestivalByIdRequested> get copyWith => __$GetFestivalByIdRequestedCopyWithImpl<_GetFestivalByIdRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetFestivalByIdRequested&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId));
}


@override
int get hashCode => Object.hash(runtimeType,festivalId);

@override
String toString() {
  return 'FestivalEvent.getFestivalByIdRequested(festivalId: $festivalId)';
}


}

/// @nodoc
abstract mixin class _$GetFestivalByIdRequestedCopyWith<$Res> implements $FestivalEventCopyWith<$Res> {
  factory _$GetFestivalByIdRequestedCopyWith(_GetFestivalByIdRequested value, $Res Function(_GetFestivalByIdRequested) _then) = __$GetFestivalByIdRequestedCopyWithImpl;
@useResult
$Res call({
 String festivalId
});




}
/// @nodoc
class __$GetFestivalByIdRequestedCopyWithImpl<$Res>
    implements _$GetFestivalByIdRequestedCopyWith<$Res> {
  __$GetFestivalByIdRequestedCopyWithImpl(this._self, this._then);

  final _GetFestivalByIdRequested _self;
  final $Res Function(_GetFestivalByIdRequested) _then;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? festivalId = null,}) {
  return _then(_GetFestivalByIdRequested(
null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadFestivalsRequested implements FestivalEvent {
  const _LoadFestivalsRequested(this.communityId);
  

 final  String communityId;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadFestivalsRequestedCopyWith<_LoadFestivalsRequested> get copyWith => __$LoadFestivalsRequestedCopyWithImpl<_LoadFestivalsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadFestivalsRequested&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,communityId);

@override
String toString() {
  return 'FestivalEvent.loadFestivalsRequested(communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$LoadFestivalsRequestedCopyWith<$Res> implements $FestivalEventCopyWith<$Res> {
  factory _$LoadFestivalsRequestedCopyWith(_LoadFestivalsRequested value, $Res Function(_LoadFestivalsRequested) _then) = __$LoadFestivalsRequestedCopyWithImpl;
@useResult
$Res call({
 String communityId
});




}
/// @nodoc
class __$LoadFestivalsRequestedCopyWithImpl<$Res>
    implements _$LoadFestivalsRequestedCopyWith<$Res> {
  __$LoadFestivalsRequestedCopyWithImpl(this._self, this._then);

  final _LoadFestivalsRequested _self;
  final $Res Function(_LoadFestivalsRequested) _then;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? communityId = null,}) {
  return _then(_LoadFestivalsRequested(
null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CreateFestivalRequested implements FestivalEvent {
  const _CreateFestivalRequested({required this.festival});
  

 final  Festival festival;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateFestivalRequestedCopyWith<_CreateFestivalRequested> get copyWith => __$CreateFestivalRequestedCopyWithImpl<_CreateFestivalRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateFestivalRequested&&(identical(other.festival, festival) || other.festival == festival));
}


@override
int get hashCode => Object.hash(runtimeType,festival);

@override
String toString() {
  return 'FestivalEvent.createFestivalRequested(festival: $festival)';
}


}

/// @nodoc
abstract mixin class _$CreateFestivalRequestedCopyWith<$Res> implements $FestivalEventCopyWith<$Res> {
  factory _$CreateFestivalRequestedCopyWith(_CreateFestivalRequested value, $Res Function(_CreateFestivalRequested) _then) = __$CreateFestivalRequestedCopyWithImpl;
@useResult
$Res call({
 Festival festival
});


$FestivalCopyWith<$Res> get festival;

}
/// @nodoc
class __$CreateFestivalRequestedCopyWithImpl<$Res>
    implements _$CreateFestivalRequestedCopyWith<$Res> {
  __$CreateFestivalRequestedCopyWithImpl(this._self, this._then);

  final _CreateFestivalRequested _self;
  final $Res Function(_CreateFestivalRequested) _then;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? festival = null,}) {
  return _then(_CreateFestivalRequested(
festival: null == festival ? _self.festival : festival // ignore: cast_nullable_to_non_nullable
as Festival,
  ));
}

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FestivalCopyWith<$Res> get festival {
  
  return $FestivalCopyWith<$Res>(_self.festival, (value) {
    return _then(_self.copyWith(festival: value));
  });
}
}

/// @nodoc


class _UpdateFestivalRequested implements FestivalEvent {
  const _UpdateFestivalRequested({required this.festival, required this.communityId});
  

 final  Festival festival;
 final  String communityId;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFestivalRequestedCopyWith<_UpdateFestivalRequested> get copyWith => __$UpdateFestivalRequestedCopyWithImpl<_UpdateFestivalRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateFestivalRequested&&(identical(other.festival, festival) || other.festival == festival)&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,festival,communityId);

@override
String toString() {
  return 'FestivalEvent.updateFestivalRequested(festival: $festival, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$UpdateFestivalRequestedCopyWith<$Res> implements $FestivalEventCopyWith<$Res> {
  factory _$UpdateFestivalRequestedCopyWith(_UpdateFestivalRequested value, $Res Function(_UpdateFestivalRequested) _then) = __$UpdateFestivalRequestedCopyWithImpl;
@useResult
$Res call({
 Festival festival, String communityId
});


$FestivalCopyWith<$Res> get festival;

}
/// @nodoc
class __$UpdateFestivalRequestedCopyWithImpl<$Res>
    implements _$UpdateFestivalRequestedCopyWith<$Res> {
  __$UpdateFestivalRequestedCopyWithImpl(this._self, this._then);

  final _UpdateFestivalRequested _self;
  final $Res Function(_UpdateFestivalRequested) _then;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? festival = null,Object? communityId = null,}) {
  return _then(_UpdateFestivalRequested(
festival: null == festival ? _self.festival : festival // ignore: cast_nullable_to_non_nullable
as Festival,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FestivalCopyWith<$Res> get festival {
  
  return $FestivalCopyWith<$Res>(_self.festival, (value) {
    return _then(_self.copyWith(festival: value));
  });
}
}

/// @nodoc


class _DeleteFestivalRequested implements FestivalEvent {
  const _DeleteFestivalRequested({required this.festivalId, required this.communityId});
  

 final  String festivalId;
 final  String communityId;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteFestivalRequestedCopyWith<_DeleteFestivalRequested> get copyWith => __$DeleteFestivalRequestedCopyWithImpl<_DeleteFestivalRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteFestivalRequested&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId)&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,festivalId,communityId);

@override
String toString() {
  return 'FestivalEvent.deleteFestivalRequested(festivalId: $festivalId, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$DeleteFestivalRequestedCopyWith<$Res> implements $FestivalEventCopyWith<$Res> {
  factory _$DeleteFestivalRequestedCopyWith(_DeleteFestivalRequested value, $Res Function(_DeleteFestivalRequested) _then) = __$DeleteFestivalRequestedCopyWithImpl;
@useResult
$Res call({
 String festivalId, String communityId
});




}
/// @nodoc
class __$DeleteFestivalRequestedCopyWithImpl<$Res>
    implements _$DeleteFestivalRequestedCopyWith<$Res> {
  __$DeleteFestivalRequestedCopyWithImpl(this._self, this._then);

  final _DeleteFestivalRequested _self;
  final $Res Function(_DeleteFestivalRequested) _then;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? festivalId = null,Object? communityId = null,}) {
  return _then(_DeleteFestivalRequested(
festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AssignVolunteerRequested implements FestivalEvent {
  const _AssignVolunteerRequested({required this.festivalId, required this.volunteerId, required this.communityId});
  

 final  String festivalId;
 final  String volunteerId;
 final  String communityId;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignVolunteerRequestedCopyWith<_AssignVolunteerRequested> get copyWith => __$AssignVolunteerRequestedCopyWithImpl<_AssignVolunteerRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignVolunteerRequested&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId)&&(identical(other.volunteerId, volunteerId) || other.volunteerId == volunteerId)&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,festivalId,volunteerId,communityId);

@override
String toString() {
  return 'FestivalEvent.assignVolunteerRequested(festivalId: $festivalId, volunteerId: $volunteerId, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$AssignVolunteerRequestedCopyWith<$Res> implements $FestivalEventCopyWith<$Res> {
  factory _$AssignVolunteerRequestedCopyWith(_AssignVolunteerRequested value, $Res Function(_AssignVolunteerRequested) _then) = __$AssignVolunteerRequestedCopyWithImpl;
@useResult
$Res call({
 String festivalId, String volunteerId, String communityId
});




}
/// @nodoc
class __$AssignVolunteerRequestedCopyWithImpl<$Res>
    implements _$AssignVolunteerRequestedCopyWith<$Res> {
  __$AssignVolunteerRequestedCopyWithImpl(this._self, this._then);

  final _AssignVolunteerRequested _self;
  final $Res Function(_AssignVolunteerRequested) _then;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? festivalId = null,Object? volunteerId = null,Object? communityId = null,}) {
  return _then(_AssignVolunteerRequested(
festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,volunteerId: null == volunteerId ? _self.volunteerId : volunteerId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RemoveVolunteerRequested implements FestivalEvent {
  const _RemoveVolunteerRequested({required this.festivalId, required this.volunteerId, required this.communityId});
  

 final  String festivalId;
 final  String volunteerId;
 final  String communityId;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveVolunteerRequestedCopyWith<_RemoveVolunteerRequested> get copyWith => __$RemoveVolunteerRequestedCopyWithImpl<_RemoveVolunteerRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveVolunteerRequested&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId)&&(identical(other.volunteerId, volunteerId) || other.volunteerId == volunteerId)&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,festivalId,volunteerId,communityId);

@override
String toString() {
  return 'FestivalEvent.removeVolunteerRequested(festivalId: $festivalId, volunteerId: $volunteerId, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$RemoveVolunteerRequestedCopyWith<$Res> implements $FestivalEventCopyWith<$Res> {
  factory _$RemoveVolunteerRequestedCopyWith(_RemoveVolunteerRequested value, $Res Function(_RemoveVolunteerRequested) _then) = __$RemoveVolunteerRequestedCopyWithImpl;
@useResult
$Res call({
 String festivalId, String volunteerId, String communityId
});




}
/// @nodoc
class __$RemoveVolunteerRequestedCopyWithImpl<$Res>
    implements _$RemoveVolunteerRequestedCopyWith<$Res> {
  __$RemoveVolunteerRequestedCopyWithImpl(this._self, this._then);

  final _RemoveVolunteerRequested _self;
  final $Res Function(_RemoveVolunteerRequested) _then;

/// Create a copy of FestivalEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? festivalId = null,Object? volunteerId = null,Object? communityId = null,}) {
  return _then(_RemoveVolunteerRequested(
festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,volunteerId: null == volunteerId ? _self.volunteerId : volunteerId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateSummary implements FestivalEvent {
  const _UpdateSummary();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSummary);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FestivalEvent.updateSummary()';
}


}




/// @nodoc
mixin _$FestivalState {

 List<Festival> get festivals; StateStatus get festivalsStatus; String? get festivalsError; Festival? get festival; StateStatus get festivalStatus; String? get festivalError; StateStatus get festivalActionStatus; String? get festivalActionError;
/// Create a copy of FestivalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FestivalStateCopyWith<FestivalState> get copyWith => _$FestivalStateCopyWithImpl<FestivalState>(this as FestivalState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FestivalState&&const DeepCollectionEquality().equals(other.festivals, festivals)&&(identical(other.festivalsStatus, festivalsStatus) || other.festivalsStatus == festivalsStatus)&&(identical(other.festivalsError, festivalsError) || other.festivalsError == festivalsError)&&(identical(other.festival, festival) || other.festival == festival)&&(identical(other.festivalStatus, festivalStatus) || other.festivalStatus == festivalStatus)&&(identical(other.festivalError, festivalError) || other.festivalError == festivalError)&&(identical(other.festivalActionStatus, festivalActionStatus) || other.festivalActionStatus == festivalActionStatus)&&(identical(other.festivalActionError, festivalActionError) || other.festivalActionError == festivalActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(festivals),festivalsStatus,festivalsError,festival,festivalStatus,festivalError,festivalActionStatus,festivalActionError);

@override
String toString() {
  return 'FestivalState(festivals: $festivals, festivalsStatus: $festivalsStatus, festivalsError: $festivalsError, festival: $festival, festivalStatus: $festivalStatus, festivalError: $festivalError, festivalActionStatus: $festivalActionStatus, festivalActionError: $festivalActionError)';
}


}

/// @nodoc
abstract mixin class $FestivalStateCopyWith<$Res>  {
  factory $FestivalStateCopyWith(FestivalState value, $Res Function(FestivalState) _then) = _$FestivalStateCopyWithImpl;
@useResult
$Res call({
 List<Festival> festivals, StateStatus festivalsStatus, String? festivalsError, Festival? festival, StateStatus festivalStatus, String? festivalError, StateStatus festivalActionStatus, String? festivalActionError
});


$FestivalCopyWith<$Res>? get festival;

}
/// @nodoc
class _$FestivalStateCopyWithImpl<$Res>
    implements $FestivalStateCopyWith<$Res> {
  _$FestivalStateCopyWithImpl(this._self, this._then);

  final FestivalState _self;
  final $Res Function(FestivalState) _then;

/// Create a copy of FestivalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? festivals = null,Object? festivalsStatus = null,Object? festivalsError = freezed,Object? festival = freezed,Object? festivalStatus = null,Object? festivalError = freezed,Object? festivalActionStatus = null,Object? festivalActionError = freezed,}) {
  return _then(_self.copyWith(
festivals: null == festivals ? _self.festivals : festivals // ignore: cast_nullable_to_non_nullable
as List<Festival>,festivalsStatus: null == festivalsStatus ? _self.festivalsStatus : festivalsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,festivalsError: freezed == festivalsError ? _self.festivalsError : festivalsError // ignore: cast_nullable_to_non_nullable
as String?,festival: freezed == festival ? _self.festival : festival // ignore: cast_nullable_to_non_nullable
as Festival?,festivalStatus: null == festivalStatus ? _self.festivalStatus : festivalStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,festivalError: freezed == festivalError ? _self.festivalError : festivalError // ignore: cast_nullable_to_non_nullable
as String?,festivalActionStatus: null == festivalActionStatus ? _self.festivalActionStatus : festivalActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,festivalActionError: freezed == festivalActionError ? _self.festivalActionError : festivalActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FestivalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FestivalCopyWith<$Res>? get festival {
    if (_self.festival == null) {
    return null;
  }

  return $FestivalCopyWith<$Res>(_self.festival!, (value) {
    return _then(_self.copyWith(festival: value));
  });
}
}


/// Adds pattern-matching-related methods to [FestivalState].
extension FestivalStatePatterns on FestivalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FestivalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FestivalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FestivalState value)  $default,){
final _that = this;
switch (_that) {
case _FestivalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FestivalState value)?  $default,){
final _that = this;
switch (_that) {
case _FestivalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Festival> festivals,  StateStatus festivalsStatus,  String? festivalsError,  Festival? festival,  StateStatus festivalStatus,  String? festivalError,  StateStatus festivalActionStatus,  String? festivalActionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FestivalState() when $default != null:
return $default(_that.festivals,_that.festivalsStatus,_that.festivalsError,_that.festival,_that.festivalStatus,_that.festivalError,_that.festivalActionStatus,_that.festivalActionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Festival> festivals,  StateStatus festivalsStatus,  String? festivalsError,  Festival? festival,  StateStatus festivalStatus,  String? festivalError,  StateStatus festivalActionStatus,  String? festivalActionError)  $default,) {final _that = this;
switch (_that) {
case _FestivalState():
return $default(_that.festivals,_that.festivalsStatus,_that.festivalsError,_that.festival,_that.festivalStatus,_that.festivalError,_that.festivalActionStatus,_that.festivalActionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Festival> festivals,  StateStatus festivalsStatus,  String? festivalsError,  Festival? festival,  StateStatus festivalStatus,  String? festivalError,  StateStatus festivalActionStatus,  String? festivalActionError)?  $default,) {final _that = this;
switch (_that) {
case _FestivalState() when $default != null:
return $default(_that.festivals,_that.festivalsStatus,_that.festivalsError,_that.festival,_that.festivalStatus,_that.festivalError,_that.festivalActionStatus,_that.festivalActionError);case _:
  return null;

}
}

}

/// @nodoc


class _FestivalState implements FestivalState {
  const _FestivalState({final  List<Festival> festivals = const [], this.festivalsStatus = StateStatus.initial, this.festivalsError, this.festival, this.festivalStatus = StateStatus.initial, this.festivalError, this.festivalActionStatus = StateStatus.initial, this.festivalActionError}): _festivals = festivals;
  

 final  List<Festival> _festivals;
@override@JsonKey() List<Festival> get festivals {
  if (_festivals is EqualUnmodifiableListView) return _festivals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_festivals);
}

@override@JsonKey() final  StateStatus festivalsStatus;
@override final  String? festivalsError;
@override final  Festival? festival;
@override@JsonKey() final  StateStatus festivalStatus;
@override final  String? festivalError;
@override@JsonKey() final  StateStatus festivalActionStatus;
@override final  String? festivalActionError;

/// Create a copy of FestivalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FestivalStateCopyWith<_FestivalState> get copyWith => __$FestivalStateCopyWithImpl<_FestivalState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FestivalState&&const DeepCollectionEquality().equals(other._festivals, _festivals)&&(identical(other.festivalsStatus, festivalsStatus) || other.festivalsStatus == festivalsStatus)&&(identical(other.festivalsError, festivalsError) || other.festivalsError == festivalsError)&&(identical(other.festival, festival) || other.festival == festival)&&(identical(other.festivalStatus, festivalStatus) || other.festivalStatus == festivalStatus)&&(identical(other.festivalError, festivalError) || other.festivalError == festivalError)&&(identical(other.festivalActionStatus, festivalActionStatus) || other.festivalActionStatus == festivalActionStatus)&&(identical(other.festivalActionError, festivalActionError) || other.festivalActionError == festivalActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_festivals),festivalsStatus,festivalsError,festival,festivalStatus,festivalError,festivalActionStatus,festivalActionError);

@override
String toString() {
  return 'FestivalState(festivals: $festivals, festivalsStatus: $festivalsStatus, festivalsError: $festivalsError, festival: $festival, festivalStatus: $festivalStatus, festivalError: $festivalError, festivalActionStatus: $festivalActionStatus, festivalActionError: $festivalActionError)';
}


}

/// @nodoc
abstract mixin class _$FestivalStateCopyWith<$Res> implements $FestivalStateCopyWith<$Res> {
  factory _$FestivalStateCopyWith(_FestivalState value, $Res Function(_FestivalState) _then) = __$FestivalStateCopyWithImpl;
@override @useResult
$Res call({
 List<Festival> festivals, StateStatus festivalsStatus, String? festivalsError, Festival? festival, StateStatus festivalStatus, String? festivalError, StateStatus festivalActionStatus, String? festivalActionError
});


@override $FestivalCopyWith<$Res>? get festival;

}
/// @nodoc
class __$FestivalStateCopyWithImpl<$Res>
    implements _$FestivalStateCopyWith<$Res> {
  __$FestivalStateCopyWithImpl(this._self, this._then);

  final _FestivalState _self;
  final $Res Function(_FestivalState) _then;

/// Create a copy of FestivalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? festivals = null,Object? festivalsStatus = null,Object? festivalsError = freezed,Object? festival = freezed,Object? festivalStatus = null,Object? festivalError = freezed,Object? festivalActionStatus = null,Object? festivalActionError = freezed,}) {
  return _then(_FestivalState(
festivals: null == festivals ? _self._festivals : festivals // ignore: cast_nullable_to_non_nullable
as List<Festival>,festivalsStatus: null == festivalsStatus ? _self.festivalsStatus : festivalsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,festivalsError: freezed == festivalsError ? _self.festivalsError : festivalsError // ignore: cast_nullable_to_non_nullable
as String?,festival: freezed == festival ? _self.festival : festival // ignore: cast_nullable_to_non_nullable
as Festival?,festivalStatus: null == festivalStatus ? _self.festivalStatus : festivalStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,festivalError: freezed == festivalError ? _self.festivalError : festivalError // ignore: cast_nullable_to_non_nullable
as String?,festivalActionStatus: null == festivalActionStatus ? _self.festivalActionStatus : festivalActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,festivalActionError: freezed == festivalActionError ? _self.festivalActionError : festivalActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FestivalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FestivalCopyWith<$Res>? get festival {
    if (_self.festival == null) {
    return null;
  }

  return $FestivalCopyWith<$Res>(_self.festival!, (value) {
    return _then(_self.copyWith(festival: value));
  });
}
}

// dart format on
