import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../shared/data_struct/auth_data_struct.dart';
import '../adapters/user_adapter.dart';
import '../datasources/auth_datasource.dart';

class AuthRepository extends IAuthRepository {
  final IAuthDatasource _authDatasource;

  AuthRepository(this._authDatasource);
  @override
  Future<Either<IErrorsException, User>> authUser(AuthDataStruct authUser) async {
    try {
      final user = await _authDatasource.authUser(authUser);

      return right(UserAdapter.fromJson(user));
    } on IErrorsException catch (e) {
      return left(e);
    }
  }
}
