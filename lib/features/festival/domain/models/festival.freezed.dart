// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'festival.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Festival {

 String get id; String get communityId; String get name; String get description; String? get bannerUrl; DateTime get startDate; DateTime get endDate; FestivalStatus get status; double get goal; double get totalDonationAmount; int get totalDonationCount; double get totalExpenseAmount; int get totalExpenseCount; int get totalVolunteerCount; List<String> get assignedVolunteerIds; PaymentDetails? get paymentDetails; String get createdBy; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Festival
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FestivalCopyWith<Festival> get copyWith => _$FestivalCopyWithImpl<Festival>(this as Festival, _$identity);

  /// Serializes this Festival to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Festival&&(identical(other.id, id) || other.id == id)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.totalDonationAmount, totalDonationAmount) || other.totalDonationAmount == totalDonationAmount)&&(identical(other.totalDonationCount, totalDonationCount) || other.totalDonationCount == totalDonationCount)&&(identical(other.totalExpenseAmount, totalExpenseAmount) || other.totalExpenseAmount == totalExpenseAmount)&&(identical(other.totalExpenseCount, totalExpenseCount) || other.totalExpenseCount == totalExpenseCount)&&(identical(other.totalVolunteerCount, totalVolunteerCount) || other.totalVolunteerCount == totalVolunteerCount)&&const DeepCollectionEquality().equals(other.assignedVolunteerIds, assignedVolunteerIds)&&(identical(other.paymentDetails, paymentDetails) || other.paymentDetails == paymentDetails)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,communityId,name,description,bannerUrl,startDate,endDate,status,goal,totalDonationAmount,totalDonationCount,totalExpenseAmount,totalExpenseCount,totalVolunteerCount,const DeepCollectionEquality().hash(assignedVolunteerIds),paymentDetails,createdBy,createdAt,updatedAt]);

@override
String toString() {
  return 'Festival(id: $id, communityId: $communityId, name: $name, description: $description, bannerUrl: $bannerUrl, startDate: $startDate, endDate: $endDate, status: $status, goal: $goal, totalDonationAmount: $totalDonationAmount, totalDonationCount: $totalDonationCount, totalExpenseAmount: $totalExpenseAmount, totalExpenseCount: $totalExpenseCount, totalVolunteerCount: $totalVolunteerCount, assignedVolunteerIds: $assignedVolunteerIds, paymentDetails: $paymentDetails, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FestivalCopyWith<$Res>  {
  factory $FestivalCopyWith(Festival value, $Res Function(Festival) _then) = _$FestivalCopyWithImpl;
@useResult
$Res call({
 String id, String communityId, String name, String description, String? bannerUrl, DateTime startDate, DateTime endDate, FestivalStatus status, double goal, double totalDonationAmount, int totalDonationCount, double totalExpenseAmount, int totalExpenseCount, int totalVolunteerCount, List<String> assignedVolunteerIds, PaymentDetails? paymentDetails, String createdBy, DateTime createdAt, DateTime updatedAt
});


$PaymentDetailsCopyWith<$Res>? get paymentDetails;

}
/// @nodoc
class _$FestivalCopyWithImpl<$Res>
    implements $FestivalCopyWith<$Res> {
  _$FestivalCopyWithImpl(this._self, this._then);

  final Festival _self;
  final $Res Function(Festival) _then;

/// Create a copy of Festival
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? communityId = null,Object? name = null,Object? description = null,Object? bannerUrl = freezed,Object? startDate = null,Object? endDate = null,Object? status = null,Object? goal = null,Object? totalDonationAmount = null,Object? totalDonationCount = null,Object? totalExpenseAmount = null,Object? totalExpenseCount = null,Object? totalVolunteerCount = null,Object? assignedVolunteerIds = null,Object? paymentDetails = freezed,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FestivalStatus,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as double,totalDonationAmount: null == totalDonationAmount ? _self.totalDonationAmount : totalDonationAmount // ignore: cast_nullable_to_non_nullable
as double,totalDonationCount: null == totalDonationCount ? _self.totalDonationCount : totalDonationCount // ignore: cast_nullable_to_non_nullable
as int,totalExpenseAmount: null == totalExpenseAmount ? _self.totalExpenseAmount : totalExpenseAmount // ignore: cast_nullable_to_non_nullable
as double,totalExpenseCount: null == totalExpenseCount ? _self.totalExpenseCount : totalExpenseCount // ignore: cast_nullable_to_non_nullable
as int,totalVolunteerCount: null == totalVolunteerCount ? _self.totalVolunteerCount : totalVolunteerCount // ignore: cast_nullable_to_non_nullable
as int,assignedVolunteerIds: null == assignedVolunteerIds ? _self.assignedVolunteerIds : assignedVolunteerIds // ignore: cast_nullable_to_non_nullable
as List<String>,paymentDetails: freezed == paymentDetails ? _self.paymentDetails : paymentDetails // ignore: cast_nullable_to_non_nullable
as PaymentDetails?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Festival
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailsCopyWith<$Res>? get paymentDetails {
    if (_self.paymentDetails == null) {
    return null;
  }

  return $PaymentDetailsCopyWith<$Res>(_self.paymentDetails!, (value) {
    return _then(_self.copyWith(paymentDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [Festival].
extension FestivalPatterns on Festival {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Festival value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Festival() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Festival value)  $default,){
final _that = this;
switch (_that) {
case _Festival():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Festival value)?  $default,){
final _that = this;
switch (_that) {
case _Festival() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String communityId,  String name,  String description,  String? bannerUrl,  DateTime startDate,  DateTime endDate,  FestivalStatus status,  double goal,  double totalDonationAmount,  int totalDonationCount,  double totalExpenseAmount,  int totalExpenseCount,  int totalVolunteerCount,  List<String> assignedVolunteerIds,  PaymentDetails? paymentDetails,  String createdBy,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Festival() when $default != null:
return $default(_that.id,_that.communityId,_that.name,_that.description,_that.bannerUrl,_that.startDate,_that.endDate,_that.status,_that.goal,_that.totalDonationAmount,_that.totalDonationCount,_that.totalExpenseAmount,_that.totalExpenseCount,_that.totalVolunteerCount,_that.assignedVolunteerIds,_that.paymentDetails,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String communityId,  String name,  String description,  String? bannerUrl,  DateTime startDate,  DateTime endDate,  FestivalStatus status,  double goal,  double totalDonationAmount,  int totalDonationCount,  double totalExpenseAmount,  int totalExpenseCount,  int totalVolunteerCount,  List<String> assignedVolunteerIds,  PaymentDetails? paymentDetails,  String createdBy,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Festival():
return $default(_that.id,_that.communityId,_that.name,_that.description,_that.bannerUrl,_that.startDate,_that.endDate,_that.status,_that.goal,_that.totalDonationAmount,_that.totalDonationCount,_that.totalExpenseAmount,_that.totalExpenseCount,_that.totalVolunteerCount,_that.assignedVolunteerIds,_that.paymentDetails,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String communityId,  String name,  String description,  String? bannerUrl,  DateTime startDate,  DateTime endDate,  FestivalStatus status,  double goal,  double totalDonationAmount,  int totalDonationCount,  double totalExpenseAmount,  int totalExpenseCount,  int totalVolunteerCount,  List<String> assignedVolunteerIds,  PaymentDetails? paymentDetails,  String createdBy,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Festival() when $default != null:
return $default(_that.id,_that.communityId,_that.name,_that.description,_that.bannerUrl,_that.startDate,_that.endDate,_that.status,_that.goal,_that.totalDonationAmount,_that.totalDonationCount,_that.totalExpenseAmount,_that.totalExpenseCount,_that.totalVolunteerCount,_that.assignedVolunteerIds,_that.paymentDetails,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Festival implements Festival {
  const _Festival({required this.id, required this.communityId, required this.name, this.description = '', this.bannerUrl, required this.startDate, required this.endDate, this.status = FestivalStatus.draft, this.goal = 0.0, this.totalDonationAmount = 0.0, this.totalDonationCount = 0, this.totalExpenseAmount = 0.0, this.totalExpenseCount = 0, this.totalVolunteerCount = 0, final  List<String> assignedVolunteerIds = const [], this.paymentDetails, required this.createdBy, required this.createdAt, required this.updatedAt}): _assignedVolunteerIds = assignedVolunteerIds;
  factory _Festival.fromJson(Map<String, dynamic> json) => _$FestivalFromJson(json);

@override final  String id;
@override final  String communityId;
@override final  String name;
@override@JsonKey() final  String description;
@override final  String? bannerUrl;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override@JsonKey() final  FestivalStatus status;
@override@JsonKey() final  double goal;
@override@JsonKey() final  double totalDonationAmount;
@override@JsonKey() final  int totalDonationCount;
@override@JsonKey() final  double totalExpenseAmount;
@override@JsonKey() final  int totalExpenseCount;
@override@JsonKey() final  int totalVolunteerCount;
 final  List<String> _assignedVolunteerIds;
@override@JsonKey() List<String> get assignedVolunteerIds {
  if (_assignedVolunteerIds is EqualUnmodifiableListView) return _assignedVolunteerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignedVolunteerIds);
}

@override final  PaymentDetails? paymentDetails;
@override final  String createdBy;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Festival
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FestivalCopyWith<_Festival> get copyWith => __$FestivalCopyWithImpl<_Festival>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FestivalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Festival&&(identical(other.id, id) || other.id == id)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.totalDonationAmount, totalDonationAmount) || other.totalDonationAmount == totalDonationAmount)&&(identical(other.totalDonationCount, totalDonationCount) || other.totalDonationCount == totalDonationCount)&&(identical(other.totalExpenseAmount, totalExpenseAmount) || other.totalExpenseAmount == totalExpenseAmount)&&(identical(other.totalExpenseCount, totalExpenseCount) || other.totalExpenseCount == totalExpenseCount)&&(identical(other.totalVolunteerCount, totalVolunteerCount) || other.totalVolunteerCount == totalVolunteerCount)&&const DeepCollectionEquality().equals(other._assignedVolunteerIds, _assignedVolunteerIds)&&(identical(other.paymentDetails, paymentDetails) || other.paymentDetails == paymentDetails)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,communityId,name,description,bannerUrl,startDate,endDate,status,goal,totalDonationAmount,totalDonationCount,totalExpenseAmount,totalExpenseCount,totalVolunteerCount,const DeepCollectionEquality().hash(_assignedVolunteerIds),paymentDetails,createdBy,createdAt,updatedAt]);

@override
String toString() {
  return 'Festival(id: $id, communityId: $communityId, name: $name, description: $description, bannerUrl: $bannerUrl, startDate: $startDate, endDate: $endDate, status: $status, goal: $goal, totalDonationAmount: $totalDonationAmount, totalDonationCount: $totalDonationCount, totalExpenseAmount: $totalExpenseAmount, totalExpenseCount: $totalExpenseCount, totalVolunteerCount: $totalVolunteerCount, assignedVolunteerIds: $assignedVolunteerIds, paymentDetails: $paymentDetails, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FestivalCopyWith<$Res> implements $FestivalCopyWith<$Res> {
  factory _$FestivalCopyWith(_Festival value, $Res Function(_Festival) _then) = __$FestivalCopyWithImpl;
@override @useResult
$Res call({
 String id, String communityId, String name, String description, String? bannerUrl, DateTime startDate, DateTime endDate, FestivalStatus status, double goal, double totalDonationAmount, int totalDonationCount, double totalExpenseAmount, int totalExpenseCount, int totalVolunteerCount, List<String> assignedVolunteerIds, PaymentDetails? paymentDetails, String createdBy, DateTime createdAt, DateTime updatedAt
});


@override $PaymentDetailsCopyWith<$Res>? get paymentDetails;

}
/// @nodoc
class __$FestivalCopyWithImpl<$Res>
    implements _$FestivalCopyWith<$Res> {
  __$FestivalCopyWithImpl(this._self, this._then);

  final _Festival _self;
  final $Res Function(_Festival) _then;

/// Create a copy of Festival
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? communityId = null,Object? name = null,Object? description = null,Object? bannerUrl = freezed,Object? startDate = null,Object? endDate = null,Object? status = null,Object? goal = null,Object? totalDonationAmount = null,Object? totalDonationCount = null,Object? totalExpenseAmount = null,Object? totalExpenseCount = null,Object? totalVolunteerCount = null,Object? assignedVolunteerIds = null,Object? paymentDetails = freezed,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Festival(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FestivalStatus,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as double,totalDonationAmount: null == totalDonationAmount ? _self.totalDonationAmount : totalDonationAmount // ignore: cast_nullable_to_non_nullable
as double,totalDonationCount: null == totalDonationCount ? _self.totalDonationCount : totalDonationCount // ignore: cast_nullable_to_non_nullable
as int,totalExpenseAmount: null == totalExpenseAmount ? _self.totalExpenseAmount : totalExpenseAmount // ignore: cast_nullable_to_non_nullable
as double,totalExpenseCount: null == totalExpenseCount ? _self.totalExpenseCount : totalExpenseCount // ignore: cast_nullable_to_non_nullable
as int,totalVolunteerCount: null == totalVolunteerCount ? _self.totalVolunteerCount : totalVolunteerCount // ignore: cast_nullable_to_non_nullable
as int,assignedVolunteerIds: null == assignedVolunteerIds ? _self._assignedVolunteerIds : assignedVolunteerIds // ignore: cast_nullable_to_non_nullable
as List<String>,paymentDetails: freezed == paymentDetails ? _self.paymentDetails : paymentDetails // ignore: cast_nullable_to_non_nullable
as PaymentDetails?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Festival
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailsCopyWith<$Res>? get paymentDetails {
    if (_self.paymentDetails == null) {
    return null;
  }

  return $PaymentDetailsCopyWith<$Res>(_self.paymentDetails!, (value) {
    return _then(_self.copyWith(paymentDetails: value));
  });
}
}

// dart format on
