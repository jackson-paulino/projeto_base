import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../shared/utils/extension.dart';
import '../../data/datasources/featch_pdv_dates_datasource.dart';
import '../../domain/errors/errors.dart';
import '../infrastructure/base_api.dart';
import '../infrastructure/http_adapter.dart';

class FeatchPdvDatesDatasource implements IFeatchPdvDatesDatasource {
  final HttpAdapter httpAdapter;
  final BuildContext context;

  FeatchPdvDatesDatasource(this.httpAdapter, this.context);

  @override
  Future<Map<String, dynamic>> featchPdvDates(String eventId, String pdvId) async {
    try {
      if (context.token() == '') throw const FalireException('token is empty or null');

      final headers = BaseApi.headers(context.token());

      final response = await httpAdapter.request(
        method: HttpMethod.get,
        path: '/reports/events/$eventId/sales/dates/formpayments',
        params: {'pdv_id': pdvId},
        headers: headers,
      );

      return response.data;
    } on DioError catch (e, s) {
      throw FalireException(e.response!.data['error'].toString(), s);
    }
  }
}
