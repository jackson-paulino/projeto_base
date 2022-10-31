import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/storage_repository.dart';
import '../datasources/clear_user_storage_datasource.dart';
import '../datasources/featch_user_storage_datasource.dart';
import '../datasources/save_user_storage_datasource.dart';

class StorageRepository extends IStorageRepository {
  final ISaveUserStorageDatasource _saveUserStorage;
  final IFeatchUserStorageDatasource _featchUserStorage;
  final IClearUserStorageDatasource _clearUserStorage;

  StorageRepository(this._saveUserStorage, this._featchUserStorage, this._clearUserStorage);

  @override
  Future<Either<IErrorsException, bool>> saveUserStorage(User user) async {
    try {
      final result = await _saveUserStorage.saveUserStorage(user);

      return right(result);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IErrorsException, User?>> featchUserStorage() async {
    try {
      final result = await _featchUserStorage.featchUserStorage();

      return right(result);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IErrorsException, bool>> clearUserStorage() async {
    try {
      final result = await _clearUserStorage.clearUserStorage();

      return right(result);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }
}
