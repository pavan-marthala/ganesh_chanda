// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DonationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DonationEvent()';
}


}

/// @nodoc
class $DonationEventCopyWith<$Res>  {
$DonationEventCopyWith(DonationEvent _, $Res Function(DonationEvent) __);
}


/// Adds pattern-matching-related methods to [DonationEvent].
extension DonationEventPatterns on DonationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadDonationsByFestivalRequested value)?  loadDonationsByFestivalRequested,TResult Function( _LoadDonationsByCommunityRequested value)?  loadDonationsByCommunityRequested,TResult Function( _GetDonationByIdRequested value)?  getDonationByIdRequested,TResult Function( _CreateDonationRequested value)?  createDonationRequested,TResult Function( _UpdateDonationRequested value)?  updateDonationRequested,TResult Function( _DeleteDonationRequested value)?  deleteDonationRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadDonationsByFestivalRequested() when loadDonationsByFestivalRequested != null:
return loadDonationsByFestivalRequested(_that);case _LoadDonationsByCommunityRequested() when loadDonationsByCommunityRequested != null:
return loadDonationsByCommunityRequested(_that);case _GetDonationByIdRequested() when getDonationByIdRequested != null:
return getDonationByIdRequested(_that);case _CreateDonationRequested() when createDonationRequested != null:
return createDonationRequested(_that);case _UpdateDonationRequested() when updateDonationRequested != null:
return updateDonationRequested(_that);case _DeleteDonationRequested() when deleteDonationRequested != null:
return deleteDonationRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadDonationsByFestivalRequested value)  loadDonationsByFestivalRequested,required TResult Function( _LoadDonationsByCommunityRequested value)  loadDonationsByCommunityRequested,required TResult Function( _GetDonationByIdRequested value)  getDonationByIdRequested,required TResult Function( _CreateDonationRequested value)  createDonationRequested,required TResult Function( _UpdateDonationRequested value)  updateDonationRequested,required TResult Function( _DeleteDonationRequested value)  deleteDonationRequested,}){
final _that = this;
switch (_that) {
case _LoadDonationsByFestivalRequested():
return loadDonationsByFestivalRequested(_that);case _LoadDonationsByCommunityRequested():
return loadDonationsByCommunityRequested(_that);case _GetDonationByIdRequested():
return getDonationByIdRequested(_that);case _CreateDonationRequested():
return createDonationRequested(_that);case _UpdateDonationRequested():
return updateDonationRequested(_that);case _DeleteDonationRequested():
return deleteDonationRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadDonationsByFestivalRequested value)?  loadDonationsByFestivalRequested,TResult? Function( _LoadDonationsByCommunityRequested value)?  loadDonationsByCommunityRequested,TResult? Function( _GetDonationByIdRequested value)?  getDonationByIdRequested,TResult? Function( _CreateDonationRequested value)?  createDonationRequested,TResult? Function( _UpdateDonationRequested value)?  updateDonationRequested,TResult? Function( _DeleteDonationRequested value)?  deleteDonationRequested,}){
final _that = this;
switch (_that) {
case _LoadDonationsByFestivalRequested() when loadDonationsByFestivalRequested != null:
return loadDonationsByFestivalRequested(_that);case _LoadDonationsByCommunityRequested() when loadDonationsByCommunityRequested != null:
return loadDonationsByCommunityRequested(_that);case _GetDonationByIdRequested() when getDonationByIdRequested != null:
return getDonationByIdRequested(_that);case _CreateDonationRequested() when createDonationRequested != null:
return createDonationRequested(_that);case _UpdateDonationRequested() when updateDonationRequested != null:
return updateDonationRequested(_that);case _DeleteDonationRequested() when deleteDonationRequested != null:
return deleteDonationRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String festivalId)?  loadDonationsByFestivalRequested,TResult Function( String communityId)?  loadDonationsByCommunityRequested,TResult Function( String donationId)?  getDonationByIdRequested,TResult Function( Donation donation)?  createDonationRequested,TResult Function( Donation donation)?  updateDonationRequested,TResult Function( String donationId,  String festivalId)?  deleteDonationRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadDonationsByFestivalRequested() when loadDonationsByFestivalRequested != null:
return loadDonationsByFestivalRequested(_that.festivalId);case _LoadDonationsByCommunityRequested() when loadDonationsByCommunityRequested != null:
return loadDonationsByCommunityRequested(_that.communityId);case _GetDonationByIdRequested() when getDonationByIdRequested != null:
return getDonationByIdRequested(_that.donationId);case _CreateDonationRequested() when createDonationRequested != null:
return createDonationRequested(_that.donation);case _UpdateDonationRequested() when updateDonationRequested != null:
return updateDonationRequested(_that.donation);case _DeleteDonationRequested() when deleteDonationRequested != null:
return deleteDonationRequested(_that.donationId,_that.festivalId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String festivalId)  loadDonationsByFestivalRequested,required TResult Function( String communityId)  loadDonationsByCommunityRequested,required TResult Function( String donationId)  getDonationByIdRequested,required TResult Function( Donation donation)  createDonationRequested,required TResult Function( Donation donation)  updateDonationRequested,required TResult Function( String donationId,  String festivalId)  deleteDonationRequested,}) {final _that = this;
switch (_that) {
case _LoadDonationsByFestivalRequested():
return loadDonationsByFestivalRequested(_that.festivalId);case _LoadDonationsByCommunityRequested():
return loadDonationsByCommunityRequested(_that.communityId);case _GetDonationByIdRequested():
return getDonationByIdRequested(_that.donationId);case _CreateDonationRequested():
return createDonationRequested(_that.donation);case _UpdateDonationRequested():
return updateDonationRequested(_that.donation);case _DeleteDonationRequested():
return deleteDonationRequested(_that.donationId,_that.festivalId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String festivalId)?  loadDonationsByFestivalRequested,TResult? Function( String communityId)?  loadDonationsByCommunityRequested,TResult? Function( String donationId)?  getDonationByIdRequested,TResult? Function( Donation donation)?  createDonationRequested,TResult? Function( Donation donation)?  updateDonationRequested,TResult? Function( String donationId,  String festivalId)?  deleteDonationRequested,}) {final _that = this;
switch (_that) {
case _LoadDonationsByFestivalRequested() when loadDonationsByFestivalRequested != null:
return loadDonationsByFestivalRequested(_that.festivalId);case _LoadDonationsByCommunityRequested() when loadDonationsByCommunityRequested != null:
return loadDonationsByCommunityRequested(_that.communityId);case _GetDonationByIdRequested() when getDonationByIdRequested != null:
return getDonationByIdRequested(_that.donationId);case _CreateDonationRequested() when createDonationRequested != null:
return createDonationRequested(_that.donation);case _UpdateDonationRequested() when updateDonationRequested != null:
return updateDonationRequested(_that.donation);case _DeleteDonationRequested() when deleteDonationRequested != null:
return deleteDonationRequested(_that.donationId,_that.festivalId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadDonationsByFestivalRequested implements DonationEvent {
  const _LoadDonationsByFestivalRequested({required this.festivalId});
  

 final  String festivalId;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDonationsByFestivalRequestedCopyWith<_LoadDonationsByFestivalRequested> get copyWith => __$LoadDonationsByFestivalRequestedCopyWithImpl<_LoadDonationsByFestivalRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDonationsByFestivalRequested&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId));
}


@override
int get hashCode => Object.hash(runtimeType,festivalId);

@override
String toString() {
  return 'DonationEvent.loadDonationsByFestivalRequested(festivalId: $festivalId)';
}


}

/// @nodoc
abstract mixin class _$LoadDonationsByFestivalRequestedCopyWith<$Res> implements $DonationEventCopyWith<$Res> {
  factory _$LoadDonationsByFestivalRequestedCopyWith(_LoadDonationsByFestivalRequested value, $Res Function(_LoadDonationsByFestivalRequested) _then) = __$LoadDonationsByFestivalRequestedCopyWithImpl;
@useResult
$Res call({
 String festivalId
});




}
/// @nodoc
class __$LoadDonationsByFestivalRequestedCopyWithImpl<$Res>
    implements _$LoadDonationsByFestivalRequestedCopyWith<$Res> {
  __$LoadDonationsByFestivalRequestedCopyWithImpl(this._self, this._then);

  final _LoadDonationsByFestivalRequested _self;
  final $Res Function(_LoadDonationsByFestivalRequested) _then;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? festivalId = null,}) {
  return _then(_LoadDonationsByFestivalRequested(
festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadDonationsByCommunityRequested implements DonationEvent {
  const _LoadDonationsByCommunityRequested({required this.communityId});
  

 final  String communityId;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDonationsByCommunityRequestedCopyWith<_LoadDonationsByCommunityRequested> get copyWith => __$LoadDonationsByCommunityRequestedCopyWithImpl<_LoadDonationsByCommunityRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDonationsByCommunityRequested&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,communityId);

@override
String toString() {
  return 'DonationEvent.loadDonationsByCommunityRequested(communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$LoadDonationsByCommunityRequestedCopyWith<$Res> implements $DonationEventCopyWith<$Res> {
  factory _$LoadDonationsByCommunityRequestedCopyWith(_LoadDonationsByCommunityRequested value, $Res Function(_LoadDonationsByCommunityRequested) _then) = __$LoadDonationsByCommunityRequestedCopyWithImpl;
@useResult
$Res call({
 String communityId
});




}
/// @nodoc
class __$LoadDonationsByCommunityRequestedCopyWithImpl<$Res>
    implements _$LoadDonationsByCommunityRequestedCopyWith<$Res> {
  __$LoadDonationsByCommunityRequestedCopyWithImpl(this._self, this._then);

  final _LoadDonationsByCommunityRequested _self;
  final $Res Function(_LoadDonationsByCommunityRequested) _then;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? communityId = null,}) {
  return _then(_LoadDonationsByCommunityRequested(
communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GetDonationByIdRequested implements DonationEvent {
  const _GetDonationByIdRequested({required this.donationId});
  

 final  String donationId;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetDonationByIdRequestedCopyWith<_GetDonationByIdRequested> get copyWith => __$GetDonationByIdRequestedCopyWithImpl<_GetDonationByIdRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetDonationByIdRequested&&(identical(other.donationId, donationId) || other.donationId == donationId));
}


@override
int get hashCode => Object.hash(runtimeType,donationId);

@override
String toString() {
  return 'DonationEvent.getDonationByIdRequested(donationId: $donationId)';
}


}

/// @nodoc
abstract mixin class _$GetDonationByIdRequestedCopyWith<$Res> implements $DonationEventCopyWith<$Res> {
  factory _$GetDonationByIdRequestedCopyWith(_GetDonationByIdRequested value, $Res Function(_GetDonationByIdRequested) _then) = __$GetDonationByIdRequestedCopyWithImpl;
@useResult
$Res call({
 String donationId
});




}
/// @nodoc
class __$GetDonationByIdRequestedCopyWithImpl<$Res>
    implements _$GetDonationByIdRequestedCopyWith<$Res> {
  __$GetDonationByIdRequestedCopyWithImpl(this._self, this._then);

  final _GetDonationByIdRequested _self;
  final $Res Function(_GetDonationByIdRequested) _then;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? donationId = null,}) {
  return _then(_GetDonationByIdRequested(
donationId: null == donationId ? _self.donationId : donationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CreateDonationRequested implements DonationEvent {
  const _CreateDonationRequested({required this.donation});
  

 final  Donation donation;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDonationRequestedCopyWith<_CreateDonationRequested> get copyWith => __$CreateDonationRequestedCopyWithImpl<_CreateDonationRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDonationRequested&&(identical(other.donation, donation) || other.donation == donation));
}


@override
int get hashCode => Object.hash(runtimeType,donation);

@override
String toString() {
  return 'DonationEvent.createDonationRequested(donation: $donation)';
}


}

/// @nodoc
abstract mixin class _$CreateDonationRequestedCopyWith<$Res> implements $DonationEventCopyWith<$Res> {
  factory _$CreateDonationRequestedCopyWith(_CreateDonationRequested value, $Res Function(_CreateDonationRequested) _then) = __$CreateDonationRequestedCopyWithImpl;
@useResult
$Res call({
 Donation donation
});


$DonationCopyWith<$Res> get donation;

}
/// @nodoc
class __$CreateDonationRequestedCopyWithImpl<$Res>
    implements _$CreateDonationRequestedCopyWith<$Res> {
  __$CreateDonationRequestedCopyWithImpl(this._self, this._then);

  final _CreateDonationRequested _self;
  final $Res Function(_CreateDonationRequested) _then;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? donation = null,}) {
  return _then(_CreateDonationRequested(
donation: null == donation ? _self.donation : donation // ignore: cast_nullable_to_non_nullable
as Donation,
  ));
}

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DonationCopyWith<$Res> get donation {
  
  return $DonationCopyWith<$Res>(_self.donation, (value) {
    return _then(_self.copyWith(donation: value));
  });
}
}

/// @nodoc


class _UpdateDonationRequested implements DonationEvent {
  const _UpdateDonationRequested({required this.donation});
  

 final  Donation donation;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDonationRequestedCopyWith<_UpdateDonationRequested> get copyWith => __$UpdateDonationRequestedCopyWithImpl<_UpdateDonationRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDonationRequested&&(identical(other.donation, donation) || other.donation == donation));
}


@override
int get hashCode => Object.hash(runtimeType,donation);

@override
String toString() {
  return 'DonationEvent.updateDonationRequested(donation: $donation)';
}


}

/// @nodoc
abstract mixin class _$UpdateDonationRequestedCopyWith<$Res> implements $DonationEventCopyWith<$Res> {
  factory _$UpdateDonationRequestedCopyWith(_UpdateDonationRequested value, $Res Function(_UpdateDonationRequested) _then) = __$UpdateDonationRequestedCopyWithImpl;
@useResult
$Res call({
 Donation donation
});


$DonationCopyWith<$Res> get donation;

}
/// @nodoc
class __$UpdateDonationRequestedCopyWithImpl<$Res>
    implements _$UpdateDonationRequestedCopyWith<$Res> {
  __$UpdateDonationRequestedCopyWithImpl(this._self, this._then);

  final _UpdateDonationRequested _self;
  final $Res Function(_UpdateDonationRequested) _then;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? donation = null,}) {
  return _then(_UpdateDonationRequested(
donation: null == donation ? _self.donation : donation // ignore: cast_nullable_to_non_nullable
as Donation,
  ));
}

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DonationCopyWith<$Res> get donation {
  
  return $DonationCopyWith<$Res>(_self.donation, (value) {
    return _then(_self.copyWith(donation: value));
  });
}
}

/// @nodoc


class _DeleteDonationRequested implements DonationEvent {
  const _DeleteDonationRequested({required this.donationId, required this.festivalId});
  

 final  String donationId;
 final  String festivalId;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteDonationRequestedCopyWith<_DeleteDonationRequested> get copyWith => __$DeleteDonationRequestedCopyWithImpl<_DeleteDonationRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteDonationRequested&&(identical(other.donationId, donationId) || other.donationId == donationId)&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId));
}


@override
int get hashCode => Object.hash(runtimeType,donationId,festivalId);

@override
String toString() {
  return 'DonationEvent.deleteDonationRequested(donationId: $donationId, festivalId: $festivalId)';
}


}

/// @nodoc
abstract mixin class _$DeleteDonationRequestedCopyWith<$Res> implements $DonationEventCopyWith<$Res> {
  factory _$DeleteDonationRequestedCopyWith(_DeleteDonationRequested value, $Res Function(_DeleteDonationRequested) _then) = __$DeleteDonationRequestedCopyWithImpl;
@useResult
$Res call({
 String donationId, String festivalId
});




}
/// @nodoc
class __$DeleteDonationRequestedCopyWithImpl<$Res>
    implements _$DeleteDonationRequestedCopyWith<$Res> {
  __$DeleteDonationRequestedCopyWithImpl(this._self, this._then);

  final _DeleteDonationRequested _self;
  final $Res Function(_DeleteDonationRequested) _then;

/// Create a copy of DonationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? donationId = null,Object? festivalId = null,}) {
  return _then(_DeleteDonationRequested(
donationId: null == donationId ? _self.donationId : donationId // ignore: cast_nullable_to_non_nullable
as String,festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DonationState {

 List<Donation> get donations; StateStatus get donationsStatus; String? get donationsError; Donation? get selectedDonation; StateStatus get donationDetailsStatus; String? get donationDetailsError; StateStatus get donationActionStatus; String? get donationActionError;
/// Create a copy of DonationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonationStateCopyWith<DonationState> get copyWith => _$DonationStateCopyWithImpl<DonationState>(this as DonationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationState&&const DeepCollectionEquality().equals(other.donations, donations)&&(identical(other.donationsStatus, donationsStatus) || other.donationsStatus == donationsStatus)&&(identical(other.donationsError, donationsError) || other.donationsError == donationsError)&&(identical(other.selectedDonation, selectedDonation) || other.selectedDonation == selectedDonation)&&(identical(other.donationDetailsStatus, donationDetailsStatus) || other.donationDetailsStatus == donationDetailsStatus)&&(identical(other.donationDetailsError, donationDetailsError) || other.donationDetailsError == donationDetailsError)&&(identical(other.donationActionStatus, donationActionStatus) || other.donationActionStatus == donationActionStatus)&&(identical(other.donationActionError, donationActionError) || other.donationActionError == donationActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(donations),donationsStatus,donationsError,selectedDonation,donationDetailsStatus,donationDetailsError,donationActionStatus,donationActionError);

@override
String toString() {
  return 'DonationState(donations: $donations, donationsStatus: $donationsStatus, donationsError: $donationsError, selectedDonation: $selectedDonation, donationDetailsStatus: $donationDetailsStatus, donationDetailsError: $donationDetailsError, donationActionStatus: $donationActionStatus, donationActionError: $donationActionError)';
}


}

/// @nodoc
abstract mixin class $DonationStateCopyWith<$Res>  {
  factory $DonationStateCopyWith(DonationState value, $Res Function(DonationState) _then) = _$DonationStateCopyWithImpl;
@useResult
$Res call({
 List<Donation> donations, StateStatus donationsStatus, String? donationsError, Donation? selectedDonation, StateStatus donationDetailsStatus, String? donationDetailsError, StateStatus donationActionStatus, String? donationActionError
});


$DonationCopyWith<$Res>? get selectedDonation;

}
/// @nodoc
class _$DonationStateCopyWithImpl<$Res>
    implements $DonationStateCopyWith<$Res> {
  _$DonationStateCopyWithImpl(this._self, this._then);

  final DonationState _self;
  final $Res Function(DonationState) _then;

/// Create a copy of DonationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? donations = null,Object? donationsStatus = null,Object? donationsError = freezed,Object? selectedDonation = freezed,Object? donationDetailsStatus = null,Object? donationDetailsError = freezed,Object? donationActionStatus = null,Object? donationActionError = freezed,}) {
  return _then(_self.copyWith(
donations: null == donations ? _self.donations : donations // ignore: cast_nullable_to_non_nullable
as List<Donation>,donationsStatus: null == donationsStatus ? _self.donationsStatus : donationsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,donationsError: freezed == donationsError ? _self.donationsError : donationsError // ignore: cast_nullable_to_non_nullable
as String?,selectedDonation: freezed == selectedDonation ? _self.selectedDonation : selectedDonation // ignore: cast_nullable_to_non_nullable
as Donation?,donationDetailsStatus: null == donationDetailsStatus ? _self.donationDetailsStatus : donationDetailsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,donationDetailsError: freezed == donationDetailsError ? _self.donationDetailsError : donationDetailsError // ignore: cast_nullable_to_non_nullable
as String?,donationActionStatus: null == donationActionStatus ? _self.donationActionStatus : donationActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,donationActionError: freezed == donationActionError ? _self.donationActionError : donationActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DonationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DonationCopyWith<$Res>? get selectedDonation {
    if (_self.selectedDonation == null) {
    return null;
  }

  return $DonationCopyWith<$Res>(_self.selectedDonation!, (value) {
    return _then(_self.copyWith(selectedDonation: value));
  });
}
}


/// Adds pattern-matching-related methods to [DonationState].
extension DonationStatePatterns on DonationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DonationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DonationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DonationState value)  $default,){
final _that = this;
switch (_that) {
case _DonationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DonationState value)?  $default,){
final _that = this;
switch (_that) {
case _DonationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Donation> donations,  StateStatus donationsStatus,  String? donationsError,  Donation? selectedDonation,  StateStatus donationDetailsStatus,  String? donationDetailsError,  StateStatus donationActionStatus,  String? donationActionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DonationState() when $default != null:
return $default(_that.donations,_that.donationsStatus,_that.donationsError,_that.selectedDonation,_that.donationDetailsStatus,_that.donationDetailsError,_that.donationActionStatus,_that.donationActionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Donation> donations,  StateStatus donationsStatus,  String? donationsError,  Donation? selectedDonation,  StateStatus donationDetailsStatus,  String? donationDetailsError,  StateStatus donationActionStatus,  String? donationActionError)  $default,) {final _that = this;
switch (_that) {
case _DonationState():
return $default(_that.donations,_that.donationsStatus,_that.donationsError,_that.selectedDonation,_that.donationDetailsStatus,_that.donationDetailsError,_that.donationActionStatus,_that.donationActionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Donation> donations,  StateStatus donationsStatus,  String? donationsError,  Donation? selectedDonation,  StateStatus donationDetailsStatus,  String? donationDetailsError,  StateStatus donationActionStatus,  String? donationActionError)?  $default,) {final _that = this;
switch (_that) {
case _DonationState() when $default != null:
return $default(_that.donations,_that.donationsStatus,_that.donationsError,_that.selectedDonation,_that.donationDetailsStatus,_that.donationDetailsError,_that.donationActionStatus,_that.donationActionError);case _:
  return null;

}
}

}

/// @nodoc


class _DonationState implements DonationState {
  const _DonationState({final  List<Donation> donations = const [], this.donationsStatus = StateStatus.initial, this.donationsError, this.selectedDonation, this.donationDetailsStatus = StateStatus.initial, this.donationDetailsError, this.donationActionStatus = StateStatus.initial, this.donationActionError}): _donations = donations;
  

 final  List<Donation> _donations;
@override@JsonKey() List<Donation> get donations {
  if (_donations is EqualUnmodifiableListView) return _donations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_donations);
}

@override@JsonKey() final  StateStatus donationsStatus;
@override final  String? donationsError;
@override final  Donation? selectedDonation;
@override@JsonKey() final  StateStatus donationDetailsStatus;
@override final  String? donationDetailsError;
@override@JsonKey() final  StateStatus donationActionStatus;
@override final  String? donationActionError;

/// Create a copy of DonationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DonationStateCopyWith<_DonationState> get copyWith => __$DonationStateCopyWithImpl<_DonationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DonationState&&const DeepCollectionEquality().equals(other._donations, _donations)&&(identical(other.donationsStatus, donationsStatus) || other.donationsStatus == donationsStatus)&&(identical(other.donationsError, donationsError) || other.donationsError == donationsError)&&(identical(other.selectedDonation, selectedDonation) || other.selectedDonation == selectedDonation)&&(identical(other.donationDetailsStatus, donationDetailsStatus) || other.donationDetailsStatus == donationDetailsStatus)&&(identical(other.donationDetailsError, donationDetailsError) || other.donationDetailsError == donationDetailsError)&&(identical(other.donationActionStatus, donationActionStatus) || other.donationActionStatus == donationActionStatus)&&(identical(other.donationActionError, donationActionError) || other.donationActionError == donationActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_donations),donationsStatus,donationsError,selectedDonation,donationDetailsStatus,donationDetailsError,donationActionStatus,donationActionError);

@override
String toString() {
  return 'DonationState(donations: $donations, donationsStatus: $donationsStatus, donationsError: $donationsError, selectedDonation: $selectedDonation, donationDetailsStatus: $donationDetailsStatus, donationDetailsError: $donationDetailsError, donationActionStatus: $donationActionStatus, donationActionError: $donationActionError)';
}


}

/// @nodoc
abstract mixin class _$DonationStateCopyWith<$Res> implements $DonationStateCopyWith<$Res> {
  factory _$DonationStateCopyWith(_DonationState value, $Res Function(_DonationState) _then) = __$DonationStateCopyWithImpl;
@override @useResult
$Res call({
 List<Donation> donations, StateStatus donationsStatus, String? donationsError, Donation? selectedDonation, StateStatus donationDetailsStatus, String? donationDetailsError, StateStatus donationActionStatus, String? donationActionError
});


@override $DonationCopyWith<$Res>? get selectedDonation;

}
/// @nodoc
class __$DonationStateCopyWithImpl<$Res>
    implements _$DonationStateCopyWith<$Res> {
  __$DonationStateCopyWithImpl(this._self, this._then);

  final _DonationState _self;
  final $Res Function(_DonationState) _then;

/// Create a copy of DonationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? donations = null,Object? donationsStatus = null,Object? donationsError = freezed,Object? selectedDonation = freezed,Object? donationDetailsStatus = null,Object? donationDetailsError = freezed,Object? donationActionStatus = null,Object? donationActionError = freezed,}) {
  return _then(_DonationState(
donations: null == donations ? _self._donations : donations // ignore: cast_nullable_to_non_nullable
as List<Donation>,donationsStatus: null == donationsStatus ? _self.donationsStatus : donationsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,donationsError: freezed == donationsError ? _self.donationsError : donationsError // ignore: cast_nullable_to_non_nullable
as String?,selectedDonation: freezed == selectedDonation ? _self.selectedDonation : selectedDonation // ignore: cast_nullable_to_non_nullable
as Donation?,donationDetailsStatus: null == donationDetailsStatus ? _self.donationDetailsStatus : donationDetailsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,donationDetailsError: freezed == donationDetailsError ? _self.donationDetailsError : donationDetailsError // ignore: cast_nullable_to_non_nullable
as String?,donationActionStatus: null == donationActionStatus ? _self.donationActionStatus : donationActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,donationActionError: freezed == donationActionError ? _self.donationActionError : donationActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DonationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DonationCopyWith<$Res>? get selectedDonation {
    if (_self.selectedDonation == null) {
    return null;
  }

  return $DonationCopyWith<$Res>(_self.selectedDonation!, (value) {
    return _then(_self.copyWith(selectedDonation: value));
  });
}
}

// dart format on
