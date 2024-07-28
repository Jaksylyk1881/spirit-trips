// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_dto.freezed.dart';
part 'route_dto.g.dart';

@freezed
class RouteDTO with _$RouteDTO {
  const factory RouteDTO({
    int? distanceMeters,
    String? duration,
  }) = _RouteDTO;

  factory RouteDTO.fromJson(Map<String, dynamic> json) => _$RouteDTOFromJson(json);
}
