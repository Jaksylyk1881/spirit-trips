import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spirittrips/src/core/enum/environment.dart';
import 'package:spirittrips/src/core/network/network_helper.dart';
import 'package:spirittrips/src/core/utils/error_util.dart';
import 'package:spirittrips/src/feature/main/model/route_dto.dart';

abstract class IMainRemoteDS {
  Future<Either<String, RouteDTO>> getRouteInfo({
    required double lat,
    required double long,
  });
}

class MainRemoteDSImpl with NetworkHelper implements IMainRemoteDS {
  final Dio dio;

  MainRemoteDSImpl(this.dio);

  @override
  Future<Either<String, RouteDTO>> getRouteInfo({
    required double lat,
    required double long,
  }) async {
    try {
      // final String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';

      final dioResponse = await dio.post(
        'https://routes.googleapis.com/directions/v2:computeRoutes',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Goog-Api-Key': 'AIzaSyBLk3v6m_J1jRmjs0amuDag3BZGieQx9wc',
            'X-Goog-FieldMask': 'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
          },
        ),
        data: {
          "origin": {
            "location": {
              "latLng": {
                "latitude": lat,
                "longitude": long,
              },
            },
          },
          "destination": {
            "location": {
              "latLng": {
                "latitude": 21.4259317,
                "longitude": 39.8271968,
              },
            },
          },
          "travelMode": "WALK",
//   "routingPreference": "TRAFFIC_AWARE",
          "computeAlternativeRoutes": false,
          "routeModifiers": {
            "avoidTolls": false,
            "avoidHighways": false,
            "avoidFerries": false,
          },
          "languageCode": "en-US",
          "units": "IMPERIAL",
        },
        // BackendEndpointCollection.LOGIN,
        // // data: {
        // //   'username': username,
        // //   'password': password,
        // // },
        // // queryParameters: {
        // //   'username': username,
        // //   'password': password,
        // // },
      );

      final user = RouteDTO.fromJson(
        ((dioResponse.data as Map<String, dynamic>)['routes'] as List).firstOrNull as Map<String, dynamic>,
      );

      return Right(user);
    } on DioException catch (e, stackTrace) {
      // DI<Talker>().log(e.response);
      // DI<Talker>().log(e.response?.headers);
      // DI<Talker>().log(e.response?.redirects);
      final parseError = pasreDioException(e);

      ErrorUtil.logError(
        e,
        stackTrace: stackTrace,
        hint: '${BackendEndpointCollection.LOGIN} => $parseError',
      );

      return Left(parseError);
    } on Object catch (e, stackTrace) {
      ErrorUtil.logError(
        e,
        stackTrace: stackTrace,
        hint: 'Object error => $e',
      );

      return Left('Object Error: $e');
    }
  }
}
