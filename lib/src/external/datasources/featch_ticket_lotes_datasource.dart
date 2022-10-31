import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../shared/utils/extension.dart';
import '../../data/datasources/featch_ticket_lotes_datasource.dart';
import '../../domain/errors/errors.dart';
import '../infrastructure/base_api.dart';
import '../infrastructure/http_adapter.dart';

class FeatchTicketLotesDatasource implements IFeatchTicketLotesDatasource {
  final HttpAdapter httpAdapter;
  final BuildContext context;

  FeatchTicketLotesDatasource(this.httpAdapter, this.context);

  @override
  Future<List> featchTicketLotes(String eventId) async {
    try {
      if (context.token() == '') throw const FalireException('token is empty or null');

      final headers = BaseApi.headers(context.token());

      final response = await httpAdapter.request(
        method: HttpMethod.get,
        path: '/reports/events/$eventId/lotes/sale',
        headers: headers,
      );

      return response.data;
    } on DioError catch (e, s) {
      throw FalireException(e.response!.data['error'].toString(), s);
    }
  }
}
