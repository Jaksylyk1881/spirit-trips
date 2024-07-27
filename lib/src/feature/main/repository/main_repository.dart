import 'package:spirittrips/src/feature/main/datasource/main_remote_ds.dart';

abstract class IMainRepository {}

class MainRepositoryImpl implements IMainRepository {
  final IMainRemoteDS _remoteDS;

  MainRepositoryImpl({
    required IMainRemoteDS remoteDS,
  }) : _remoteDS = remoteDS;
}
