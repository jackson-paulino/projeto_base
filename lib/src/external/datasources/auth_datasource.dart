import 'package:dio/dio.dart';

import '../../data/datasources/auth_datasource.dart';
import '../../domain/errors/errors.dart';
import '../../shared/data_struct/auth_data_struct.dart';
import '../infrastructure/http_adapter.dart';

class AuthDatasource implements IAuthDatasource {
  final HttpAdapter httpAdapter;

  AuthDatasource(this.httpAdapter);

  @override
  Future<Map<String, dynamic>?> authUser(AuthDataStruct authUser) async {
    try {
      final response = await httpAdapter.request(
        method: HttpMethod.post,
        path: '/producer/authenticate',
        data: authUser.toJson(),
      );

      if (response.statusCode == 201) {
        return response.data;
      }

      return null;
    } on DioError catch (e, s) {
      throw FalireException(e.response!.data['error'].toString(), s);
    }
  }
}
