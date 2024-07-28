import 'package:fpdart/fpdart.dart';
import 'package:spirittrips/src/feature/main/datasource/main_remote_ds.dart';
import 'package:spirittrips/src/feature/main/model/route_dto.dart';

abstract class IMainRepository {
  Future<Either<String, RouteDTO>> getRouteInfo({
    required double lat,
    required double long,
  });
}

class MainRepositoryImpl implements IMainRepository {
  final IMainRemoteDS _remoteDS;

  MainRepositoryImpl({
    required IMainRemoteDS remoteDS,
  }) : _remoteDS = remoteDS;

  @override
  Future<Either<String, RouteDTO>> getRouteInfo({required double lat, required double long}) =>
      _remoteDS.getRouteInfo(lat: lat, long: long);
}
