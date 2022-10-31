import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../shared/utils/extension.dart';
import '../../external/infrastructure/base_api.dart';
import '../../data/datasources/featch_events_datasource.dart';
import '../../domain/errors/errors.dart';
import '../infrastructure/http_adapter.dart';

class FeatchEventsDatasource implements IFeatchEventDatasource {
  final HttpAdapter httpAdapter;
  final BuildContext context;

  FeatchEventsDatasource(this.httpAdapter, this.context);

  @override
  Future<List<dynamic>> featchEvents({bool eventWon = false}) async {
    try {
      if (context.token() == '') throw const FalireException('token is empty or null');

      final headers = BaseApi.headers(context.token());

      final response = await httpAdapter.request(
        method: HttpMethod.get,
        path: '/tickets/report',
        params: {'event_won': eventWon},
        headers: headers,
      );

      return response.data;
    } on DioError catch (e, s) {
      throw FalireException(e.response!.data['error'].toString(), s);
    }
  }
}
