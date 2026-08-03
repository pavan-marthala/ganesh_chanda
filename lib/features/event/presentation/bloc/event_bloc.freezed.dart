// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EventEvent()';
}


}

/// @nodoc
class $EventEventCopyWith<$Res>  {
$EventEventCopyWith(EventEvent _, $Res Function(EventEvent) __);
}


/// Adds pattern-matching-related methods to [EventEvent].
extension EventEventPatterns on EventEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadEventsByFestivalRequested value)?  loadEventsByFestivalRequested,TResult Function( _LoadEventsByCommunityRequested value)?  loadEventsByCommunityRequested,TResult Function( _GetEventByIdRequested value)?  getEventByIdRequested,TResult Function( _CreateEventRequested value)?  createEventRequested,TResult Function( _UpdateEventRequested value)?  updateEventRequested,TResult Function( _DeleteEventRequested value)?  deleteEventRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadEventsByFestivalRequested() when loadEventsByFestivalRequested != null:
return loadEventsByFestivalRequested(_that);case _LoadEventsByCommunityRequested() when loadEventsByCommunityRequested != null:
return loadEventsByCommunityRequested(_that);case _GetEventByIdRequested() when getEventByIdRequested != null:
return getEventByIdRequested(_that);case _CreateEventRequested() when createEventRequested != null:
return createEventRequested(_that);case _UpdateEventRequested() when updateEventRequested != null:
return updateEventRequested(_that);case _DeleteEventRequested() when deleteEventRequested != null:
return deleteEventRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadEventsByFestivalRequested value)  loadEventsByFestivalRequested,required TResult Function( _LoadEventsByCommunityRequested value)  loadEventsByCommunityRequested,required TResult Function( _GetEventByIdRequested value)  getEventByIdRequested,required TResult Function( _CreateEventRequested value)  createEventRequested,required TResult Function( _UpdateEventRequested value)  updateEventRequested,required TResult Function( _DeleteEventRequested value)  deleteEventRequested,}){
final _that = this;
switch (_that) {
case _LoadEventsByFestivalRequested():
return loadEventsByFestivalRequested(_that);case _LoadEventsByCommunityRequested():
return loadEventsByCommunityRequested(_that);case _GetEventByIdRequested():
return getEventByIdRequested(_that);case _CreateEventRequested():
return createEventRequested(_that);case _UpdateEventRequested():
return updateEventRequested(_that);case _DeleteEventRequested():
return deleteEventRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadEventsByFestivalRequested value)?  loadEventsByFestivalRequested,TResult? Function( _LoadEventsByCommunityRequested value)?  loadEventsByCommunityRequested,TResult? Function( _GetEventByIdRequested value)?  getEventByIdRequested,TResult? Function( _CreateEventRequested value)?  createEventRequested,TResult? Function( _UpdateEventRequested value)?  updateEventRequested,TResult? Function( _DeleteEventRequested value)?  deleteEventRequested,}){
final _that = this;
switch (_that) {
case _LoadEventsByFestivalRequested() when loadEventsByFestivalRequested != null:
return loadEventsByFestivalRequested(_that);case _LoadEventsByCommunityRequested() when loadEventsByCommunityRequested != null:
return loadEventsByCommunityRequested(_that);case _GetEventByIdRequested() when getEventByIdRequested != null:
return getEventByIdRequested(_that);case _CreateEventRequested() when createEventRequested != null:
return createEventRequested(_that);case _UpdateEventRequested() when updateEventRequested != null:
return updateEventRequested(_that);case _DeleteEventRequested() when deleteEventRequested != null:
return deleteEventRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String festivalId)?  loadEventsByFestivalRequested,TResult Function( String communityId)?  loadEventsByCommunityRequested,TResult Function( String eventId)?  getEventByIdRequested,TResult Function( Event event)?  createEventRequested,TResult Function( Event event)?  updateEventRequested,TResult Function( String eventId,  String festivalId)?  deleteEventRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadEventsByFestivalRequested() when loadEventsByFestivalRequested != null:
return loadEventsByFestivalRequested(_that.festivalId);case _LoadEventsByCommunityRequested() when loadEventsByCommunityRequested != null:
return loadEventsByCommunityRequested(_that.communityId);case _GetEventByIdRequested() when getEventByIdRequested != null:
return getEventByIdRequested(_that.eventId);case _CreateEventRequested() when createEventRequested != null:
return createEventRequested(_that.event);case _UpdateEventRequested() when updateEventRequested != null:
return updateEventRequested(_that.event);case _DeleteEventRequested() when deleteEventRequested != null:
return deleteEventRequested(_that.eventId,_that.festivalId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String festivalId)  loadEventsByFestivalRequested,required TResult Function( String communityId)  loadEventsByCommunityRequested,required TResult Function( String eventId)  getEventByIdRequested,required TResult Function( Event event)  createEventRequested,required TResult Function( Event event)  updateEventRequested,required TResult Function( String eventId,  String festivalId)  deleteEventRequested,}) {final _that = this;
switch (_that) {
case _LoadEventsByFestivalRequested():
return loadEventsByFestivalRequested(_that.festivalId);case _LoadEventsByCommunityRequested():
return loadEventsByCommunityRequested(_that.communityId);case _GetEventByIdRequested():
return getEventByIdRequested(_that.eventId);case _CreateEventRequested():
return createEventRequested(_that.event);case _UpdateEventRequested():
return updateEventRequested(_that.event);case _DeleteEventRequested():
return deleteEventRequested(_that.eventId,_that.festivalId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String festivalId)?  loadEventsByFestivalRequested,TResult? Function( String communityId)?  loadEventsByCommunityRequested,TResult? Function( String eventId)?  getEventByIdRequested,TResult? Function( Event event)?  createEventRequested,TResult? Function( Event event)?  updateEventRequested,TResult? Function( String eventId,  String festivalId)?  deleteEventRequested,}) {final _that = this;
switch (_that) {
case _LoadEventsByFestivalRequested() when loadEventsByFestivalRequested != null:
return loadEventsByFestivalRequested(_that.festivalId);case _LoadEventsByCommunityRequested() when loadEventsByCommunityRequested != null:
return loadEventsByCommunityRequested(_that.communityId);case _GetEventByIdRequested() when getEventByIdRequested != null:
return getEventByIdRequested(_that.eventId);case _CreateEventRequested() when createEventRequested != null:
return createEventRequested(_that.event);case _UpdateEventRequested() when updateEventRequested != null:
return updateEventRequested(_that.event);case _DeleteEventRequested() when deleteEventRequested != null:
return deleteEventRequested(_that.eventId,_that.festivalId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadEventsByFestivalRequested implements EventEvent {
  const _LoadEventsByFestivalRequested({required this.festivalId});
  

 final  String festivalId;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadEventsByFestivalRequestedCopyWith<_LoadEventsByFestivalRequested> get copyWith => __$LoadEventsByFestivalRequestedCopyWithImpl<_LoadEventsByFestivalRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadEventsByFestivalRequested&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId));
}


@override
int get hashCode => Object.hash(runtimeType,festivalId);

@override
String toString() {
  return 'EventEvent.loadEventsByFestivalRequested(festivalId: $festivalId)';
}


}

/// @nodoc
abstract mixin class _$LoadEventsByFestivalRequestedCopyWith<$Res> implements $EventEventCopyWith<$Res> {
  factory _$LoadEventsByFestivalRequestedCopyWith(_LoadEventsByFestivalRequested value, $Res Function(_LoadEventsByFestivalRequested) _then) = __$LoadEventsByFestivalRequestedCopyWithImpl;
@useResult
$Res call({
 String festivalId
});




}
/// @nodoc
class __$LoadEventsByFestivalRequestedCopyWithImpl<$Res>
    implements _$LoadEventsByFestivalRequestedCopyWith<$Res> {
  __$LoadEventsByFestivalRequestedCopyWithImpl(this._self, this._then);

  final _LoadEventsByFestivalRequested _self;
  final $Res Function(_LoadEventsByFestivalRequested) _then;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? festivalId = null,}) {
  return _then(_LoadEventsByFestivalRequested(
festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadEventsByCommunityRequested implements EventEvent {
  const _LoadEventsByCommunityRequested({required this.communityId});
  

 final  String communityId;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadEventsByCommunityRequestedCopyWith<_LoadEventsByCommunityRequested> get copyWith => __$LoadEventsByCommunityRequestedCopyWithImpl<_LoadEventsByCommunityRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadEventsByCommunityRequested&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,communityId);

@override
String toString() {
  return 'EventEvent.loadEventsByCommunityRequested(communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$LoadEventsByCommunityRequestedCopyWith<$Res> implements $EventEventCopyWith<$Res> {
  factory _$LoadEventsByCommunityRequestedCopyWith(_LoadEventsByCommunityRequested value, $Res Function(_LoadEventsByCommunityRequested) _then) = __$LoadEventsByCommunityRequestedCopyWithImpl;
@useResult
$Res call({
 String communityId
});




}
/// @nodoc
class __$LoadEventsByCommunityRequestedCopyWithImpl<$Res>
    implements _$LoadEventsByCommunityRequestedCopyWith<$Res> {
  __$LoadEventsByCommunityRequestedCopyWithImpl(this._self, this._then);

  final _LoadEventsByCommunityRequested _self;
  final $Res Function(_LoadEventsByCommunityRequested) _then;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? communityId = null,}) {
  return _then(_LoadEventsByCommunityRequested(
communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GetEventByIdRequested implements EventEvent {
  const _GetEventByIdRequested({required this.eventId});
  

 final  String eventId;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetEventByIdRequestedCopyWith<_GetEventByIdRequested> get copyWith => __$GetEventByIdRequestedCopyWithImpl<_GetEventByIdRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetEventByIdRequested&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode => Object.hash(runtimeType,eventId);

@override
String toString() {
  return 'EventEvent.getEventByIdRequested(eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$GetEventByIdRequestedCopyWith<$Res> implements $EventEventCopyWith<$Res> {
  factory _$GetEventByIdRequestedCopyWith(_GetEventByIdRequested value, $Res Function(_GetEventByIdRequested) _then) = __$GetEventByIdRequestedCopyWithImpl;
@useResult
$Res call({
 String eventId
});




}
/// @nodoc
class __$GetEventByIdRequestedCopyWithImpl<$Res>
    implements _$GetEventByIdRequestedCopyWith<$Res> {
  __$GetEventByIdRequestedCopyWithImpl(this._self, this._then);

  final _GetEventByIdRequested _self;
  final $Res Function(_GetEventByIdRequested) _then;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,}) {
  return _then(_GetEventByIdRequested(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CreateEventRequested implements EventEvent {
  const _CreateEventRequested({required this.event});
  

 final  Event event;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateEventRequestedCopyWith<_CreateEventRequested> get copyWith => __$CreateEventRequestedCopyWithImpl<_CreateEventRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateEventRequested&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,event);

@override
String toString() {
  return 'EventEvent.createEventRequested(event: $event)';
}


}

/// @nodoc
abstract mixin class _$CreateEventRequestedCopyWith<$Res> implements $EventEventCopyWith<$Res> {
  factory _$CreateEventRequestedCopyWith(_CreateEventRequested value, $Res Function(_CreateEventRequested) _then) = __$CreateEventRequestedCopyWithImpl;
@useResult
$Res call({
 Event event
});


$EventCopyWith<$Res> get event;

}
/// @nodoc
class __$CreateEventRequestedCopyWithImpl<$Res>
    implements _$CreateEventRequestedCopyWith<$Res> {
  __$CreateEventRequestedCopyWithImpl(this._self, this._then);

  final _CreateEventRequested _self;
  final $Res Function(_CreateEventRequested) _then;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = null,}) {
  return _then(_CreateEventRequested(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as Event,
  ));
}

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventCopyWith<$Res> get event {
  
  return $EventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class _UpdateEventRequested implements EventEvent {
  const _UpdateEventRequested({required this.event});
  

 final  Event event;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateEventRequestedCopyWith<_UpdateEventRequested> get copyWith => __$UpdateEventRequestedCopyWithImpl<_UpdateEventRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateEventRequested&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,event);

@override
String toString() {
  return 'EventEvent.updateEventRequested(event: $event)';
}


}

/// @nodoc
abstract mixin class _$UpdateEventRequestedCopyWith<$Res> implements $EventEventCopyWith<$Res> {
  factory _$UpdateEventRequestedCopyWith(_UpdateEventRequested value, $Res Function(_UpdateEventRequested) _then) = __$UpdateEventRequestedCopyWithImpl;
@useResult
$Res call({
 Event event
});


$EventCopyWith<$Res> get event;

}
/// @nodoc
class __$UpdateEventRequestedCopyWithImpl<$Res>
    implements _$UpdateEventRequestedCopyWith<$Res> {
  __$UpdateEventRequestedCopyWithImpl(this._self, this._then);

  final _UpdateEventRequested _self;
  final $Res Function(_UpdateEventRequested) _then;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = null,}) {
  return _then(_UpdateEventRequested(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as Event,
  ));
}

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventCopyWith<$Res> get event {
  
  return $EventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class _DeleteEventRequested implements EventEvent {
  const _DeleteEventRequested({required this.eventId, required this.festivalId});
  

 final  String eventId;
 final  String festivalId;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteEventRequestedCopyWith<_DeleteEventRequested> get copyWith => __$DeleteEventRequestedCopyWithImpl<_DeleteEventRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteEventRequested&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId));
}


@override
int get hashCode => Object.hash(runtimeType,eventId,festivalId);

@override
String toString() {
  return 'EventEvent.deleteEventRequested(eventId: $eventId, festivalId: $festivalId)';
}


}

/// @nodoc
abstract mixin class _$DeleteEventRequestedCopyWith<$Res> implements $EventEventCopyWith<$Res> {
  factory _$DeleteEventRequestedCopyWith(_DeleteEventRequested value, $Res Function(_DeleteEventRequested) _then) = __$DeleteEventRequestedCopyWithImpl;
@useResult
$Res call({
 String eventId, String festivalId
});




}
/// @nodoc
class __$DeleteEventRequestedCopyWithImpl<$Res>
    implements _$DeleteEventRequestedCopyWith<$Res> {
  __$DeleteEventRequestedCopyWithImpl(this._self, this._then);

  final _DeleteEventRequested _self;
  final $Res Function(_DeleteEventRequested) _then;

/// Create a copy of EventEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,Object? festivalId = null,}) {
  return _then(_DeleteEventRequested(
eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$EventState {

 List<Event> get events; StateStatus get eventsStatus; String? get eventsError; Event? get selectedEvent; StateStatus get eventDetailsStatus; String? get eventDetailsError; StateStatus get eventActionStatus; String? get eventActionError;
/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventStateCopyWith<EventState> get copyWith => _$EventStateCopyWithImpl<EventState>(this as EventState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventState&&const DeepCollectionEquality().equals(other.events, events)&&(identical(other.eventsStatus, eventsStatus) || other.eventsStatus == eventsStatus)&&(identical(other.eventsError, eventsError) || other.eventsError == eventsError)&&(identical(other.selectedEvent, selectedEvent) || other.selectedEvent == selectedEvent)&&(identical(other.eventDetailsStatus, eventDetailsStatus) || other.eventDetailsStatus == eventDetailsStatus)&&(identical(other.eventDetailsError, eventDetailsError) || other.eventDetailsError == eventDetailsError)&&(identical(other.eventActionStatus, eventActionStatus) || other.eventActionStatus == eventActionStatus)&&(identical(other.eventActionError, eventActionError) || other.eventActionError == eventActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(events),eventsStatus,eventsError,selectedEvent,eventDetailsStatus,eventDetailsError,eventActionStatus,eventActionError);

@override
String toString() {
  return 'EventState(events: $events, eventsStatus: $eventsStatus, eventsError: $eventsError, selectedEvent: $selectedEvent, eventDetailsStatus: $eventDetailsStatus, eventDetailsError: $eventDetailsError, eventActionStatus: $eventActionStatus, eventActionError: $eventActionError)';
}


}

/// @nodoc
abstract mixin class $EventStateCopyWith<$Res>  {
  factory $EventStateCopyWith(EventState value, $Res Function(EventState) _then) = _$EventStateCopyWithImpl;
@useResult
$Res call({
 List<Event> events, StateStatus eventsStatus, String? eventsError, Event? selectedEvent, StateStatus eventDetailsStatus, String? eventDetailsError, StateStatus eventActionStatus, String? eventActionError
});


$EventCopyWith<$Res>? get selectedEvent;

}
/// @nodoc
class _$EventStateCopyWithImpl<$Res>
    implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._self, this._then);

  final EventState _self;
  final $Res Function(EventState) _then;

/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? events = null,Object? eventsStatus = null,Object? eventsError = freezed,Object? selectedEvent = freezed,Object? eventDetailsStatus = null,Object? eventDetailsError = freezed,Object? eventActionStatus = null,Object? eventActionError = freezed,}) {
  return _then(_self.copyWith(
events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<Event>,eventsStatus: null == eventsStatus ? _self.eventsStatus : eventsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,eventsError: freezed == eventsError ? _self.eventsError : eventsError // ignore: cast_nullable_to_non_nullable
as String?,selectedEvent: freezed == selectedEvent ? _self.selectedEvent : selectedEvent // ignore: cast_nullable_to_non_nullable
as Event?,eventDetailsStatus: null == eventDetailsStatus ? _self.eventDetailsStatus : eventDetailsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,eventDetailsError: freezed == eventDetailsError ? _self.eventDetailsError : eventDetailsError // ignore: cast_nullable_to_non_nullable
as String?,eventActionStatus: null == eventActionStatus ? _self.eventActionStatus : eventActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,eventActionError: freezed == eventActionError ? _self.eventActionError : eventActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventCopyWith<$Res>? get selectedEvent {
    if (_self.selectedEvent == null) {
    return null;
  }

  return $EventCopyWith<$Res>(_self.selectedEvent!, (value) {
    return _then(_self.copyWith(selectedEvent: value));
  });
}
}


/// Adds pattern-matching-related methods to [EventState].
extension EventStatePatterns on EventState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventState value)  $default,){
final _that = this;
switch (_that) {
case _EventState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventState value)?  $default,){
final _that = this;
switch (_that) {
case _EventState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Event> events,  StateStatus eventsStatus,  String? eventsError,  Event? selectedEvent,  StateStatus eventDetailsStatus,  String? eventDetailsError,  StateStatus eventActionStatus,  String? eventActionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventState() when $default != null:
return $default(_that.events,_that.eventsStatus,_that.eventsError,_that.selectedEvent,_that.eventDetailsStatus,_that.eventDetailsError,_that.eventActionStatus,_that.eventActionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Event> events,  StateStatus eventsStatus,  String? eventsError,  Event? selectedEvent,  StateStatus eventDetailsStatus,  String? eventDetailsError,  StateStatus eventActionStatus,  String? eventActionError)  $default,) {final _that = this;
switch (_that) {
case _EventState():
return $default(_that.events,_that.eventsStatus,_that.eventsError,_that.selectedEvent,_that.eventDetailsStatus,_that.eventDetailsError,_that.eventActionStatus,_that.eventActionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Event> events,  StateStatus eventsStatus,  String? eventsError,  Event? selectedEvent,  StateStatus eventDetailsStatus,  String? eventDetailsError,  StateStatus eventActionStatus,  String? eventActionError)?  $default,) {final _that = this;
switch (_that) {
case _EventState() when $default != null:
return $default(_that.events,_that.eventsStatus,_that.eventsError,_that.selectedEvent,_that.eventDetailsStatus,_that.eventDetailsError,_that.eventActionStatus,_that.eventActionError);case _:
  return null;

}
}

}

/// @nodoc


class _EventState implements EventState {
  const _EventState({final  List<Event> events = const [], this.eventsStatus = StateStatus.initial, this.eventsError, this.selectedEvent, this.eventDetailsStatus = StateStatus.initial, this.eventDetailsError, this.eventActionStatus = StateStatus.initial, this.eventActionError}): _events = events;
  

 final  List<Event> _events;
@override@JsonKey() List<Event> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

@override@JsonKey() final  StateStatus eventsStatus;
@override final  String? eventsError;
@override final  Event? selectedEvent;
@override@JsonKey() final  StateStatus eventDetailsStatus;
@override final  String? eventDetailsError;
@override@JsonKey() final  StateStatus eventActionStatus;
@override final  String? eventActionError;

/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventStateCopyWith<_EventState> get copyWith => __$EventStateCopyWithImpl<_EventState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventState&&const DeepCollectionEquality().equals(other._events, _events)&&(identical(other.eventsStatus, eventsStatus) || other.eventsStatus == eventsStatus)&&(identical(other.eventsError, eventsError) || other.eventsError == eventsError)&&(identical(other.selectedEvent, selectedEvent) || other.selectedEvent == selectedEvent)&&(identical(other.eventDetailsStatus, eventDetailsStatus) || other.eventDetailsStatus == eventDetailsStatus)&&(identical(other.eventDetailsError, eventDetailsError) || other.eventDetailsError == eventDetailsError)&&(identical(other.eventActionStatus, eventActionStatus) || other.eventActionStatus == eventActionStatus)&&(identical(other.eventActionError, eventActionError) || other.eventActionError == eventActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events),eventsStatus,eventsError,selectedEvent,eventDetailsStatus,eventDetailsError,eventActionStatus,eventActionError);

@override
String toString() {
  return 'EventState(events: $events, eventsStatus: $eventsStatus, eventsError: $eventsError, selectedEvent: $selectedEvent, eventDetailsStatus: $eventDetailsStatus, eventDetailsError: $eventDetailsError, eventActionStatus: $eventActionStatus, eventActionError: $eventActionError)';
}


}

/// @nodoc
abstract mixin class _$EventStateCopyWith<$Res> implements $EventStateCopyWith<$Res> {
  factory _$EventStateCopyWith(_EventState value, $Res Function(_EventState) _then) = __$EventStateCopyWithImpl;
@override @useResult
$Res call({
 List<Event> events, StateStatus eventsStatus, String? eventsError, Event? selectedEvent, StateStatus eventDetailsStatus, String? eventDetailsError, StateStatus eventActionStatus, String? eventActionError
});


@override $EventCopyWith<$Res>? get selectedEvent;

}
/// @nodoc
class __$EventStateCopyWithImpl<$Res>
    implements _$EventStateCopyWith<$Res> {
  __$EventStateCopyWithImpl(this._self, this._then);

  final _EventState _self;
  final $Res Function(_EventState) _then;

/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? events = null,Object? eventsStatus = null,Object? eventsError = freezed,Object? selectedEvent = freezed,Object? eventDetailsStatus = null,Object? eventDetailsError = freezed,Object? eventActionStatus = null,Object? eventActionError = freezed,}) {
  return _then(_EventState(
events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<Event>,eventsStatus: null == eventsStatus ? _self.eventsStatus : eventsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,eventsError: freezed == eventsError ? _self.eventsError : eventsError // ignore: cast_nullable_to_non_nullable
as String?,selectedEvent: freezed == selectedEvent ? _self.selectedEvent : selectedEvent // ignore: cast_nullable_to_non_nullable
as Event?,eventDetailsStatus: null == eventDetailsStatus ? _self.eventDetailsStatus : eventDetailsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,eventDetailsError: freezed == eventDetailsError ? _self.eventDetailsError : eventDetailsError // ignore: cast_nullable_to_non_nullable
as String?,eventActionStatus: null == eventActionStatus ? _self.eventActionStatus : eventActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,eventActionError: freezed == eventActionError ? _self.eventActionError : eventActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventCopyWith<$Res>? get selectedEvent {
    if (_self.selectedEvent == null) {
    return null;
  }

  return $EventCopyWith<$Res>(_self.selectedEvent!, (value) {
    return _then(_self.copyWith(selectedEvent: value));
  });
}
}

// dart format on
