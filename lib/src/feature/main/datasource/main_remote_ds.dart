import 'package:dio/dio.dart';
import 'package:spirittrips/src/core/network/network_helper.dart';

abstract class IMainRemoteDS {}

class MainRemoteDSImpl with NetworkHelper implements IMainRemoteDS {
  final Dio dio;

  MainRemoteDSImpl(this.dio);
}
