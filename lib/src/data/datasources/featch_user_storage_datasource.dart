import '../../domain/entities/user.dart';

abstract class IFeatchUserStorageDatasource {
  Future<User?> featchUserStorage();
}
