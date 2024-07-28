// ignore: unused_import
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spirittrips/src/feature/auth/model/user_dto.dart';
import 'package:spirittrips/src/feature/auth/repository/auth_repository.dart';

part 'app_bloc.freezed.dart';

// ignore: unused_element
const _tag = 'AppBloc';

class AppBloc extends Bloc<AppEvent, AppState> {
  final IAuthRepository _authRepository;

  AppBloc({
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AppState.loadingState()) {
    on<AppEvent>(
      (AppEvent event, Emitter<AppState> emit) async => event.map(
        checkAuth: (_CheckAuth event) async => _checkAuth(event, emit),
        refreshLocal: (_RefreshLocal event) async => _refreshLocal(event, emit),
        chageState: (_ChangeState event) async => _changeState(event, emit),
        logout: (_Logout event) => _logout(event, emit),
      ),
    );
  }

  Future<void> _checkAuth(
    _CheckAuth event,
    Emitter<AppState> emit,
  ) async {
    final UserDTO? user = _authRepository.getUserFromCache();

    // if (user != null && user.basicAuth != null) {
    emit(const AppState.notAuthorizedState());
    // } else {
    //   emit(const AppState.notAuthorizedState());
    // }
  }

  Future<void> _refreshLocal(
    _RefreshLocal event,
    Emitter<AppState> emit,
  ) async {
    await state.maybeWhen(
      inAppState: (user) async {
        emit(const AppState.loadingState());
        await Future.delayed(const Duration(milliseconds: 100));
        emit(AppState.inAppState(user: user));
      },
      orElse: () async {
        emit(const AppState.loadingState());
        await Future.delayed(const Duration(milliseconds: 100));
        emit(const AppState.notAuthorizedState());
      },
    );
  }

  Future<void> _changeState(
    _ChangeState event,
    Emitter<AppState> emit,
  ) async =>
      emit(event.state);

  Future<void> _logout(
    _Logout event,
    Emitter<AppState> emit,
  ) async {
    await _authRepository.clearUserFromCache();
    emit(const AppState.notAuthorizedState());
  }

  // @override
  // void onTransition(Transition<AppEvent, AppState> transition) {
  //   log(transition.toString(), name: _tag);
  //   super.onTransition(transition);
  // }

  // @override
  // void onChange(Change<AppState> change) {
  //   print(change);
  //   super.onChange(change);
  // }
}

///
///
/// Event class
///
///
@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.checkAuth({
    required String version,
  }) = _CheckAuth;

  const factory AppEvent.refreshLocal() = _RefreshLocal;

  const factory AppEvent.chageState({
    required AppState state,
  }) = _ChangeState;

  const factory AppEvent.logout() = _Logout;
}

///
///
/// State class
///
///
@freezed
class AppState with _$AppState {
  const factory AppState.loadingState() = _LoadingState;

  const factory AppState.notAuthorizedState() = _NotAuthorizedState;

  const factory AppState.inAppState({
    required UserDTO? user,
  }) = _InAppState;

  const factory AppState.errorState({
    required String message,
  }) = _ErrorState;
}
