import 'package:fpdart/fpdart.dart';
import 'package:spirittrips/src/feature/auth/datasource/auth_local_ds.dart';
import 'package:spirittrips/src/feature/auth/datasource/auth_remote_ds.dart';
import 'package:spirittrips/src/feature/auth/model/user_dto.dart';

abstract class IAuthRepository {
  ///
  /// Local
  ///
  UserDTO? getUserFromCache();

  Future<void> clearUserFromCache();

  ///
  /// Remote
  ///
  Future<Either<String, UserDTO>> login({
    required String username,
    required String password,
  });
}

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthLocalDS _localDS;
  final IAuthRemoteDS _remoteDS;

  AuthRepositoryImpl({
    required IAuthLocalDS localDS,
    required IAuthRemoteDS remoteDS,
  })  : _localDS = localDS,
        _remoteDS = remoteDS;

  @override
  Future<Either<String, UserDTO>> login({
    required String username,
    required String password,
  }) async {
    final res = await _remoteDS.login(
      username: username.toLowerCase(),
      password: password,
    );

    return res.fold(
      (l) => Left(l),
      (r) async {
        await _localDS.saveUserToCache(user: r);

        return Right(r);
      },
    );
  }

  @override
  UserDTO? getUserFromCache() => _localDS.getUserFromCache();

  @override
  Future<void> clearUserFromCache() async => _localDS.removeUserFromCache();
}
