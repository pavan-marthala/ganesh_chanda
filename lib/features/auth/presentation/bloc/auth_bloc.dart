import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:ganesh_chanda/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<AppUser?>? _authStateSubscription;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        started: (e) async {
          await _authStateSubscription?.cancel();

          final appUser = await _authRepository.currentAppUser;
          if (appUser != null) {
            emit(AuthState.authenticated(user: appUser));
          } else {
            emit(const AuthState.unauthenticated());
          }

          _authStateSubscription = _authRepository.appUserChanges.listen((
            user,
          ) {
            add(AuthEvent.authStateChanged(user: user));
          });
        },
        authStateChanged: (e) async {
          if (e.user != null) {
            emit(AuthState.authenticated(user: e.user!));
          } else {
            emit(const AuthState.unauthenticated());
          }
        },
        signOutRequested: (e) async {
          await _authRepository.signOut();
        },
      );
    });
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
