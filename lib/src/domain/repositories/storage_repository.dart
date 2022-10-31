import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../errors/errors.dart';

abstract class IStorageRepository {
  Future<Either<IErrorsException, bool>> saveUserStorage(User user);
  Future<Either<IErrorsException, User?>> featchUserStorage();
  Future<Either<IErrorsException, bool>> clearUserStorage();
}
