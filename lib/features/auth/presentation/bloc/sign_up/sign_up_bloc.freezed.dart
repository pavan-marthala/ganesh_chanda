// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpEvent()';
}


}

/// @nodoc
class $SignUpEventCopyWith<$Res>  {
$SignUpEventCopyWith(SignUpEvent _, $Res Function(SignUpEvent) __);
}


/// Adds pattern-matching-related methods to [SignUpEvent].
extension SignUpEventPatterns on SignUpEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DisplayNameChanged value)?  displayNameChanged,TResult Function( EmailChanged value)?  emailChanged,TResult Function( PasswordChanged value)?  passwordChanged,TResult Function( ConfirmPasswordChanged value)?  confirmPasswordChanged,TResult Function( SignUpSubmitted value)?  signUpSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DisplayNameChanged() when displayNameChanged != null:
return displayNameChanged(_that);case EmailChanged() when emailChanged != null:
return emailChanged(_that);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case ConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that);case SignUpSubmitted() when signUpSubmitted != null:
return signUpSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DisplayNameChanged value)  displayNameChanged,required TResult Function( EmailChanged value)  emailChanged,required TResult Function( PasswordChanged value)  passwordChanged,required TResult Function( ConfirmPasswordChanged value)  confirmPasswordChanged,required TResult Function( SignUpSubmitted value)  signUpSubmitted,}){
final _that = this;
switch (_that) {
case DisplayNameChanged():
return displayNameChanged(_that);case EmailChanged():
return emailChanged(_that);case PasswordChanged():
return passwordChanged(_that);case ConfirmPasswordChanged():
return confirmPasswordChanged(_that);case SignUpSubmitted():
return signUpSubmitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DisplayNameChanged value)?  displayNameChanged,TResult? Function( EmailChanged value)?  emailChanged,TResult? Function( PasswordChanged value)?  passwordChanged,TResult? Function( ConfirmPasswordChanged value)?  confirmPasswordChanged,TResult? Function( SignUpSubmitted value)?  signUpSubmitted,}){
final _that = this;
switch (_that) {
case DisplayNameChanged() when displayNameChanged != null:
return displayNameChanged(_that);case EmailChanged() when emailChanged != null:
return emailChanged(_that);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case ConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that);case SignUpSubmitted() when signUpSubmitted != null:
return signUpSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String displayName)?  displayNameChanged,TResult Function( String email)?  emailChanged,TResult Function( String password)?  passwordChanged,TResult Function( String confirmPassword)?  confirmPasswordChanged,TResult Function()?  signUpSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DisplayNameChanged() when displayNameChanged != null:
return displayNameChanged(_that.displayName);case EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case ConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that.confirmPassword);case SignUpSubmitted() when signUpSubmitted != null:
return signUpSubmitted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String displayName)  displayNameChanged,required TResult Function( String email)  emailChanged,required TResult Function( String password)  passwordChanged,required TResult Function( String confirmPassword)  confirmPasswordChanged,required TResult Function()  signUpSubmitted,}) {final _that = this;
switch (_that) {
case DisplayNameChanged():
return displayNameChanged(_that.displayName);case EmailChanged():
return emailChanged(_that.email);case PasswordChanged():
return passwordChanged(_that.password);case ConfirmPasswordChanged():
return confirmPasswordChanged(_that.confirmPassword);case SignUpSubmitted():
return signUpSubmitted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String displayName)?  displayNameChanged,TResult? Function( String email)?  emailChanged,TResult? Function( String password)?  passwordChanged,TResult? Function( String confirmPassword)?  confirmPasswordChanged,TResult? Function()?  signUpSubmitted,}) {final _that = this;
switch (_that) {
case DisplayNameChanged() when displayNameChanged != null:
return displayNameChanged(_that.displayName);case EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case ConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that.confirmPassword);case SignUpSubmitted() when signUpSubmitted != null:
return signUpSubmitted();case _:
  return null;

}
}

}

/// @nodoc


class DisplayNameChanged implements SignUpEvent {
  const DisplayNameChanged(this.displayName);
  

 final  String displayName;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisplayNameChangedCopyWith<DisplayNameChanged> get copyWith => _$DisplayNameChangedCopyWithImpl<DisplayNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisplayNameChanged&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,displayName);

@override
String toString() {
  return 'SignUpEvent.displayNameChanged(displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $DisplayNameChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $DisplayNameChangedCopyWith(DisplayNameChanged value, $Res Function(DisplayNameChanged) _then) = _$DisplayNameChangedCopyWithImpl;
@useResult
$Res call({
 String displayName
});




}
/// @nodoc
class _$DisplayNameChangedCopyWithImpl<$Res>
    implements $DisplayNameChangedCopyWith<$Res> {
  _$DisplayNameChangedCopyWithImpl(this._self, this._then);

  final DisplayNameChanged _self;
  final $Res Function(DisplayNameChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? displayName = null,}) {
  return _then(DisplayNameChanged(
null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EmailChanged implements SignUpEvent {
  const EmailChanged(this.email);
  

 final  String email;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailChangedCopyWith<EmailChanged> get copyWith => _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignUpEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class $EmailChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $EmailChangedCopyWith(EmailChanged value, $Res Function(EmailChanged) _then) = _$EmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(this._self, this._then);

  final EmailChanged _self;
  final $Res Function(EmailChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(EmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PasswordChanged implements SignUpEvent {
  const PasswordChanged(this.password);
  

 final  String password;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordChangedCopyWith<PasswordChanged> get copyWith => _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'SignUpEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class $PasswordChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $PasswordChangedCopyWith(PasswordChanged value, $Res Function(PasswordChanged) _then) = _$PasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(this._self, this._then);

  final PasswordChanged _self;
  final $Res Function(PasswordChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(PasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfirmPasswordChanged implements SignUpEvent {
  const ConfirmPasswordChanged(this.confirmPassword);
  

 final  String confirmPassword;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmPasswordChangedCopyWith<ConfirmPasswordChanged> get copyWith => _$ConfirmPasswordChangedCopyWithImpl<ConfirmPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmPasswordChanged&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,confirmPassword);

@override
String toString() {
  return 'SignUpEvent.confirmPasswordChanged(confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class $ConfirmPasswordChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory $ConfirmPasswordChangedCopyWith(ConfirmPasswordChanged value, $Res Function(ConfirmPasswordChanged) _then) = _$ConfirmPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String confirmPassword
});




}
/// @nodoc
class _$ConfirmPasswordChangedCopyWithImpl<$Res>
    implements $ConfirmPasswordChangedCopyWith<$Res> {
  _$ConfirmPasswordChangedCopyWithImpl(this._self, this._then);

  final ConfirmPasswordChanged _self;
  final $Res Function(ConfirmPasswordChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? confirmPassword = null,}) {
  return _then(ConfirmPasswordChanged(
null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpSubmitted implements SignUpEvent {
  const SignUpSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpEvent.signUpSubmitted()';
}


}




/// @nodoc
mixin _$SignUpState {

 String get displayName; String get email; String get password; String get confirmPassword; bool get isSubmitting; bool get isSuccess; String? get errorMessage;// Field-specific validation errors
 String? get displayNameError; String? get emailError; String? get passwordError; String? get confirmPasswordError;// Real-time password requirement flags
 bool get hasMinLength; bool get hasUppercase; bool get hasLowercase; bool get hasNumber; bool get hasSpecialChar; String get passwordStrength;
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateCopyWith<SignUpState> get copyWith => _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.displayNameError, displayNameError) || other.displayNameError == displayNameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.hasMinLength, hasMinLength) || other.hasMinLength == hasMinLength)&&(identical(other.hasUppercase, hasUppercase) || other.hasUppercase == hasUppercase)&&(identical(other.hasLowercase, hasLowercase) || other.hasLowercase == hasLowercase)&&(identical(other.hasNumber, hasNumber) || other.hasNumber == hasNumber)&&(identical(other.hasSpecialChar, hasSpecialChar) || other.hasSpecialChar == hasSpecialChar)&&(identical(other.passwordStrength, passwordStrength) || other.passwordStrength == passwordStrength));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,email,password,confirmPassword,isSubmitting,isSuccess,errorMessage,displayNameError,emailError,passwordError,confirmPasswordError,hasMinLength,hasUppercase,hasLowercase,hasNumber,hasSpecialChar,passwordStrength);

@override
String toString() {
  return 'SignUpState(displayName: $displayName, email: $email, password: $password, confirmPassword: $confirmPassword, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage, displayNameError: $displayNameError, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, hasMinLength: $hasMinLength, hasUppercase: $hasUppercase, hasLowercase: $hasLowercase, hasNumber: $hasNumber, hasSpecialChar: $hasSpecialChar, passwordStrength: $passwordStrength)';
}


}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res>  {
  factory $SignUpStateCopyWith(SignUpState value, $Res Function(SignUpState) _then) = _$SignUpStateCopyWithImpl;
@useResult
$Res call({
 String displayName, String email, String password, String confirmPassword, bool isSubmitting, bool isSuccess, String? errorMessage, String? displayNameError, String? emailError, String? passwordError, String? confirmPasswordError, bool hasMinLength, bool hasUppercase, bool hasLowercase, bool hasNumber, bool hasSpecialChar, String passwordStrength
});




}
/// @nodoc
class _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? displayNameError = freezed,Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? hasMinLength = null,Object? hasUppercase = null,Object? hasLowercase = null,Object? hasNumber = null,Object? hasSpecialChar = null,Object? passwordStrength = null,}) {
  return _then(_self.copyWith(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,displayNameError: freezed == displayNameError ? _self.displayNameError : displayNameError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,hasMinLength: null == hasMinLength ? _self.hasMinLength : hasMinLength // ignore: cast_nullable_to_non_nullable
as bool,hasUppercase: null == hasUppercase ? _self.hasUppercase : hasUppercase // ignore: cast_nullable_to_non_nullable
as bool,hasLowercase: null == hasLowercase ? _self.hasLowercase : hasLowercase // ignore: cast_nullable_to_non_nullable
as bool,hasNumber: null == hasNumber ? _self.hasNumber : hasNumber // ignore: cast_nullable_to_non_nullable
as bool,hasSpecialChar: null == hasSpecialChar ? _self.hasSpecialChar : hasSpecialChar // ignore: cast_nullable_to_non_nullable
as bool,passwordStrength: null == passwordStrength ? _self.passwordStrength : passwordStrength // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpState].
extension SignUpStatePatterns on SignUpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpState value)  $default,){
final _that = this;
switch (_that) {
case _SignUpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpState value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String displayName,  String email,  String password,  String confirmPassword,  bool isSubmitting,  bool isSuccess,  String? errorMessage,  String? displayNameError,  String? emailError,  String? passwordError,  String? confirmPasswordError,  bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialChar,  String passwordStrength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
return $default(_that.displayName,_that.email,_that.password,_that.confirmPassword,_that.isSubmitting,_that.isSuccess,_that.errorMessage,_that.displayNameError,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialChar,_that.passwordStrength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String displayName,  String email,  String password,  String confirmPassword,  bool isSubmitting,  bool isSuccess,  String? errorMessage,  String? displayNameError,  String? emailError,  String? passwordError,  String? confirmPasswordError,  bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialChar,  String passwordStrength)  $default,) {final _that = this;
switch (_that) {
case _SignUpState():
return $default(_that.displayName,_that.email,_that.password,_that.confirmPassword,_that.isSubmitting,_that.isSuccess,_that.errorMessage,_that.displayNameError,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialChar,_that.passwordStrength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String displayName,  String email,  String password,  String confirmPassword,  bool isSubmitting,  bool isSuccess,  String? errorMessage,  String? displayNameError,  String? emailError,  String? passwordError,  String? confirmPasswordError,  bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialChar,  String passwordStrength)?  $default,) {final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
return $default(_that.displayName,_that.email,_that.password,_that.confirmPassword,_that.isSubmitting,_that.isSuccess,_that.errorMessage,_that.displayNameError,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialChar,_that.passwordStrength);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpState implements SignUpState {
  const _SignUpState({this.displayName = '', this.email = '', this.password = '', this.confirmPassword = '', this.isSubmitting = false, this.isSuccess = false, this.errorMessage, this.displayNameError, this.emailError, this.passwordError, this.confirmPasswordError, this.hasMinLength = false, this.hasUppercase = false, this.hasLowercase = false, this.hasNumber = false, this.hasSpecialChar = false, this.passwordStrength = 'Weak'});
  

@override@JsonKey() final  String displayName;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  String confirmPassword;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;
// Field-specific validation errors
@override final  String? displayNameError;
@override final  String? emailError;
@override final  String? passwordError;
@override final  String? confirmPasswordError;
// Real-time password requirement flags
@override@JsonKey() final  bool hasMinLength;
@override@JsonKey() final  bool hasUppercase;
@override@JsonKey() final  bool hasLowercase;
@override@JsonKey() final  bool hasNumber;
@override@JsonKey() final  bool hasSpecialChar;
@override@JsonKey() final  String passwordStrength;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpStateCopyWith<_SignUpState> get copyWith => __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpState&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.displayNameError, displayNameError) || other.displayNameError == displayNameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.hasMinLength, hasMinLength) || other.hasMinLength == hasMinLength)&&(identical(other.hasUppercase, hasUppercase) || other.hasUppercase == hasUppercase)&&(identical(other.hasLowercase, hasLowercase) || other.hasLowercase == hasLowercase)&&(identical(other.hasNumber, hasNumber) || other.hasNumber == hasNumber)&&(identical(other.hasSpecialChar, hasSpecialChar) || other.hasSpecialChar == hasSpecialChar)&&(identical(other.passwordStrength, passwordStrength) || other.passwordStrength == passwordStrength));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,email,password,confirmPassword,isSubmitting,isSuccess,errorMessage,displayNameError,emailError,passwordError,confirmPasswordError,hasMinLength,hasUppercase,hasLowercase,hasNumber,hasSpecialChar,passwordStrength);

@override
String toString() {
  return 'SignUpState(displayName: $displayName, email: $email, password: $password, confirmPassword: $confirmPassword, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage, displayNameError: $displayNameError, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, hasMinLength: $hasMinLength, hasUppercase: $hasUppercase, hasLowercase: $hasLowercase, hasNumber: $hasNumber, hasSpecialChar: $hasSpecialChar, passwordStrength: $passwordStrength)';
}


}

/// @nodoc
abstract mixin class _$SignUpStateCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(_SignUpState value, $Res Function(_SignUpState) _then) = __$SignUpStateCopyWithImpl;
@override @useResult
$Res call({
 String displayName, String email, String password, String confirmPassword, bool isSubmitting, bool isSuccess, String? errorMessage, String? displayNameError, String? emailError, String? passwordError, String? confirmPasswordError, bool hasMinLength, bool hasUppercase, bool hasLowercase, bool hasNumber, bool hasSpecialChar, String passwordStrength
});




}
/// @nodoc
class __$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(this._self, this._then);

  final _SignUpState _self;
  final $Res Function(_SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? displayNameError = freezed,Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? hasMinLength = null,Object? hasUppercase = null,Object? hasLowercase = null,Object? hasNumber = null,Object? hasSpecialChar = null,Object? passwordStrength = null,}) {
  return _then(_SignUpState(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,displayNameError: freezed == displayNameError ? _self.displayNameError : displayNameError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,hasMinLength: null == hasMinLength ? _self.hasMinLength : hasMinLength // ignore: cast_nullable_to_non_nullable
as bool,hasUppercase: null == hasUppercase ? _self.hasUppercase : hasUppercase // ignore: cast_nullable_to_non_nullable
as bool,hasLowercase: null == hasLowercase ? _self.hasLowercase : hasLowercase // ignore: cast_nullable_to_non_nullable
as bool,hasNumber: null == hasNumber ? _self.hasNumber : hasNumber // ignore: cast_nullable_to_non_nullable
as bool,hasSpecialChar: null == hasSpecialChar ? _self.hasSpecialChar : hasSpecialChar // ignore: cast_nullable_to_non_nullable
as bool,passwordStrength: null == passwordStrength ? _self.passwordStrength : passwordStrength // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
