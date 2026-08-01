// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VolunteerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolunteerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VolunteerEvent()';
}


}

/// @nodoc
class $VolunteerEventCopyWith<$Res>  {
$VolunteerEventCopyWith(VolunteerEvent _, $Res Function(VolunteerEvent) __);
}


/// Adds pattern-matching-related methods to [VolunteerEvent].
extension VolunteerEventPatterns on VolunteerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadVolunteersRequested value)?  loadVolunteersRequested,TResult Function( _LoadVolunteersByIdsRequested value)?  loadVolunteersByIdsRequested,TResult Function( _AddVolunteerRequested value)?  addVolunteerRequested,TResult Function( _UpdateVolunteerRequested value)?  updateVolunteerRequested,TResult Function( _ActivateVolunteerRequested value)?  activateVolunteerRequested,TResult Function( _DeactivateVolunteerRequested value)?  deactivateVolunteerRequested,TResult Function( _DeleteVolunteerRequested value)?  deleteVolunteerRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadVolunteersRequested() when loadVolunteersRequested != null:
return loadVolunteersRequested(_that);case _LoadVolunteersByIdsRequested() when loadVolunteersByIdsRequested != null:
return loadVolunteersByIdsRequested(_that);case _AddVolunteerRequested() when addVolunteerRequested != null:
return addVolunteerRequested(_that);case _UpdateVolunteerRequested() when updateVolunteerRequested != null:
return updateVolunteerRequested(_that);case _ActivateVolunteerRequested() when activateVolunteerRequested != null:
return activateVolunteerRequested(_that);case _DeactivateVolunteerRequested() when deactivateVolunteerRequested != null:
return deactivateVolunteerRequested(_that);case _DeleteVolunteerRequested() when deleteVolunteerRequested != null:
return deleteVolunteerRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadVolunteersRequested value)  loadVolunteersRequested,required TResult Function( _LoadVolunteersByIdsRequested value)  loadVolunteersByIdsRequested,required TResult Function( _AddVolunteerRequested value)  addVolunteerRequested,required TResult Function( _UpdateVolunteerRequested value)  updateVolunteerRequested,required TResult Function( _ActivateVolunteerRequested value)  activateVolunteerRequested,required TResult Function( _DeactivateVolunteerRequested value)  deactivateVolunteerRequested,required TResult Function( _DeleteVolunteerRequested value)  deleteVolunteerRequested,}){
final _that = this;
switch (_that) {
case _LoadVolunteersRequested():
return loadVolunteersRequested(_that);case _LoadVolunteersByIdsRequested():
return loadVolunteersByIdsRequested(_that);case _AddVolunteerRequested():
return addVolunteerRequested(_that);case _UpdateVolunteerRequested():
return updateVolunteerRequested(_that);case _ActivateVolunteerRequested():
return activateVolunteerRequested(_that);case _DeactivateVolunteerRequested():
return deactivateVolunteerRequested(_that);case _DeleteVolunteerRequested():
return deleteVolunteerRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadVolunteersRequested value)?  loadVolunteersRequested,TResult? Function( _LoadVolunteersByIdsRequested value)?  loadVolunteersByIdsRequested,TResult? Function( _AddVolunteerRequested value)?  addVolunteerRequested,TResult? Function( _UpdateVolunteerRequested value)?  updateVolunteerRequested,TResult? Function( _ActivateVolunteerRequested value)?  activateVolunteerRequested,TResult? Function( _DeactivateVolunteerRequested value)?  deactivateVolunteerRequested,TResult? Function( _DeleteVolunteerRequested value)?  deleteVolunteerRequested,}){
final _that = this;
switch (_that) {
case _LoadVolunteersRequested() when loadVolunteersRequested != null:
return loadVolunteersRequested(_that);case _LoadVolunteersByIdsRequested() when loadVolunteersByIdsRequested != null:
return loadVolunteersByIdsRequested(_that);case _AddVolunteerRequested() when addVolunteerRequested != null:
return addVolunteerRequested(_that);case _UpdateVolunteerRequested() when updateVolunteerRequested != null:
return updateVolunteerRequested(_that);case _ActivateVolunteerRequested() when activateVolunteerRequested != null:
return activateVolunteerRequested(_that);case _DeactivateVolunteerRequested() when deactivateVolunteerRequested != null:
return deactivateVolunteerRequested(_that);case _DeleteVolunteerRequested() when deleteVolunteerRequested != null:
return deleteVolunteerRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String communityId)?  loadVolunteersRequested,TResult Function( List<String> volunteerIds)?  loadVolunteersByIdsRequested,TResult Function( AppUser volunteer,  String communityId)?  addVolunteerRequested,TResult Function( AppUser volunteer,  String communityId)?  updateVolunteerRequested,TResult Function( String userId,  String communityId)?  activateVolunteerRequested,TResult Function( String userId,  String communityId)?  deactivateVolunteerRequested,TResult Function( String userId,  String communityId)?  deleteVolunteerRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadVolunteersRequested() when loadVolunteersRequested != null:
return loadVolunteersRequested(_that.communityId);case _LoadVolunteersByIdsRequested() when loadVolunteersByIdsRequested != null:
return loadVolunteersByIdsRequested(_that.volunteerIds);case _AddVolunteerRequested() when addVolunteerRequested != null:
return addVolunteerRequested(_that.volunteer,_that.communityId);case _UpdateVolunteerRequested() when updateVolunteerRequested != null:
return updateVolunteerRequested(_that.volunteer,_that.communityId);case _ActivateVolunteerRequested() when activateVolunteerRequested != null:
return activateVolunteerRequested(_that.userId,_that.communityId);case _DeactivateVolunteerRequested() when deactivateVolunteerRequested != null:
return deactivateVolunteerRequested(_that.userId,_that.communityId);case _DeleteVolunteerRequested() when deleteVolunteerRequested != null:
return deleteVolunteerRequested(_that.userId,_that.communityId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String communityId)  loadVolunteersRequested,required TResult Function( List<String> volunteerIds)  loadVolunteersByIdsRequested,required TResult Function( AppUser volunteer,  String communityId)  addVolunteerRequested,required TResult Function( AppUser volunteer,  String communityId)  updateVolunteerRequested,required TResult Function( String userId,  String communityId)  activateVolunteerRequested,required TResult Function( String userId,  String communityId)  deactivateVolunteerRequested,required TResult Function( String userId,  String communityId)  deleteVolunteerRequested,}) {final _that = this;
switch (_that) {
case _LoadVolunteersRequested():
return loadVolunteersRequested(_that.communityId);case _LoadVolunteersByIdsRequested():
return loadVolunteersByIdsRequested(_that.volunteerIds);case _AddVolunteerRequested():
return addVolunteerRequested(_that.volunteer,_that.communityId);case _UpdateVolunteerRequested():
return updateVolunteerRequested(_that.volunteer,_that.communityId);case _ActivateVolunteerRequested():
return activateVolunteerRequested(_that.userId,_that.communityId);case _DeactivateVolunteerRequested():
return deactivateVolunteerRequested(_that.userId,_that.communityId);case _DeleteVolunteerRequested():
return deleteVolunteerRequested(_that.userId,_that.communityId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String communityId)?  loadVolunteersRequested,TResult? Function( List<String> volunteerIds)?  loadVolunteersByIdsRequested,TResult? Function( AppUser volunteer,  String communityId)?  addVolunteerRequested,TResult? Function( AppUser volunteer,  String communityId)?  updateVolunteerRequested,TResult? Function( String userId,  String communityId)?  activateVolunteerRequested,TResult? Function( String userId,  String communityId)?  deactivateVolunteerRequested,TResult? Function( String userId,  String communityId)?  deleteVolunteerRequested,}) {final _that = this;
switch (_that) {
case _LoadVolunteersRequested() when loadVolunteersRequested != null:
return loadVolunteersRequested(_that.communityId);case _LoadVolunteersByIdsRequested() when loadVolunteersByIdsRequested != null:
return loadVolunteersByIdsRequested(_that.volunteerIds);case _AddVolunteerRequested() when addVolunteerRequested != null:
return addVolunteerRequested(_that.volunteer,_that.communityId);case _UpdateVolunteerRequested() when updateVolunteerRequested != null:
return updateVolunteerRequested(_that.volunteer,_that.communityId);case _ActivateVolunteerRequested() when activateVolunteerRequested != null:
return activateVolunteerRequested(_that.userId,_that.communityId);case _DeactivateVolunteerRequested() when deactivateVolunteerRequested != null:
return deactivateVolunteerRequested(_that.userId,_that.communityId);case _DeleteVolunteerRequested() when deleteVolunteerRequested != null:
return deleteVolunteerRequested(_that.userId,_that.communityId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadVolunteersRequested implements VolunteerEvent {
  const _LoadVolunteersRequested({required this.communityId});
  

 final  String communityId;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadVolunteersRequestedCopyWith<_LoadVolunteersRequested> get copyWith => __$LoadVolunteersRequestedCopyWithImpl<_LoadVolunteersRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadVolunteersRequested&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,communityId);

@override
String toString() {
  return 'VolunteerEvent.loadVolunteersRequested(communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$LoadVolunteersRequestedCopyWith<$Res> implements $VolunteerEventCopyWith<$Res> {
  factory _$LoadVolunteersRequestedCopyWith(_LoadVolunteersRequested value, $Res Function(_LoadVolunteersRequested) _then) = __$LoadVolunteersRequestedCopyWithImpl;
@useResult
$Res call({
 String communityId
});




}
/// @nodoc
class __$LoadVolunteersRequestedCopyWithImpl<$Res>
    implements _$LoadVolunteersRequestedCopyWith<$Res> {
  __$LoadVolunteersRequestedCopyWithImpl(this._self, this._then);

  final _LoadVolunteersRequested _self;
  final $Res Function(_LoadVolunteersRequested) _then;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? communityId = null,}) {
  return _then(_LoadVolunteersRequested(
communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadVolunteersByIdsRequested implements VolunteerEvent {
  const _LoadVolunteersByIdsRequested({required final  List<String> volunteerIds}): _volunteerIds = volunteerIds;
  

 final  List<String> _volunteerIds;
 List<String> get volunteerIds {
  if (_volunteerIds is EqualUnmodifiableListView) return _volunteerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volunteerIds);
}


/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadVolunteersByIdsRequestedCopyWith<_LoadVolunteersByIdsRequested> get copyWith => __$LoadVolunteersByIdsRequestedCopyWithImpl<_LoadVolunteersByIdsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadVolunteersByIdsRequested&&const DeepCollectionEquality().equals(other._volunteerIds, _volunteerIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_volunteerIds));

@override
String toString() {
  return 'VolunteerEvent.loadVolunteersByIdsRequested(volunteerIds: $volunteerIds)';
}


}

/// @nodoc
abstract mixin class _$LoadVolunteersByIdsRequestedCopyWith<$Res> implements $VolunteerEventCopyWith<$Res> {
  factory _$LoadVolunteersByIdsRequestedCopyWith(_LoadVolunteersByIdsRequested value, $Res Function(_LoadVolunteersByIdsRequested) _then) = __$LoadVolunteersByIdsRequestedCopyWithImpl;
@useResult
$Res call({
 List<String> volunteerIds
});




}
/// @nodoc
class __$LoadVolunteersByIdsRequestedCopyWithImpl<$Res>
    implements _$LoadVolunteersByIdsRequestedCopyWith<$Res> {
  __$LoadVolunteersByIdsRequestedCopyWithImpl(this._self, this._then);

  final _LoadVolunteersByIdsRequested _self;
  final $Res Function(_LoadVolunteersByIdsRequested) _then;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? volunteerIds = null,}) {
  return _then(_LoadVolunteersByIdsRequested(
volunteerIds: null == volunteerIds ? _self._volunteerIds : volunteerIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class _AddVolunteerRequested implements VolunteerEvent {
  const _AddVolunteerRequested({required this.volunteer, required this.communityId});
  

 final  AppUser volunteer;
 final  String communityId;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddVolunteerRequestedCopyWith<_AddVolunteerRequested> get copyWith => __$AddVolunteerRequestedCopyWithImpl<_AddVolunteerRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVolunteerRequested&&(identical(other.volunteer, volunteer) || other.volunteer == volunteer)&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,volunteer,communityId);

@override
String toString() {
  return 'VolunteerEvent.addVolunteerRequested(volunteer: $volunteer, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$AddVolunteerRequestedCopyWith<$Res> implements $VolunteerEventCopyWith<$Res> {
  factory _$AddVolunteerRequestedCopyWith(_AddVolunteerRequested value, $Res Function(_AddVolunteerRequested) _then) = __$AddVolunteerRequestedCopyWithImpl;
@useResult
$Res call({
 AppUser volunteer, String communityId
});


$AppUserCopyWith<$Res> get volunteer;

}
/// @nodoc
class __$AddVolunteerRequestedCopyWithImpl<$Res>
    implements _$AddVolunteerRequestedCopyWith<$Res> {
  __$AddVolunteerRequestedCopyWithImpl(this._self, this._then);

  final _AddVolunteerRequested _self;
  final $Res Function(_AddVolunteerRequested) _then;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? volunteer = null,Object? communityId = null,}) {
  return _then(_AddVolunteerRequested(
volunteer: null == volunteer ? _self.volunteer : volunteer // ignore: cast_nullable_to_non_nullable
as AppUser,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res> get volunteer {
  
  return $AppUserCopyWith<$Res>(_self.volunteer, (value) {
    return _then(_self.copyWith(volunteer: value));
  });
}
}

/// @nodoc


class _UpdateVolunteerRequested implements VolunteerEvent {
  const _UpdateVolunteerRequested({required this.volunteer, required this.communityId});
  

 final  AppUser volunteer;
 final  String communityId;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateVolunteerRequestedCopyWith<_UpdateVolunteerRequested> get copyWith => __$UpdateVolunteerRequestedCopyWithImpl<_UpdateVolunteerRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateVolunteerRequested&&(identical(other.volunteer, volunteer) || other.volunteer == volunteer)&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,volunteer,communityId);

@override
String toString() {
  return 'VolunteerEvent.updateVolunteerRequested(volunteer: $volunteer, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$UpdateVolunteerRequestedCopyWith<$Res> implements $VolunteerEventCopyWith<$Res> {
  factory _$UpdateVolunteerRequestedCopyWith(_UpdateVolunteerRequested value, $Res Function(_UpdateVolunteerRequested) _then) = __$UpdateVolunteerRequestedCopyWithImpl;
@useResult
$Res call({
 AppUser volunteer, String communityId
});


$AppUserCopyWith<$Res> get volunteer;

}
/// @nodoc
class __$UpdateVolunteerRequestedCopyWithImpl<$Res>
    implements _$UpdateVolunteerRequestedCopyWith<$Res> {
  __$UpdateVolunteerRequestedCopyWithImpl(this._self, this._then);

  final _UpdateVolunteerRequested _self;
  final $Res Function(_UpdateVolunteerRequested) _then;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? volunteer = null,Object? communityId = null,}) {
  return _then(_UpdateVolunteerRequested(
volunteer: null == volunteer ? _self.volunteer : volunteer // ignore: cast_nullable_to_non_nullable
as AppUser,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res> get volunteer {
  
  return $AppUserCopyWith<$Res>(_self.volunteer, (value) {
    return _then(_self.copyWith(volunteer: value));
  });
}
}

/// @nodoc


class _ActivateVolunteerRequested implements VolunteerEvent {
  const _ActivateVolunteerRequested({required this.userId, required this.communityId});
  

 final  String userId;
 final  String communityId;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivateVolunteerRequestedCopyWith<_ActivateVolunteerRequested> get copyWith => __$ActivateVolunteerRequestedCopyWithImpl<_ActivateVolunteerRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivateVolunteerRequested&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,communityId);

@override
String toString() {
  return 'VolunteerEvent.activateVolunteerRequested(userId: $userId, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$ActivateVolunteerRequestedCopyWith<$Res> implements $VolunteerEventCopyWith<$Res> {
  factory _$ActivateVolunteerRequestedCopyWith(_ActivateVolunteerRequested value, $Res Function(_ActivateVolunteerRequested) _then) = __$ActivateVolunteerRequestedCopyWithImpl;
@useResult
$Res call({
 String userId, String communityId
});




}
/// @nodoc
class __$ActivateVolunteerRequestedCopyWithImpl<$Res>
    implements _$ActivateVolunteerRequestedCopyWith<$Res> {
  __$ActivateVolunteerRequestedCopyWithImpl(this._self, this._then);

  final _ActivateVolunteerRequested _self;
  final $Res Function(_ActivateVolunteerRequested) _then;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? communityId = null,}) {
  return _then(_ActivateVolunteerRequested(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeactivateVolunteerRequested implements VolunteerEvent {
  const _DeactivateVolunteerRequested({required this.userId, required this.communityId});
  

 final  String userId;
 final  String communityId;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeactivateVolunteerRequestedCopyWith<_DeactivateVolunteerRequested> get copyWith => __$DeactivateVolunteerRequestedCopyWithImpl<_DeactivateVolunteerRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeactivateVolunteerRequested&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,communityId);

@override
String toString() {
  return 'VolunteerEvent.deactivateVolunteerRequested(userId: $userId, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$DeactivateVolunteerRequestedCopyWith<$Res> implements $VolunteerEventCopyWith<$Res> {
  factory _$DeactivateVolunteerRequestedCopyWith(_DeactivateVolunteerRequested value, $Res Function(_DeactivateVolunteerRequested) _then) = __$DeactivateVolunteerRequestedCopyWithImpl;
@useResult
$Res call({
 String userId, String communityId
});




}
/// @nodoc
class __$DeactivateVolunteerRequestedCopyWithImpl<$Res>
    implements _$DeactivateVolunteerRequestedCopyWith<$Res> {
  __$DeactivateVolunteerRequestedCopyWithImpl(this._self, this._then);

  final _DeactivateVolunteerRequested _self;
  final $Res Function(_DeactivateVolunteerRequested) _then;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? communityId = null,}) {
  return _then(_DeactivateVolunteerRequested(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteVolunteerRequested implements VolunteerEvent {
  const _DeleteVolunteerRequested({required this.userId, required this.communityId});
  

 final  String userId;
 final  String communityId;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteVolunteerRequestedCopyWith<_DeleteVolunteerRequested> get copyWith => __$DeleteVolunteerRequestedCopyWithImpl<_DeleteVolunteerRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteVolunteerRequested&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,communityId);

@override
String toString() {
  return 'VolunteerEvent.deleteVolunteerRequested(userId: $userId, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$DeleteVolunteerRequestedCopyWith<$Res> implements $VolunteerEventCopyWith<$Res> {
  factory _$DeleteVolunteerRequestedCopyWith(_DeleteVolunteerRequested value, $Res Function(_DeleteVolunteerRequested) _then) = __$DeleteVolunteerRequestedCopyWithImpl;
@useResult
$Res call({
 String userId, String communityId
});




}
/// @nodoc
class __$DeleteVolunteerRequestedCopyWithImpl<$Res>
    implements _$DeleteVolunteerRequestedCopyWith<$Res> {
  __$DeleteVolunteerRequestedCopyWithImpl(this._self, this._then);

  final _DeleteVolunteerRequested _self;
  final $Res Function(_DeleteVolunteerRequested) _then;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? communityId = null,}) {
  return _then(_DeleteVolunteerRequested(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VolunteerState {

 List<AppUser> get volunteers; StateStatus get volunteersStatus; String? get volunteersError; List<AppUser> get assignedVolunteers; StateStatus get assignedVolunteersStatus; String? get assignedVolunteersError; StateStatus get volunteerActionStatus; String? get volunteerActionError;
/// Create a copy of VolunteerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolunteerStateCopyWith<VolunteerState> get copyWith => _$VolunteerStateCopyWithImpl<VolunteerState>(this as VolunteerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolunteerState&&const DeepCollectionEquality().equals(other.volunteers, volunteers)&&(identical(other.volunteersStatus, volunteersStatus) || other.volunteersStatus == volunteersStatus)&&(identical(other.volunteersError, volunteersError) || other.volunteersError == volunteersError)&&const DeepCollectionEquality().equals(other.assignedVolunteers, assignedVolunteers)&&(identical(other.assignedVolunteersStatus, assignedVolunteersStatus) || other.assignedVolunteersStatus == assignedVolunteersStatus)&&(identical(other.assignedVolunteersError, assignedVolunteersError) || other.assignedVolunteersError == assignedVolunteersError)&&(identical(other.volunteerActionStatus, volunteerActionStatus) || other.volunteerActionStatus == volunteerActionStatus)&&(identical(other.volunteerActionError, volunteerActionError) || other.volunteerActionError == volunteerActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(volunteers),volunteersStatus,volunteersError,const DeepCollectionEquality().hash(assignedVolunteers),assignedVolunteersStatus,assignedVolunteersError,volunteerActionStatus,volunteerActionError);

@override
String toString() {
  return 'VolunteerState(volunteers: $volunteers, volunteersStatus: $volunteersStatus, volunteersError: $volunteersError, assignedVolunteers: $assignedVolunteers, assignedVolunteersStatus: $assignedVolunteersStatus, assignedVolunteersError: $assignedVolunteersError, volunteerActionStatus: $volunteerActionStatus, volunteerActionError: $volunteerActionError)';
}


}

/// @nodoc
abstract mixin class $VolunteerStateCopyWith<$Res>  {
  factory $VolunteerStateCopyWith(VolunteerState value, $Res Function(VolunteerState) _then) = _$VolunteerStateCopyWithImpl;
@useResult
$Res call({
 List<AppUser> volunteers, StateStatus volunteersStatus, String? volunteersError, List<AppUser> assignedVolunteers, StateStatus assignedVolunteersStatus, String? assignedVolunteersError, StateStatus volunteerActionStatus, String? volunteerActionError
});




}
/// @nodoc
class _$VolunteerStateCopyWithImpl<$Res>
    implements $VolunteerStateCopyWith<$Res> {
  _$VolunteerStateCopyWithImpl(this._self, this._then);

  final VolunteerState _self;
  final $Res Function(VolunteerState) _then;

/// Create a copy of VolunteerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? volunteers = null,Object? volunteersStatus = null,Object? volunteersError = freezed,Object? assignedVolunteers = null,Object? assignedVolunteersStatus = null,Object? assignedVolunteersError = freezed,Object? volunteerActionStatus = null,Object? volunteerActionError = freezed,}) {
  return _then(_self.copyWith(
volunteers: null == volunteers ? _self.volunteers : volunteers // ignore: cast_nullable_to_non_nullable
as List<AppUser>,volunteersStatus: null == volunteersStatus ? _self.volunteersStatus : volunteersStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,volunteersError: freezed == volunteersError ? _self.volunteersError : volunteersError // ignore: cast_nullable_to_non_nullable
as String?,assignedVolunteers: null == assignedVolunteers ? _self.assignedVolunteers : assignedVolunteers // ignore: cast_nullable_to_non_nullable
as List<AppUser>,assignedVolunteersStatus: null == assignedVolunteersStatus ? _self.assignedVolunteersStatus : assignedVolunteersStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,assignedVolunteersError: freezed == assignedVolunteersError ? _self.assignedVolunteersError : assignedVolunteersError // ignore: cast_nullable_to_non_nullable
as String?,volunteerActionStatus: null == volunteerActionStatus ? _self.volunteerActionStatus : volunteerActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,volunteerActionError: freezed == volunteerActionError ? _self.volunteerActionError : volunteerActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VolunteerState].
extension VolunteerStatePatterns on VolunteerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VolunteerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VolunteerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VolunteerState value)  $default,){
final _that = this;
switch (_that) {
case _VolunteerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VolunteerState value)?  $default,){
final _that = this;
switch (_that) {
case _VolunteerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppUser> volunteers,  StateStatus volunteersStatus,  String? volunteersError,  List<AppUser> assignedVolunteers,  StateStatus assignedVolunteersStatus,  String? assignedVolunteersError,  StateStatus volunteerActionStatus,  String? volunteerActionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VolunteerState() when $default != null:
return $default(_that.volunteers,_that.volunteersStatus,_that.volunteersError,_that.assignedVolunteers,_that.assignedVolunteersStatus,_that.assignedVolunteersError,_that.volunteerActionStatus,_that.volunteerActionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AppUser> volunteers,  StateStatus volunteersStatus,  String? volunteersError,  List<AppUser> assignedVolunteers,  StateStatus assignedVolunteersStatus,  String? assignedVolunteersError,  StateStatus volunteerActionStatus,  String? volunteerActionError)  $default,) {final _that = this;
switch (_that) {
case _VolunteerState():
return $default(_that.volunteers,_that.volunteersStatus,_that.volunteersError,_that.assignedVolunteers,_that.assignedVolunteersStatus,_that.assignedVolunteersError,_that.volunteerActionStatus,_that.volunteerActionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AppUser> volunteers,  StateStatus volunteersStatus,  String? volunteersError,  List<AppUser> assignedVolunteers,  StateStatus assignedVolunteersStatus,  String? assignedVolunteersError,  StateStatus volunteerActionStatus,  String? volunteerActionError)?  $default,) {final _that = this;
switch (_that) {
case _VolunteerState() when $default != null:
return $default(_that.volunteers,_that.volunteersStatus,_that.volunteersError,_that.assignedVolunteers,_that.assignedVolunteersStatus,_that.assignedVolunteersError,_that.volunteerActionStatus,_that.volunteerActionError);case _:
  return null;

}
}

}

/// @nodoc


class _VolunteerState implements VolunteerState {
  const _VolunteerState({final  List<AppUser> volunteers = const [], this.volunteersStatus = StateStatus.initial, this.volunteersError, final  List<AppUser> assignedVolunteers = const [], this.assignedVolunteersStatus = StateStatus.initial, this.assignedVolunteersError, this.volunteerActionStatus = StateStatus.initial, this.volunteerActionError}): _volunteers = volunteers,_assignedVolunteers = assignedVolunteers;
  

 final  List<AppUser> _volunteers;
@override@JsonKey() List<AppUser> get volunteers {
  if (_volunteers is EqualUnmodifiableListView) return _volunteers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volunteers);
}

@override@JsonKey() final  StateStatus volunteersStatus;
@override final  String? volunteersError;
 final  List<AppUser> _assignedVolunteers;
@override@JsonKey() List<AppUser> get assignedVolunteers {
  if (_assignedVolunteers is EqualUnmodifiableListView) return _assignedVolunteers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignedVolunteers);
}

@override@JsonKey() final  StateStatus assignedVolunteersStatus;
@override final  String? assignedVolunteersError;
@override@JsonKey() final  StateStatus volunteerActionStatus;
@override final  String? volunteerActionError;

/// Create a copy of VolunteerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolunteerStateCopyWith<_VolunteerState> get copyWith => __$VolunteerStateCopyWithImpl<_VolunteerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolunteerState&&const DeepCollectionEquality().equals(other._volunteers, _volunteers)&&(identical(other.volunteersStatus, volunteersStatus) || other.volunteersStatus == volunteersStatus)&&(identical(other.volunteersError, volunteersError) || other.volunteersError == volunteersError)&&const DeepCollectionEquality().equals(other._assignedVolunteers, _assignedVolunteers)&&(identical(other.assignedVolunteersStatus, assignedVolunteersStatus) || other.assignedVolunteersStatus == assignedVolunteersStatus)&&(identical(other.assignedVolunteersError, assignedVolunteersError) || other.assignedVolunteersError == assignedVolunteersError)&&(identical(other.volunteerActionStatus, volunteerActionStatus) || other.volunteerActionStatus == volunteerActionStatus)&&(identical(other.volunteerActionError, volunteerActionError) || other.volunteerActionError == volunteerActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_volunteers),volunteersStatus,volunteersError,const DeepCollectionEquality().hash(_assignedVolunteers),assignedVolunteersStatus,assignedVolunteersError,volunteerActionStatus,volunteerActionError);

@override
String toString() {
  return 'VolunteerState(volunteers: $volunteers, volunteersStatus: $volunteersStatus, volunteersError: $volunteersError, assignedVolunteers: $assignedVolunteers, assignedVolunteersStatus: $assignedVolunteersStatus, assignedVolunteersError: $assignedVolunteersError, volunteerActionStatus: $volunteerActionStatus, volunteerActionError: $volunteerActionError)';
}


}

/// @nodoc
abstract mixin class _$VolunteerStateCopyWith<$Res> implements $VolunteerStateCopyWith<$Res> {
  factory _$VolunteerStateCopyWith(_VolunteerState value, $Res Function(_VolunteerState) _then) = __$VolunteerStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppUser> volunteers, StateStatus volunteersStatus, String? volunteersError, List<AppUser> assignedVolunteers, StateStatus assignedVolunteersStatus, String? assignedVolunteersError, StateStatus volunteerActionStatus, String? volunteerActionError
});




}
/// @nodoc
class __$VolunteerStateCopyWithImpl<$Res>
    implements _$VolunteerStateCopyWith<$Res> {
  __$VolunteerStateCopyWithImpl(this._self, this._then);

  final _VolunteerState _self;
  final $Res Function(_VolunteerState) _then;

/// Create a copy of VolunteerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? volunteers = null,Object? volunteersStatus = null,Object? volunteersError = freezed,Object? assignedVolunteers = null,Object? assignedVolunteersStatus = null,Object? assignedVolunteersError = freezed,Object? volunteerActionStatus = null,Object? volunteerActionError = freezed,}) {
  return _then(_VolunteerState(
volunteers: null == volunteers ? _self._volunteers : volunteers // ignore: cast_nullable_to_non_nullable
as List<AppUser>,volunteersStatus: null == volunteersStatus ? _self.volunteersStatus : volunteersStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,volunteersError: freezed == volunteersError ? _self.volunteersError : volunteersError // ignore: cast_nullable_to_non_nullable
as String?,assignedVolunteers: null == assignedVolunteers ? _self._assignedVolunteers : assignedVolunteers // ignore: cast_nullable_to_non_nullable
as List<AppUser>,assignedVolunteersStatus: null == assignedVolunteersStatus ? _self.assignedVolunteersStatus : assignedVolunteersStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,assignedVolunteersError: freezed == assignedVolunteersError ? _self.assignedVolunteersError : assignedVolunteersError // ignore: cast_nullable_to_non_nullable
as String?,volunteerActionStatus: null == volunteerActionStatus ? _self.volunteerActionStatus : volunteerActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,volunteerActionError: freezed == volunteerActionError ? _self.volunteerActionError : volunteerActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
