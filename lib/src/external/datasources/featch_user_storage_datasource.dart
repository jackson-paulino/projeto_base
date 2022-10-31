import '../../data/datasources/featch_user_storage_datasource.dart';
import '../../domain/entities/user.dart';
import '../../domain/errors/errors.dart';
import '../secure_storage/secure_storage.dart';

class FeatchUserStorageDatasource implements IFeatchUserStorageDatasource {
  final SecureStorage secureStorage;

  FeatchUserStorageDatasource(this.secureStorage);

  @override
  Future<User?> featchUserStorage() async {
    try {
      final response = await secureStorage.featchUserStorage();
      return response;
    } on IErrorsException catch (e, s) {
      throw FalireException(e.toString(), s);
    }
  }
}
