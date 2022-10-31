import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../errors/errors.dart';
import '../repositories/storage_repository.dart';

abstract class ISaveUserStorageUsecase {
  Future<Either<IErrorsException, bool>> call(User user);
}

class SaveUserStorageUsecase implements ISaveUserStorageUsecase {
  final IStorageRepository _repository;

  SaveUserStorageUsecase(this._repository);

  @override
  Future<Either<IErrorsException, bool>> call(User user) async {
    if (user.name.isEmpty || user.name == '') {
      return left(const FalireException('login is empty or null'));
    }
    if (user.token.isEmpty || user.token == '') {
      return left(const FalireException('password is empty or null'));
    }
    final result = await _repository.saveUserStorage(user);
    return result;
  }
}
