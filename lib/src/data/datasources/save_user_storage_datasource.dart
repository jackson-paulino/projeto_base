import '../../domain/entities/user.dart';

abstract class ISaveUserStorageDatasource {
  Future<bool> saveUserStorage(User authUser);
}
