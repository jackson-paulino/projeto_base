import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/sales_pdv.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/event_repository.dart';
import 'package:projeto_base/src/domain/usecases/featch_sales_pdv_usecase.dart';
import 'package:mocktail/mocktail.dart';

class EventRepositoryMock extends Mock implements IEventRepository {}

void main() {
  final repository = EventRepositoryMock();
  final usecase = FeatchSalesPdvUsecase(repository);
  String eventId = '14';
  testWidgets('deve retornar os dados de vendas por pdv', (tester) async {
    when(() => repository.featchSalesPdv(eventId))
        .thenAnswer((invocation) async => right(SalesPdv()));

    final response = await usecase(eventId);

    expect(response.fold(id, id), isA<SalesPdv>());
  });

  testWidgets('deve retornar o FalireException para erro da consulta', (tester) async {
    const error = FalireException('Error');
    when(() => repository.featchSalesPdv(eventId)).thenAnswer((invocation) async => left(error));

    final response = await usecase(eventId);

    expect(response.fold(id, id), isA<FalireException>());
  });
}
