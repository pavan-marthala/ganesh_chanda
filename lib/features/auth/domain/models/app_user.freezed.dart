// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUser {

@JsonKey(name: 'userId') String get id; String get email; String get displayName;@JsonKey(defaultValue: 'ADMIN') String get role; String? get communityId;@JsonKey(name: 'onboardingState', unknownEnumValue: AccountSetupStatus.adminRegistered, defaultValue: AccountSetupStatus.adminRegistered) AccountSetupStatus get accountSetupStatus; List<NotificationDevice> get notificationDevices; String? get phoneNumber; String? get photoUrl;
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserCopyWith<AppUser> get copyWith => _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.accountSetupStatus, accountSetupStatus) || other.accountSetupStatus == accountSetupStatus)&&const DeepCollectionEquality().equals(other.notificationDevices, notificationDevices)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,role,communityId,accountSetupStatus,const DeepCollectionEquality().hash(notificationDevices),phoneNumber,photoUrl);

@override
String toString() {
  return 'AppUser(id: $id, email: $email, displayName: $displayName, role: $role, communityId: $communityId, accountSetupStatus: $accountSetupStatus, notificationDevices: $notificationDevices, phoneNumber: $phoneNumber, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res>  {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) = _$AppUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'userId') String id, String email, String displayName,@JsonKey(defaultValue: 'ADMIN') String role, String? communityId,@JsonKey(name: 'onboardingState', unknownEnumValue: AccountSetupStatus.adminRegistered, defaultValue: AccountSetupStatus.adminRegistered) AccountSetupStatus accountSetupStatus, List<NotificationDevice> notificationDevices, String? phoneNumber, String? photoUrl
});




}
/// @nodoc
class _$AppUserCopyWithImpl<$Res>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? displayName = null,Object? role = null,Object? communityId = freezed,Object? accountSetupStatus = null,Object? notificationDevices = null,Object? phoneNumber = freezed,Object? photoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String?,accountSetupStatus: null == accountSetupStatus ? _self.accountSetupStatus : accountSetupStatus // ignore: cast_nullable_to_non_nullable
as AccountSetupStatus,notificationDevices: null == notificationDevices ? _self.notificationDevices : notificationDevices // ignore: cast_nullable_to_non_nullable
as List<NotificationDevice>,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUser].
extension AppUserPatterns on AppUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUser value)  $default,){
final _that = this;
switch (_that) {
case _AppUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUser value)?  $default,){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'userId')  String id,  String email,  String displayName, @JsonKey(defaultValue: 'ADMIN')  String role,  String? communityId, @JsonKey(name: 'onboardingState', unknownEnumValue: AccountSetupStatus.adminRegistered, defaultValue: AccountSetupStatus.adminRegistered)  AccountSetupStatus accountSetupStatus,  List<NotificationDevice> notificationDevices,  String? phoneNumber,  String? photoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.communityId,_that.accountSetupStatus,_that.notificationDevices,_that.phoneNumber,_that.photoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'userId')  String id,  String email,  String displayName, @JsonKey(defaultValue: 'ADMIN')  String role,  String? communityId, @JsonKey(name: 'onboardingState', unknownEnumValue: AccountSetupStatus.adminRegistered, defaultValue: AccountSetupStatus.adminRegistered)  AccountSetupStatus accountSetupStatus,  List<NotificationDevice> notificationDevices,  String? phoneNumber,  String? photoUrl)  $default,) {final _that = this;
switch (_that) {
case _AppUser():
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.communityId,_that.accountSetupStatus,_that.notificationDevices,_that.phoneNumber,_that.photoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'userId')  String id,  String email,  String displayName, @JsonKey(defaultValue: 'ADMIN')  String role,  String? communityId, @JsonKey(name: 'onboardingState', unknownEnumValue: AccountSetupStatus.adminRegistered, defaultValue: AccountSetupStatus.adminRegistered)  AccountSetupStatus accountSetupStatus,  List<NotificationDevice> notificationDevices,  String? phoneNumber,  String? photoUrl)?  $default,) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.communityId,_that.accountSetupStatus,_that.notificationDevices,_that.phoneNumber,_that.photoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUser implements AppUser {
  const _AppUser({@JsonKey(name: 'userId') this.id = "", this.email = '', this.displayName = '', @JsonKey(defaultValue: 'ADMIN') this.role = 'ADMIN', this.communityId, @JsonKey(name: 'onboardingState', unknownEnumValue: AccountSetupStatus.adminRegistered, defaultValue: AccountSetupStatus.adminRegistered) this.accountSetupStatus = AccountSetupStatus.adminRegistered, final  List<NotificationDevice> notificationDevices = const [], this.phoneNumber, this.photoUrl}): _notificationDevices = notificationDevices;
  factory _AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

@override@JsonKey(name: 'userId') final  String id;
@override@JsonKey() final  String email;
@override@JsonKey() final  String displayName;
@override@JsonKey(defaultValue: 'ADMIN') final  String role;
@override final  String? communityId;
@override@JsonKey(name: 'onboardingState', unknownEnumValue: AccountSetupStatus.adminRegistered, defaultValue: AccountSetupStatus.adminRegistered) final  AccountSetupStatus accountSetupStatus;
 final  List<NotificationDevice> _notificationDevices;
@override@JsonKey() List<NotificationDevice> get notificationDevices {
  if (_notificationDevices is EqualUnmodifiableListView) return _notificationDevices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notificationDevices);
}

@override final  String? phoneNumber;
@override final  String? photoUrl;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserCopyWith<_AppUser> get copyWith => __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.accountSetupStatus, accountSetupStatus) || other.accountSetupStatus == accountSetupStatus)&&const DeepCollectionEquality().equals(other._notificationDevices, _notificationDevices)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,role,communityId,accountSetupStatus,const DeepCollectionEquality().hash(_notificationDevices),phoneNumber,photoUrl);

@override
String toString() {
  return 'AppUser(id: $id, email: $email, displayName: $displayName, role: $role, communityId: $communityId, accountSetupStatus: $accountSetupStatus, notificationDevices: $notificationDevices, phoneNumber: $phoneNumber, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) = __$AppUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'userId') String id, String email, String displayName,@JsonKey(defaultValue: 'ADMIN') String role, String? communityId,@JsonKey(name: 'onboardingState', unknownEnumValue: AccountSetupStatus.adminRegistered, defaultValue: AccountSetupStatus.adminRegistered) AccountSetupStatus accountSetupStatus, List<NotificationDevice> notificationDevices, String? phoneNumber, String? photoUrl
});




}
/// @nodoc
class __$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? displayName = null,Object? role = null,Object? communityId = freezed,Object? accountSetupStatus = null,Object? notificationDevices = null,Object? phoneNumber = freezed,Object? photoUrl = freezed,}) {
  return _then(_AppUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String?,accountSetupStatus: null == accountSetupStatus ? _self.accountSetupStatus : accountSetupStatus // ignore: cast_nullable_to_non_nullable
as AccountSetupStatus,notificationDevices: null == notificationDevices ? _self._notificationDevices : notificationDevices // ignore: cast_nullable_to_non_nullable
as List<NotificationDevice>,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NotificationDevice {

/// Unique device identifier
 String get deviceId;/// Firebase Cloud Messaging token
 String get token;/// Device platform
 DevicePlatform get platform;/// Device display name (e.g. "Pavan's iPhone")
 String get deviceName;/// Whether this device should receive notifications
 bool get isActive;/// Audit
 DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of NotificationDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDeviceCopyWith<NotificationDevice> get copyWith => _$NotificationDeviceCopyWithImpl<NotificationDevice>(this as NotificationDevice, _$identity);

  /// Serializes this NotificationDevice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDevice&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.token, token) || other.token == token)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,token,platform,deviceName,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'NotificationDevice(deviceId: $deviceId, token: $token, platform: $platform, deviceName: $deviceName, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NotificationDeviceCopyWith<$Res>  {
  factory $NotificationDeviceCopyWith(NotificationDevice value, $Res Function(NotificationDevice) _then) = _$NotificationDeviceCopyWithImpl;
@useResult
$Res call({
 String deviceId, String token, DevicePlatform platform, String deviceName, bool isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$NotificationDeviceCopyWithImpl<$Res>
    implements $NotificationDeviceCopyWith<$Res> {
  _$NotificationDeviceCopyWithImpl(this._self, this._then);

  final NotificationDevice _self;
  final $Res Function(NotificationDevice) _then;

/// Create a copy of NotificationDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? token = null,Object? platform = null,Object? deviceName = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as DevicePlatform,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationDevice].
extension NotificationDevicePatterns on NotificationDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationDevice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationDevice value)  $default,){
final _that = this;
switch (_that) {
case _NotificationDevice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationDevice value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationDevice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  String token,  DevicePlatform platform,  String deviceName,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationDevice() when $default != null:
return $default(_that.deviceId,_that.token,_that.platform,_that.deviceName,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  String token,  DevicePlatform platform,  String deviceName,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationDevice():
return $default(_that.deviceId,_that.token,_that.platform,_that.deviceName,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  String token,  DevicePlatform platform,  String deviceName,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationDevice() when $default != null:
return $default(_that.deviceId,_that.token,_that.platform,_that.deviceName,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationDevice implements NotificationDevice {
  const _NotificationDevice({this.deviceId = '', this.token = '', this.platform = DevicePlatform.android, this.deviceName = '', this.isActive = true, this.createdAt, this.updatedAt});
  factory _NotificationDevice.fromJson(Map<String, dynamic> json) => _$NotificationDeviceFromJson(json);

/// Unique device identifier
@override@JsonKey() final  String deviceId;
/// Firebase Cloud Messaging token
@override@JsonKey() final  String token;
/// Device platform
@override@JsonKey() final  DevicePlatform platform;
/// Device display name (e.g. "Pavan's iPhone")
@override@JsonKey() final  String deviceName;
/// Whether this device should receive notifications
@override@JsonKey() final  bool isActive;
/// Audit
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of NotificationDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationDeviceCopyWith<_NotificationDevice> get copyWith => __$NotificationDeviceCopyWithImpl<_NotificationDevice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationDeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationDevice&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.token, token) || other.token == token)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,token,platform,deviceName,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'NotificationDevice(deviceId: $deviceId, token: $token, platform: $platform, deviceName: $deviceName, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationDeviceCopyWith<$Res> implements $NotificationDeviceCopyWith<$Res> {
  factory _$NotificationDeviceCopyWith(_NotificationDevice value, $Res Function(_NotificationDevice) _then) = __$NotificationDeviceCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, String token, DevicePlatform platform, String deviceName, bool isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$NotificationDeviceCopyWithImpl<$Res>
    implements _$NotificationDeviceCopyWith<$Res> {
  __$NotificationDeviceCopyWithImpl(this._self, this._then);

  final _NotificationDevice _self;
  final $Res Function(_NotificationDevice) _then;

/// Create a copy of NotificationDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? token = null,Object? platform = null,Object? deviceName = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_NotificationDevice(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as DevicePlatform,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
