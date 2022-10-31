import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../shared/utils/extension.dart';
import '../../data/datasources/featch_sales_pdv_datasource.dart';
import '../../domain/errors/errors.dart';
import '../infrastructure/base_api.dart';
import '../infrastructure/http_adapter.dart';

class FeatchSalesPdvDatasource implements IFeatchSalesPdvDatasource {
  final HttpAdapter httpAdapter;
  final BuildContext context;

  FeatchSalesPdvDatasource(this.httpAdapter, this.context);

  @override
  Future<Map<String, dynamic>> featchSalesPdv(String eventId) async {
    try {
      if (context.token() == '') throw const FalireException('token is empty or null');

      final headers = BaseApi.headers(context.token());

      final response = await httpAdapter.request(
        method: HttpMethod.get,
        path: '/reports/events/$eventId/sales/pdvs',
        headers: headers,
      );

      return response.data;
    } on DioError catch (e, s) {
      throw FalireException(e.response!.data['error'].toString(), s);
    }
  }
}
