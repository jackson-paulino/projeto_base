import '../../shared/data_struct/auth_data_struct.dart';

abstract class IAuthDatasource {
  Future<Map<String, dynamic>?> authUser(AuthDataStruct authUser);
}
