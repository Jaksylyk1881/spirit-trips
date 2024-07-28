import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spirittrips/src/feature/main/model/route_dto.dart';
import 'package:spirittrips/src/feature/main/repository/main_repository.dart';

part 'route_cubit.freezed.dart';

class RouteCubit extends Cubit<RouteState> {
  late final IMainRepository _repository;
  RouteCubit({required IMainRepository repository})
      : _repository = repository,
        super(const RouteState.initialState());

  Future<void> getRoute({
    required double lat,
    required double long,
  }) async {
    emit(const RouteState.loadingState());
    final result = await _repository.getRouteInfo(lat: lat, long: long);
    result.fold(
      (error) {
        emit(RouteState.errorState(message: error));
      },
      (route) {
        emit(RouteState.loadedState(route: route));
      },
    );
  }
}

@freezed
class RouteState with _$RouteState {
  const factory RouteState.initialState() = _InitialPage;

  const factory RouteState.loadingState() = _LoadingState;

  const factory RouteState.loadedState({
    required RouteDTO route,
  }) = _LoadedState;

  const factory RouteState.errorState({
    required String message,
  }) = _ErrorState;
}
