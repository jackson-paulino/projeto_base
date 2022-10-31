import '../../data/datasources/save_user_storage_datasource.dart';
import '../../domain/entities/user.dart';
import '../../domain/errors/errors.dart';
import '../secure_storage/secure_storage.dart';

class SaveUserStorageDatasource implements ISaveUserStorageDatasource {
  final SecureStorage secureStorage;

  SaveUserStorageDatasource(this.secureStorage);

  @override
  Future<bool> saveUserStorage(User user) async {
    try {
      final response = await secureStorage.saveUserStorage(user);
      return response;
    } catch (e, s) {
      throw FalireException(e.toString(), s);
    }
  }
}
