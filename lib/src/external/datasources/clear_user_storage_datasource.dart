import '../../data/datasources/clear_user_storage_datasource.dart';
import '../../domain/errors/errors.dart';
import '../secure_storage/secure_storage.dart';

class ClearUserStorageDatasource implements IClearUserStorageDatasource {
  final SecureStorage secureStorage;

  ClearUserStorageDatasource(this.secureStorage);

  @override
  Future<bool> clearUserStorage() async {
    try {
      final response = await secureStorage.clearUserStorage();
      return response;
    } catch (e, s) {
      throw FalireException(e.toString(), s);
    }
  }
}
