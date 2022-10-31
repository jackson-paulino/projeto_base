import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../repositories/storage_repository.dart';

abstract class IClearUserStorageUsecase {
  Future<Either<IErrorsException, bool>> call();
}

class ClearUserStorageUsecase implements IClearUserStorageUsecase {
  final IStorageRepository _repository;

  ClearUserStorageUsecase(this._repository);

  @override
  Future<Either<IErrorsException, bool>> call() async {
    final result = await _repository.clearUserStorage();
    return result;
  }
}
