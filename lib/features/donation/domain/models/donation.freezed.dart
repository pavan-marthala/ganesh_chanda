// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Donation {

 String get id; String get festivalId; String get communityId; String get donorName; String get donorPhone; double get amount; PaymentMode get paymentMode; String? get referenceNumber; String get notes; String get collectedBy; String get receiptNumber; DonationStatus get status; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonationCopyWith<Donation> get copyWith => _$DonationCopyWithImpl<Donation>(this as Donation, _$identity);

  /// Serializes this Donation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Donation&&(identical(other.id, id) || other.id == id)&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.donorName, donorName) || other.donorName == donorName)&&(identical(other.donorPhone, donorPhone) || other.donorPhone == donorPhone)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.collectedBy, collectedBy) || other.collectedBy == collectedBy)&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,festivalId,communityId,donorName,donorPhone,amount,paymentMode,referenceNumber,notes,collectedBy,receiptNumber,status,createdAt,updatedAt);

@override
String toString() {
  return 'Donation(id: $id, festivalId: $festivalId, communityId: $communityId, donorName: $donorName, donorPhone: $donorPhone, amount: $amount, paymentMode: $paymentMode, referenceNumber: $referenceNumber, notes: $notes, collectedBy: $collectedBy, receiptNumber: $receiptNumber, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DonationCopyWith<$Res>  {
  factory $DonationCopyWith(Donation value, $Res Function(Donation) _then) = _$DonationCopyWithImpl;
@useResult
$Res call({
 String id, String festivalId, String communityId, String donorName, String donorPhone, double amount, PaymentMode paymentMode, String? referenceNumber, String notes, String collectedBy, String receiptNumber, DonationStatus status, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$DonationCopyWithImpl<$Res>
    implements $DonationCopyWith<$Res> {
  _$DonationCopyWithImpl(this._self, this._then);

  final Donation _self;
  final $Res Function(Donation) _then;

/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? festivalId = null,Object? communityId = null,Object? donorName = null,Object? donorPhone = null,Object? amount = null,Object? paymentMode = null,Object? referenceNumber = freezed,Object? notes = null,Object? collectedBy = null,Object? receiptNumber = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,donorName: null == donorName ? _self.donorName : donorName // ignore: cast_nullable_to_non_nullable
as String,donorPhone: null == donorPhone ? _self.donorPhone : donorPhone // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMode: null == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as PaymentMode,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,collectedBy: null == collectedBy ? _self.collectedBy : collectedBy // ignore: cast_nullable_to_non_nullable
as String,receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DonationStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Donation].
extension DonationPatterns on Donation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Donation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Donation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Donation value)  $default,){
final _that = this;
switch (_that) {
case _Donation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Donation value)?  $default,){
final _that = this;
switch (_that) {
case _Donation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String festivalId,  String communityId,  String donorName,  String donorPhone,  double amount,  PaymentMode paymentMode,  String? referenceNumber,  String notes,  String collectedBy,  String receiptNumber,  DonationStatus status,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Donation() when $default != null:
return $default(_that.id,_that.festivalId,_that.communityId,_that.donorName,_that.donorPhone,_that.amount,_that.paymentMode,_that.referenceNumber,_that.notes,_that.collectedBy,_that.receiptNumber,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String festivalId,  String communityId,  String donorName,  String donorPhone,  double amount,  PaymentMode paymentMode,  String? referenceNumber,  String notes,  String collectedBy,  String receiptNumber,  DonationStatus status,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Donation():
return $default(_that.id,_that.festivalId,_that.communityId,_that.donorName,_that.donorPhone,_that.amount,_that.paymentMode,_that.referenceNumber,_that.notes,_that.collectedBy,_that.receiptNumber,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String festivalId,  String communityId,  String donorName,  String donorPhone,  double amount,  PaymentMode paymentMode,  String? referenceNumber,  String notes,  String collectedBy,  String receiptNumber,  DonationStatus status,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Donation() when $default != null:
return $default(_that.id,_that.festivalId,_that.communityId,_that.donorName,_that.donorPhone,_that.amount,_that.paymentMode,_that.referenceNumber,_that.notes,_that.collectedBy,_that.receiptNumber,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Donation implements Donation {
  const _Donation({required this.id, required this.festivalId, required this.communityId, required this.donorName, this.donorPhone = '', required this.amount, this.paymentMode = PaymentMode.cash, this.referenceNumber, this.notes = '', required this.collectedBy, this.receiptNumber = '', this.status = DonationStatus.received, required this.createdAt, required this.updatedAt});
  factory _Donation.fromJson(Map<String, dynamic> json) => _$DonationFromJson(json);

@override final  String id;
@override final  String festivalId;
@override final  String communityId;
@override final  String donorName;
@override@JsonKey() final  String donorPhone;
@override final  double amount;
@override@JsonKey() final  PaymentMode paymentMode;
@override final  String? referenceNumber;
@override@JsonKey() final  String notes;
@override final  String collectedBy;
@override@JsonKey() final  String receiptNumber;
@override@JsonKey() final  DonationStatus status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DonationCopyWith<_Donation> get copyWith => __$DonationCopyWithImpl<_Donation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DonationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Donation&&(identical(other.id, id) || other.id == id)&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.donorName, donorName) || other.donorName == donorName)&&(identical(other.donorPhone, donorPhone) || other.donorPhone == donorPhone)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.collectedBy, collectedBy) || other.collectedBy == collectedBy)&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,festivalId,communityId,donorName,donorPhone,amount,paymentMode,referenceNumber,notes,collectedBy,receiptNumber,status,createdAt,updatedAt);

@override
String toString() {
  return 'Donation(id: $id, festivalId: $festivalId, communityId: $communityId, donorName: $donorName, donorPhone: $donorPhone, amount: $amount, paymentMode: $paymentMode, referenceNumber: $referenceNumber, notes: $notes, collectedBy: $collectedBy, receiptNumber: $receiptNumber, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DonationCopyWith<$Res> implements $DonationCopyWith<$Res> {
  factory _$DonationCopyWith(_Donation value, $Res Function(_Donation) _then) = __$DonationCopyWithImpl;
@override @useResult
$Res call({
 String id, String festivalId, String communityId, String donorName, String donorPhone, double amount, PaymentMode paymentMode, String? referenceNumber, String notes, String collectedBy, String receiptNumber, DonationStatus status, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$DonationCopyWithImpl<$Res>
    implements _$DonationCopyWith<$Res> {
  __$DonationCopyWithImpl(this._self, this._then);

  final _Donation _self;
  final $Res Function(_Donation) _then;

/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? festivalId = null,Object? communityId = null,Object? donorName = null,Object? donorPhone = null,Object? amount = null,Object? paymentMode = null,Object? referenceNumber = freezed,Object? notes = null,Object? collectedBy = null,Object? receiptNumber = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Donation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,donorName: null == donorName ? _self.donorName : donorName // ignore: cast_nullable_to_non_nullable
as String,donorPhone: null == donorPhone ? _self.donorPhone : donorPhone // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMode: null == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as PaymentMode,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,collectedBy: null == collectedBy ? _self.collectedBy : collectedBy // ignore: cast_nullable_to_non_nullable
as String,receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DonationStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
