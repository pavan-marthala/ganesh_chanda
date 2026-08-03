// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpenseEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpenseEvent()';
}


}

/// @nodoc
class $ExpenseEventCopyWith<$Res>  {
$ExpenseEventCopyWith(ExpenseEvent _, $Res Function(ExpenseEvent) __);
}


/// Adds pattern-matching-related methods to [ExpenseEvent].
extension ExpenseEventPatterns on ExpenseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadExpensesByFestivalRequested value)?  loadExpensesByFestivalRequested,TResult Function( _LoadExpensesByCommunityRequested value)?  loadExpensesByCommunityRequested,TResult Function( _GetExpenseByIdRequested value)?  getExpenseByIdRequested,TResult Function( _CreateExpenseRequested value)?  createExpenseRequested,TResult Function( _UpdateExpenseRequested value)?  updateExpenseRequested,TResult Function( _DeleteExpenseRequested value)?  deleteExpenseRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadExpensesByFestivalRequested() when loadExpensesByFestivalRequested != null:
return loadExpensesByFestivalRequested(_that);case _LoadExpensesByCommunityRequested() when loadExpensesByCommunityRequested != null:
return loadExpensesByCommunityRequested(_that);case _GetExpenseByIdRequested() when getExpenseByIdRequested != null:
return getExpenseByIdRequested(_that);case _CreateExpenseRequested() when createExpenseRequested != null:
return createExpenseRequested(_that);case _UpdateExpenseRequested() when updateExpenseRequested != null:
return updateExpenseRequested(_that);case _DeleteExpenseRequested() when deleteExpenseRequested != null:
return deleteExpenseRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadExpensesByFestivalRequested value)  loadExpensesByFestivalRequested,required TResult Function( _LoadExpensesByCommunityRequested value)  loadExpensesByCommunityRequested,required TResult Function( _GetExpenseByIdRequested value)  getExpenseByIdRequested,required TResult Function( _CreateExpenseRequested value)  createExpenseRequested,required TResult Function( _UpdateExpenseRequested value)  updateExpenseRequested,required TResult Function( _DeleteExpenseRequested value)  deleteExpenseRequested,}){
final _that = this;
switch (_that) {
case _LoadExpensesByFestivalRequested():
return loadExpensesByFestivalRequested(_that);case _LoadExpensesByCommunityRequested():
return loadExpensesByCommunityRequested(_that);case _GetExpenseByIdRequested():
return getExpenseByIdRequested(_that);case _CreateExpenseRequested():
return createExpenseRequested(_that);case _UpdateExpenseRequested():
return updateExpenseRequested(_that);case _DeleteExpenseRequested():
return deleteExpenseRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadExpensesByFestivalRequested value)?  loadExpensesByFestivalRequested,TResult? Function( _LoadExpensesByCommunityRequested value)?  loadExpensesByCommunityRequested,TResult? Function( _GetExpenseByIdRequested value)?  getExpenseByIdRequested,TResult? Function( _CreateExpenseRequested value)?  createExpenseRequested,TResult? Function( _UpdateExpenseRequested value)?  updateExpenseRequested,TResult? Function( _DeleteExpenseRequested value)?  deleteExpenseRequested,}){
final _that = this;
switch (_that) {
case _LoadExpensesByFestivalRequested() when loadExpensesByFestivalRequested != null:
return loadExpensesByFestivalRequested(_that);case _LoadExpensesByCommunityRequested() when loadExpensesByCommunityRequested != null:
return loadExpensesByCommunityRequested(_that);case _GetExpenseByIdRequested() when getExpenseByIdRequested != null:
return getExpenseByIdRequested(_that);case _CreateExpenseRequested() when createExpenseRequested != null:
return createExpenseRequested(_that);case _UpdateExpenseRequested() when updateExpenseRequested != null:
return updateExpenseRequested(_that);case _DeleteExpenseRequested() when deleteExpenseRequested != null:
return deleteExpenseRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String festivalId)?  loadExpensesByFestivalRequested,TResult Function( String communityId)?  loadExpensesByCommunityRequested,TResult Function( String expenseId)?  getExpenseByIdRequested,TResult Function( Expense expense)?  createExpenseRequested,TResult Function( Expense expense)?  updateExpenseRequested,TResult Function( String expenseId,  String festivalId)?  deleteExpenseRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadExpensesByFestivalRequested() when loadExpensesByFestivalRequested != null:
return loadExpensesByFestivalRequested(_that.festivalId);case _LoadExpensesByCommunityRequested() when loadExpensesByCommunityRequested != null:
return loadExpensesByCommunityRequested(_that.communityId);case _GetExpenseByIdRequested() when getExpenseByIdRequested != null:
return getExpenseByIdRequested(_that.expenseId);case _CreateExpenseRequested() when createExpenseRequested != null:
return createExpenseRequested(_that.expense);case _UpdateExpenseRequested() when updateExpenseRequested != null:
return updateExpenseRequested(_that.expense);case _DeleteExpenseRequested() when deleteExpenseRequested != null:
return deleteExpenseRequested(_that.expenseId,_that.festivalId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String festivalId)  loadExpensesByFestivalRequested,required TResult Function( String communityId)  loadExpensesByCommunityRequested,required TResult Function( String expenseId)  getExpenseByIdRequested,required TResult Function( Expense expense)  createExpenseRequested,required TResult Function( Expense expense)  updateExpenseRequested,required TResult Function( String expenseId,  String festivalId)  deleteExpenseRequested,}) {final _that = this;
switch (_that) {
case _LoadExpensesByFestivalRequested():
return loadExpensesByFestivalRequested(_that.festivalId);case _LoadExpensesByCommunityRequested():
return loadExpensesByCommunityRequested(_that.communityId);case _GetExpenseByIdRequested():
return getExpenseByIdRequested(_that.expenseId);case _CreateExpenseRequested():
return createExpenseRequested(_that.expense);case _UpdateExpenseRequested():
return updateExpenseRequested(_that.expense);case _DeleteExpenseRequested():
return deleteExpenseRequested(_that.expenseId,_that.festivalId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String festivalId)?  loadExpensesByFestivalRequested,TResult? Function( String communityId)?  loadExpensesByCommunityRequested,TResult? Function( String expenseId)?  getExpenseByIdRequested,TResult? Function( Expense expense)?  createExpenseRequested,TResult? Function( Expense expense)?  updateExpenseRequested,TResult? Function( String expenseId,  String festivalId)?  deleteExpenseRequested,}) {final _that = this;
switch (_that) {
case _LoadExpensesByFestivalRequested() when loadExpensesByFestivalRequested != null:
return loadExpensesByFestivalRequested(_that.festivalId);case _LoadExpensesByCommunityRequested() when loadExpensesByCommunityRequested != null:
return loadExpensesByCommunityRequested(_that.communityId);case _GetExpenseByIdRequested() when getExpenseByIdRequested != null:
return getExpenseByIdRequested(_that.expenseId);case _CreateExpenseRequested() when createExpenseRequested != null:
return createExpenseRequested(_that.expense);case _UpdateExpenseRequested() when updateExpenseRequested != null:
return updateExpenseRequested(_that.expense);case _DeleteExpenseRequested() when deleteExpenseRequested != null:
return deleteExpenseRequested(_that.expenseId,_that.festivalId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadExpensesByFestivalRequested implements ExpenseEvent {
  const _LoadExpensesByFestivalRequested({required this.festivalId});
  

 final  String festivalId;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadExpensesByFestivalRequestedCopyWith<_LoadExpensesByFestivalRequested> get copyWith => __$LoadExpensesByFestivalRequestedCopyWithImpl<_LoadExpensesByFestivalRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadExpensesByFestivalRequested&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId));
}


@override
int get hashCode => Object.hash(runtimeType,festivalId);

@override
String toString() {
  return 'ExpenseEvent.loadExpensesByFestivalRequested(festivalId: $festivalId)';
}


}

/// @nodoc
abstract mixin class _$LoadExpensesByFestivalRequestedCopyWith<$Res> implements $ExpenseEventCopyWith<$Res> {
  factory _$LoadExpensesByFestivalRequestedCopyWith(_LoadExpensesByFestivalRequested value, $Res Function(_LoadExpensesByFestivalRequested) _then) = __$LoadExpensesByFestivalRequestedCopyWithImpl;
@useResult
$Res call({
 String festivalId
});




}
/// @nodoc
class __$LoadExpensesByFestivalRequestedCopyWithImpl<$Res>
    implements _$LoadExpensesByFestivalRequestedCopyWith<$Res> {
  __$LoadExpensesByFestivalRequestedCopyWithImpl(this._self, this._then);

  final _LoadExpensesByFestivalRequested _self;
  final $Res Function(_LoadExpensesByFestivalRequested) _then;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? festivalId = null,}) {
  return _then(_LoadExpensesByFestivalRequested(
festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadExpensesByCommunityRequested implements ExpenseEvent {
  const _LoadExpensesByCommunityRequested({required this.communityId});
  

 final  String communityId;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadExpensesByCommunityRequestedCopyWith<_LoadExpensesByCommunityRequested> get copyWith => __$LoadExpensesByCommunityRequestedCopyWithImpl<_LoadExpensesByCommunityRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadExpensesByCommunityRequested&&(identical(other.communityId, communityId) || other.communityId == communityId));
}


@override
int get hashCode => Object.hash(runtimeType,communityId);

@override
String toString() {
  return 'ExpenseEvent.loadExpensesByCommunityRequested(communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$LoadExpensesByCommunityRequestedCopyWith<$Res> implements $ExpenseEventCopyWith<$Res> {
  factory _$LoadExpensesByCommunityRequestedCopyWith(_LoadExpensesByCommunityRequested value, $Res Function(_LoadExpensesByCommunityRequested) _then) = __$LoadExpensesByCommunityRequestedCopyWithImpl;
@useResult
$Res call({
 String communityId
});




}
/// @nodoc
class __$LoadExpensesByCommunityRequestedCopyWithImpl<$Res>
    implements _$LoadExpensesByCommunityRequestedCopyWith<$Res> {
  __$LoadExpensesByCommunityRequestedCopyWithImpl(this._self, this._then);

  final _LoadExpensesByCommunityRequested _self;
  final $Res Function(_LoadExpensesByCommunityRequested) _then;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? communityId = null,}) {
  return _then(_LoadExpensesByCommunityRequested(
communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GetExpenseByIdRequested implements ExpenseEvent {
  const _GetExpenseByIdRequested({required this.expenseId});
  

 final  String expenseId;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetExpenseByIdRequestedCopyWith<_GetExpenseByIdRequested> get copyWith => __$GetExpenseByIdRequestedCopyWithImpl<_GetExpenseByIdRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetExpenseByIdRequested&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId));
}


@override
int get hashCode => Object.hash(runtimeType,expenseId);

@override
String toString() {
  return 'ExpenseEvent.getExpenseByIdRequested(expenseId: $expenseId)';
}


}

/// @nodoc
abstract mixin class _$GetExpenseByIdRequestedCopyWith<$Res> implements $ExpenseEventCopyWith<$Res> {
  factory _$GetExpenseByIdRequestedCopyWith(_GetExpenseByIdRequested value, $Res Function(_GetExpenseByIdRequested) _then) = __$GetExpenseByIdRequestedCopyWithImpl;
@useResult
$Res call({
 String expenseId
});




}
/// @nodoc
class __$GetExpenseByIdRequestedCopyWithImpl<$Res>
    implements _$GetExpenseByIdRequestedCopyWith<$Res> {
  __$GetExpenseByIdRequestedCopyWithImpl(this._self, this._then);

  final _GetExpenseByIdRequested _self;
  final $Res Function(_GetExpenseByIdRequested) _then;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? expenseId = null,}) {
  return _then(_GetExpenseByIdRequested(
expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CreateExpenseRequested implements ExpenseEvent {
  const _CreateExpenseRequested({required this.expense});
  

 final  Expense expense;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateExpenseRequestedCopyWith<_CreateExpenseRequested> get copyWith => __$CreateExpenseRequestedCopyWithImpl<_CreateExpenseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateExpenseRequested&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,expense);

@override
String toString() {
  return 'ExpenseEvent.createExpenseRequested(expense: $expense)';
}


}

/// @nodoc
abstract mixin class _$CreateExpenseRequestedCopyWith<$Res> implements $ExpenseEventCopyWith<$Res> {
  factory _$CreateExpenseRequestedCopyWith(_CreateExpenseRequested value, $Res Function(_CreateExpenseRequested) _then) = __$CreateExpenseRequestedCopyWithImpl;
@useResult
$Res call({
 Expense expense
});


$ExpenseCopyWith<$Res> get expense;

}
/// @nodoc
class __$CreateExpenseRequestedCopyWithImpl<$Res>
    implements _$CreateExpenseRequestedCopyWith<$Res> {
  __$CreateExpenseRequestedCopyWithImpl(this._self, this._then);

  final _CreateExpenseRequested _self;
  final $Res Function(_CreateExpenseRequested) _then;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? expense = null,}) {
  return _then(_CreateExpenseRequested(
expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as Expense,
  ));
}

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseCopyWith<$Res> get expense {
  
  return $ExpenseCopyWith<$Res>(_self.expense, (value) {
    return _then(_self.copyWith(expense: value));
  });
}
}

/// @nodoc


class _UpdateExpenseRequested implements ExpenseEvent {
  const _UpdateExpenseRequested({required this.expense});
  

 final  Expense expense;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateExpenseRequestedCopyWith<_UpdateExpenseRequested> get copyWith => __$UpdateExpenseRequestedCopyWithImpl<_UpdateExpenseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateExpenseRequested&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,expense);

@override
String toString() {
  return 'ExpenseEvent.updateExpenseRequested(expense: $expense)';
}


}

/// @nodoc
abstract mixin class _$UpdateExpenseRequestedCopyWith<$Res> implements $ExpenseEventCopyWith<$Res> {
  factory _$UpdateExpenseRequestedCopyWith(_UpdateExpenseRequested value, $Res Function(_UpdateExpenseRequested) _then) = __$UpdateExpenseRequestedCopyWithImpl;
@useResult
$Res call({
 Expense expense
});


$ExpenseCopyWith<$Res> get expense;

}
/// @nodoc
class __$UpdateExpenseRequestedCopyWithImpl<$Res>
    implements _$UpdateExpenseRequestedCopyWith<$Res> {
  __$UpdateExpenseRequestedCopyWithImpl(this._self, this._then);

  final _UpdateExpenseRequested _self;
  final $Res Function(_UpdateExpenseRequested) _then;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? expense = null,}) {
  return _then(_UpdateExpenseRequested(
expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as Expense,
  ));
}

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseCopyWith<$Res> get expense {
  
  return $ExpenseCopyWith<$Res>(_self.expense, (value) {
    return _then(_self.copyWith(expense: value));
  });
}
}

/// @nodoc


class _DeleteExpenseRequested implements ExpenseEvent {
  const _DeleteExpenseRequested({required this.expenseId, required this.festivalId});
  

 final  String expenseId;
 final  String festivalId;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteExpenseRequestedCopyWith<_DeleteExpenseRequested> get copyWith => __$DeleteExpenseRequestedCopyWithImpl<_DeleteExpenseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteExpenseRequested&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId)&&(identical(other.festivalId, festivalId) || other.festivalId == festivalId));
}


@override
int get hashCode => Object.hash(runtimeType,expenseId,festivalId);

@override
String toString() {
  return 'ExpenseEvent.deleteExpenseRequested(expenseId: $expenseId, festivalId: $festivalId)';
}


}

/// @nodoc
abstract mixin class _$DeleteExpenseRequestedCopyWith<$Res> implements $ExpenseEventCopyWith<$Res> {
  factory _$DeleteExpenseRequestedCopyWith(_DeleteExpenseRequested value, $Res Function(_DeleteExpenseRequested) _then) = __$DeleteExpenseRequestedCopyWithImpl;
@useResult
$Res call({
 String expenseId, String festivalId
});




}
/// @nodoc
class __$DeleteExpenseRequestedCopyWithImpl<$Res>
    implements _$DeleteExpenseRequestedCopyWith<$Res> {
  __$DeleteExpenseRequestedCopyWithImpl(this._self, this._then);

  final _DeleteExpenseRequested _self;
  final $Res Function(_DeleteExpenseRequested) _then;

/// Create a copy of ExpenseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? expenseId = null,Object? festivalId = null,}) {
  return _then(_DeleteExpenseRequested(
expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,festivalId: null == festivalId ? _self.festivalId : festivalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ExpenseState {

 List<Expense> get expenses; StateStatus get expensesStatus; String? get expensesError; Expense? get selectedExpense; StateStatus get expenseDetailsStatus; String? get expenseDetailsError; StateStatus get expenseActionStatus; String? get expenseActionError;
/// Create a copy of ExpenseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseStateCopyWith<ExpenseState> get copyWith => _$ExpenseStateCopyWithImpl<ExpenseState>(this as ExpenseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseState&&const DeepCollectionEquality().equals(other.expenses, expenses)&&(identical(other.expensesStatus, expensesStatus) || other.expensesStatus == expensesStatus)&&(identical(other.expensesError, expensesError) || other.expensesError == expensesError)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.expenseDetailsStatus, expenseDetailsStatus) || other.expenseDetailsStatus == expenseDetailsStatus)&&(identical(other.expenseDetailsError, expenseDetailsError) || other.expenseDetailsError == expenseDetailsError)&&(identical(other.expenseActionStatus, expenseActionStatus) || other.expenseActionStatus == expenseActionStatus)&&(identical(other.expenseActionError, expenseActionError) || other.expenseActionError == expenseActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(expenses),expensesStatus,expensesError,selectedExpense,expenseDetailsStatus,expenseDetailsError,expenseActionStatus,expenseActionError);

@override
String toString() {
  return 'ExpenseState(expenses: $expenses, expensesStatus: $expensesStatus, expensesError: $expensesError, selectedExpense: $selectedExpense, expenseDetailsStatus: $expenseDetailsStatus, expenseDetailsError: $expenseDetailsError, expenseActionStatus: $expenseActionStatus, expenseActionError: $expenseActionError)';
}


}

/// @nodoc
abstract mixin class $ExpenseStateCopyWith<$Res>  {
  factory $ExpenseStateCopyWith(ExpenseState value, $Res Function(ExpenseState) _then) = _$ExpenseStateCopyWithImpl;
@useResult
$Res call({
 List<Expense> expenses, StateStatus expensesStatus, String? expensesError, Expense? selectedExpense, StateStatus expenseDetailsStatus, String? expenseDetailsError, StateStatus expenseActionStatus, String? expenseActionError
});


$ExpenseCopyWith<$Res>? get selectedExpense;

}
/// @nodoc
class _$ExpenseStateCopyWithImpl<$Res>
    implements $ExpenseStateCopyWith<$Res> {
  _$ExpenseStateCopyWithImpl(this._self, this._then);

  final ExpenseState _self;
  final $Res Function(ExpenseState) _then;

/// Create a copy of ExpenseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? expenses = null,Object? expensesStatus = null,Object? expensesError = freezed,Object? selectedExpense = freezed,Object? expenseDetailsStatus = null,Object? expenseDetailsError = freezed,Object? expenseActionStatus = null,Object? expenseActionError = freezed,}) {
  return _then(_self.copyWith(
expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>,expensesStatus: null == expensesStatus ? _self.expensesStatus : expensesStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,expensesError: freezed == expensesError ? _self.expensesError : expensesError // ignore: cast_nullable_to_non_nullable
as String?,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as Expense?,expenseDetailsStatus: null == expenseDetailsStatus ? _self.expenseDetailsStatus : expenseDetailsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,expenseDetailsError: freezed == expenseDetailsError ? _self.expenseDetailsError : expenseDetailsError // ignore: cast_nullable_to_non_nullable
as String?,expenseActionStatus: null == expenseActionStatus ? _self.expenseActionStatus : expenseActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,expenseActionError: freezed == expenseActionError ? _self.expenseActionError : expenseActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ExpenseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseCopyWith<$Res>? get selectedExpense {
    if (_self.selectedExpense == null) {
    return null;
  }

  return $ExpenseCopyWith<$Res>(_self.selectedExpense!, (value) {
    return _then(_self.copyWith(selectedExpense: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExpenseState].
extension ExpenseStatePatterns on ExpenseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseState value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseState value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Expense> expenses,  StateStatus expensesStatus,  String? expensesError,  Expense? selectedExpense,  StateStatus expenseDetailsStatus,  String? expenseDetailsError,  StateStatus expenseActionStatus,  String? expenseActionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseState() when $default != null:
return $default(_that.expenses,_that.expensesStatus,_that.expensesError,_that.selectedExpense,_that.expenseDetailsStatus,_that.expenseDetailsError,_that.expenseActionStatus,_that.expenseActionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Expense> expenses,  StateStatus expensesStatus,  String? expensesError,  Expense? selectedExpense,  StateStatus expenseDetailsStatus,  String? expenseDetailsError,  StateStatus expenseActionStatus,  String? expenseActionError)  $default,) {final _that = this;
switch (_that) {
case _ExpenseState():
return $default(_that.expenses,_that.expensesStatus,_that.expensesError,_that.selectedExpense,_that.expenseDetailsStatus,_that.expenseDetailsError,_that.expenseActionStatus,_that.expenseActionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Expense> expenses,  StateStatus expensesStatus,  String? expensesError,  Expense? selectedExpense,  StateStatus expenseDetailsStatus,  String? expenseDetailsError,  StateStatus expenseActionStatus,  String? expenseActionError)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseState() when $default != null:
return $default(_that.expenses,_that.expensesStatus,_that.expensesError,_that.selectedExpense,_that.expenseDetailsStatus,_that.expenseDetailsError,_that.expenseActionStatus,_that.expenseActionError);case _:
  return null;

}
}

}

/// @nodoc


class _ExpenseState implements ExpenseState {
  const _ExpenseState({final  List<Expense> expenses = const [], this.expensesStatus = StateStatus.initial, this.expensesError, this.selectedExpense, this.expenseDetailsStatus = StateStatus.initial, this.expenseDetailsError, this.expenseActionStatus = StateStatus.initial, this.expenseActionError}): _expenses = expenses;
  

 final  List<Expense> _expenses;
@override@JsonKey() List<Expense> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

@override@JsonKey() final  StateStatus expensesStatus;
@override final  String? expensesError;
@override final  Expense? selectedExpense;
@override@JsonKey() final  StateStatus expenseDetailsStatus;
@override final  String? expenseDetailsError;
@override@JsonKey() final  StateStatus expenseActionStatus;
@override final  String? expenseActionError;

/// Create a copy of ExpenseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseStateCopyWith<_ExpenseState> get copyWith => __$ExpenseStateCopyWithImpl<_ExpenseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseState&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&(identical(other.expensesStatus, expensesStatus) || other.expensesStatus == expensesStatus)&&(identical(other.expensesError, expensesError) || other.expensesError == expensesError)&&(identical(other.selectedExpense, selectedExpense) || other.selectedExpense == selectedExpense)&&(identical(other.expenseDetailsStatus, expenseDetailsStatus) || other.expenseDetailsStatus == expenseDetailsStatus)&&(identical(other.expenseDetailsError, expenseDetailsError) || other.expenseDetailsError == expenseDetailsError)&&(identical(other.expenseActionStatus, expenseActionStatus) || other.expenseActionStatus == expenseActionStatus)&&(identical(other.expenseActionError, expenseActionError) || other.expenseActionError == expenseActionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),expensesStatus,expensesError,selectedExpense,expenseDetailsStatus,expenseDetailsError,expenseActionStatus,expenseActionError);

@override
String toString() {
  return 'ExpenseState(expenses: $expenses, expensesStatus: $expensesStatus, expensesError: $expensesError, selectedExpense: $selectedExpense, expenseDetailsStatus: $expenseDetailsStatus, expenseDetailsError: $expenseDetailsError, expenseActionStatus: $expenseActionStatus, expenseActionError: $expenseActionError)';
}


}

/// @nodoc
abstract mixin class _$ExpenseStateCopyWith<$Res> implements $ExpenseStateCopyWith<$Res> {
  factory _$ExpenseStateCopyWith(_ExpenseState value, $Res Function(_ExpenseState) _then) = __$ExpenseStateCopyWithImpl;
@override @useResult
$Res call({
 List<Expense> expenses, StateStatus expensesStatus, String? expensesError, Expense? selectedExpense, StateStatus expenseDetailsStatus, String? expenseDetailsError, StateStatus expenseActionStatus, String? expenseActionError
});


@override $ExpenseCopyWith<$Res>? get selectedExpense;

}
/// @nodoc
class __$ExpenseStateCopyWithImpl<$Res>
    implements _$ExpenseStateCopyWith<$Res> {
  __$ExpenseStateCopyWithImpl(this._self, this._then);

  final _ExpenseState _self;
  final $Res Function(_ExpenseState) _then;

/// Create a copy of ExpenseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? expensesStatus = null,Object? expensesError = freezed,Object? selectedExpense = freezed,Object? expenseDetailsStatus = null,Object? expenseDetailsError = freezed,Object? expenseActionStatus = null,Object? expenseActionError = freezed,}) {
  return _then(_ExpenseState(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>,expensesStatus: null == expensesStatus ? _self.expensesStatus : expensesStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,expensesError: freezed == expensesError ? _self.expensesError : expensesError // ignore: cast_nullable_to_non_nullable
as String?,selectedExpense: freezed == selectedExpense ? _self.selectedExpense : selectedExpense // ignore: cast_nullable_to_non_nullable
as Expense?,expenseDetailsStatus: null == expenseDetailsStatus ? _self.expenseDetailsStatus : expenseDetailsStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,expenseDetailsError: freezed == expenseDetailsError ? _self.expenseDetailsError : expenseDetailsError // ignore: cast_nullable_to_non_nullable
as String?,expenseActionStatus: null == expenseActionStatus ? _self.expenseActionStatus : expenseActionStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,expenseActionError: freezed == expenseActionError ? _self.expenseActionError : expenseActionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ExpenseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseCopyWith<$Res>? get selectedExpense {
    if (_self.selectedExpense == null) {
    return null;
  }

  return $ExpenseCopyWith<$Res>(_self.selectedExpense!, (value) {
    return _then(_self.copyWith(selectedExpense: value));
  });
}
}

// dart format on
