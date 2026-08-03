// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentDetails {

 String get upiId; String get bankName; String get accountHolderName; String get accountNumber; String get ifscCode; String get chequePayeeName;
/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailsCopyWith<PaymentDetails> get copyWith => _$PaymentDetailsCopyWithImpl<PaymentDetails>(this as PaymentDetails, _$identity);

  /// Serializes this PaymentDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetails&&(identical(other.upiId, upiId) || other.upiId == upiId)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.ifscCode, ifscCode) || other.ifscCode == ifscCode)&&(identical(other.chequePayeeName, chequePayeeName) || other.chequePayeeName == chequePayeeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,upiId,bankName,accountHolderName,accountNumber,ifscCode,chequePayeeName);

@override
String toString() {
  return 'PaymentDetails(upiId: $upiId, bankName: $bankName, accountHolderName: $accountHolderName, accountNumber: $accountNumber, ifscCode: $ifscCode, chequePayeeName: $chequePayeeName)';
}


}

/// @nodoc
abstract mixin class $PaymentDetailsCopyWith<$Res>  {
  factory $PaymentDetailsCopyWith(PaymentDetails value, $Res Function(PaymentDetails) _then) = _$PaymentDetailsCopyWithImpl;
@useResult
$Res call({
 String upiId, String bankName, String accountHolderName, String accountNumber, String ifscCode, String chequePayeeName
});




}
/// @nodoc
class _$PaymentDetailsCopyWithImpl<$Res>
    implements $PaymentDetailsCopyWith<$Res> {
  _$PaymentDetailsCopyWithImpl(this._self, this._then);

  final PaymentDetails _self;
  final $Res Function(PaymentDetails) _then;

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upiId = null,Object? bankName = null,Object? accountHolderName = null,Object? accountNumber = null,Object? ifscCode = null,Object? chequePayeeName = null,}) {
  return _then(_self.copyWith(
upiId: null == upiId ? _self.upiId : upiId // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,accountHolderName: null == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,ifscCode: null == ifscCode ? _self.ifscCode : ifscCode // ignore: cast_nullable_to_non_nullable
as String,chequePayeeName: null == chequePayeeName ? _self.chequePayeeName : chequePayeeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDetails].
extension PaymentDetailsPatterns on PaymentDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDetails value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDetails value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String upiId,  String bankName,  String accountHolderName,  String accountNumber,  String ifscCode,  String chequePayeeName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
return $default(_that.upiId,_that.bankName,_that.accountHolderName,_that.accountNumber,_that.ifscCode,_that.chequePayeeName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String upiId,  String bankName,  String accountHolderName,  String accountNumber,  String ifscCode,  String chequePayeeName)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetails():
return $default(_that.upiId,_that.bankName,_that.accountHolderName,_that.accountNumber,_that.ifscCode,_that.chequePayeeName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String upiId,  String bankName,  String accountHolderName,  String accountNumber,  String ifscCode,  String chequePayeeName)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
return $default(_that.upiId,_that.bankName,_that.accountHolderName,_that.accountNumber,_that.ifscCode,_that.chequePayeeName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDetails implements PaymentDetails {
  const _PaymentDetails({this.upiId = '', this.bankName = '', this.accountHolderName = '', this.accountNumber = '', this.ifscCode = '', this.chequePayeeName = ''});
  factory _PaymentDetails.fromJson(Map<String, dynamic> json) => _$PaymentDetailsFromJson(json);

@override@JsonKey() final  String upiId;
@override@JsonKey() final  String bankName;
@override@JsonKey() final  String accountHolderName;
@override@JsonKey() final  String accountNumber;
@override@JsonKey() final  String ifscCode;
@override@JsonKey() final  String chequePayeeName;

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDetailsCopyWith<_PaymentDetails> get copyWith => __$PaymentDetailsCopyWithImpl<_PaymentDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetails&&(identical(other.upiId, upiId) || other.upiId == upiId)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.ifscCode, ifscCode) || other.ifscCode == ifscCode)&&(identical(other.chequePayeeName, chequePayeeName) || other.chequePayeeName == chequePayeeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,upiId,bankName,accountHolderName,accountNumber,ifscCode,chequePayeeName);

@override
String toString() {
  return 'PaymentDetails(upiId: $upiId, bankName: $bankName, accountHolderName: $accountHolderName, accountNumber: $accountNumber, ifscCode: $ifscCode, chequePayeeName: $chequePayeeName)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailsCopyWith<$Res> implements $PaymentDetailsCopyWith<$Res> {
  factory _$PaymentDetailsCopyWith(_PaymentDetails value, $Res Function(_PaymentDetails) _then) = __$PaymentDetailsCopyWithImpl;
@override @useResult
$Res call({
 String upiId, String bankName, String accountHolderName, String accountNumber, String ifscCode, String chequePayeeName
});




}
/// @nodoc
class __$PaymentDetailsCopyWithImpl<$Res>
    implements _$PaymentDetailsCopyWith<$Res> {
  __$PaymentDetailsCopyWithImpl(this._self, this._then);

  final _PaymentDetails _self;
  final $Res Function(_PaymentDetails) _then;

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upiId = null,Object? bankName = null,Object? accountHolderName = null,Object? accountNumber = null,Object? ifscCode = null,Object? chequePayeeName = null,}) {
  return _then(_PaymentDetails(
upiId: null == upiId ? _self.upiId : upiId // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,accountHolderName: null == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,ifscCode: null == ifscCode ? _self.ifscCode : ifscCode // ignore: cast_nullable_to_non_nullable
as String,chequePayeeName: null == chequePayeeName ? _self.chequePayeeName : chequePayeeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
