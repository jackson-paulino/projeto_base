import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../shared/utils/extension.dart';
import '../../data/datasources/featch_pdvs_datasource.dart';
import '../../domain/errors/errors.dart';
import '../infrastructure/base_api.dart';
import '../infrastructure/http_adapter.dart';

class FeatchPdvsDatasource implements IFeatchPdvsDatasource {
  final HttpAdapter httpAdapter;
  final BuildContext context;

  FeatchPdvsDatasource(this.httpAdapter, this.context);

  @override
  Future<List> featchPdvs(String eventId) async {
    try {
      if (context.token() == '') throw const FalireException('token is empty or null');

      final headers = BaseApi.headers(context.token());

      final response = await httpAdapter.request(
        method: HttpMethod.get,
        path: '/pdvs',
        headers: headers,
        params: {'event_id': eventId},
      );

      return response.data;
    } on DioError catch (e, s) {
      throw FalireException(e.response!.data['error'].toString(), s);
    }
  }
}
