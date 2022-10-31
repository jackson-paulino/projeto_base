import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../errors/errors.dart';
import '../repositories/storage_repository.dart';

abstract class IFeatchUserStorageUsecase {
  Future<Either<IErrorsException, User?>> call();
}

class FeatchUserStorageUsecase implements IFeatchUserStorageUsecase {
  final IStorageRepository _repository;

  FeatchUserStorageUsecase(this._repository);

  @override
  Future<Either<IErrorsException, User?>> call() async {
    final result = await _repository.featchUserStorage();
    return result;
  }
}
