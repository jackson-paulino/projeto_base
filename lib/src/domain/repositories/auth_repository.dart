import 'package:dartz/dartz.dart';

import '../../shared/data_struct/auth_data_struct.dart';
import '../entities/user.dart';
import '../errors/errors.dart';

abstract class IAuthRepository {
  Future<Either<IErrorsException, User>> authUser(AuthDataStruct authUser);
}
