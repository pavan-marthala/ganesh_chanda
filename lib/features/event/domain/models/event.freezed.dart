// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Event {

 String get id; String get festivalId; String get communityId; String get name; String get description; String? get bannerUrl; DateTime get date; String get startTime; String get endTime; String get location; List<String> get assignedVolunteerIds; EventStatus get status; String get createdBy; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCopyWith<Event> get copyWith => _$EventCopyWithImpl<Event>(this as Event, _$identity);

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Event&&(identical(other.id, id) || other.id == id)&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.assignedVolunteerIds, assignedVolunteerIds)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,festivalId,communityId,name,description,bannerUrl,date,startTime,endTime,location,const DeepCollectionEquality().hash(assignedVolunteerIds),status,createdBy,createdAt,updatedAt);

@override
String toString() {
  return 'Event(id: $id, festivalId: $festivalId, communityId: $communityId, name: $name, description: $description, bannerUrl: $bannerUrl, date: $date, startTime: $startTime, endTime: $endTime, location: $location, assignedVolunteerIds: $assignedVolunteerIds, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EventCopyWith<$Res>  {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) = _$EventCopyWithImpl;
@useResult
$Res call({
 String id, String festivalId, String communityId, String name, String description, String? bannerUrl, DateTime date, String startTime, String endTime, String location, List<String> assignedVolunteerIds, EventStatus status, String createdBy, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$EventCopyWithImpl<$Res>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? festivalId = null,Object? communityId = null,Object? name = null,Object? description = null,Object? bannerUrl = freezed,Object? date = null,Object? startTime = null,Object? endTime = null,Object? location = null,Object? assignedVolunteerIds = null,Object? status = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,assignedVolunteerIds: null == assignedVolunteerIds ? _self.assignedVolunteerIds : assignedVolunteerIds // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EventStatus,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Event].
extension EventPatterns on Event {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Event value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Event value)  $default,){
final _that = this;
switch (_that) {
case _Event():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Event value)?  $default,){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String festivalId,  String communityId,  String name,  String description,  String? bannerUrl,  DateTime date,  String startTime,  String endTime,  String location,  List<String> assignedVolunteerIds,  EventStatus status,  String createdBy,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.festivalId,_that.communityId,_that.name,_that.description,_that.bannerUrl,_that.date,_that.startTime,_that.endTime,_that.location,_that.assignedVolunteerIds,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String festivalId,  String communityId,  String name,  String description,  String? bannerUrl,  DateTime date,  String startTime,  String endTime,  String location,  List<String> assignedVolunteerIds,  EventStatus status,  String createdBy,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Event():
return $default(_that.id,_that.festivalId,_that.communityId,_that.name,_that.description,_that.bannerUrl,_that.date,_that.startTime,_that.endTime,_that.location,_that.assignedVolunteerIds,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String festivalId,  String communityId,  String name,  String description,  String? bannerUrl,  DateTime date,  String startTime,  String endTime,  String location,  List<String> assignedVolunteerIds,  EventStatus status,  String createdBy,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.festivalId,_that.communityId,_that.name,_that.description,_that.bannerUrl,_that.date,_that.startTime,_that.endTime,_that.location,_that.assignedVolunteerIds,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Event implements Event {
  const _Event({required this.id, required this.festivalId, required this.communityId, required this.name, required this.description, this.bannerUrl, required this.date, required this.startTime, required this.endTime, required this.location, final  List<String> assignedVolunteerIds = const [], this.status = EventStatus.upcoming, required this.createdBy, required this.createdAt, required this.updatedAt}): _assignedVolunteerIds = assignedVolunteerIds;
  factory _Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

@override final  String id;
@override final  String festivalId;
@override final  String communityId;
@override final  String name;
@override final  String description;
@override final  String? bannerUrl;
@override final  DateTime date;
@override final  String startTime;
@override final  String endTime;
@override final  String location;
 final  List<String> _assignedVolunteerIds;
@override@JsonKey() List<String> get assignedVolunteerIds {
  if (_assignedVolunteerIds is EqualUnmodifiableListView) return _assignedVolunteerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignedVolunteerIds);
}

@override@JsonKey() final  EventStatus status;
@override final  String createdBy;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCopyWith<_Event> get copyWith => __$EventCopyWithImpl<_Event>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Event&&(identical(other.id, id) || other.id == id)&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._assignedVolunteerIds, _assignedVolunteerIds)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,festivalId,communityId,name,description,bannerUrl,date,startTime,endTime,location,const DeepCollectionEquality().hash(_assignedVolunteerIds),status,createdBy,createdAt,updatedAt);

@override
String toString() {
  return 'Event(id: $id, festivalId: $festivalId, communityId: $communityId, name: $name, description: $description, bannerUrl: $bannerUrl, date: $date, startTime: $startTime, endTime: $endTime, location: $location, assignedVolunteerIds: $assignedVolunteerIds, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) = __$EventCopyWithImpl;
@override @useResult
$Res call({
 String id, String festivalId, String communityId, String name, String description, String? bannerUrl, DateTime date, String startTime, String endTime, String location, List<String> assignedVolunteerIds, EventStatus status, String createdBy, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? festivalId = null,Object? communityId = null,Object? name = null,Object? description = null,Object? bannerUrl = freezed,Object? date = null,Object? startTime = null,Object? endTime = null,Object? location = null,Object? assignedVolunteerIds = null,Object? status = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Event(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,assignedVolunteerIds: null == assignedVolunteerIds ? _self._assignedVolunteerIds : assignedVolunteerIds // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EventStatus,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
