import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/sales_dates.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/event_repository.dart';
import 'package:projeto_base/src/domain/usecases/featch_sales_dates_usecase.dart';
import 'package:mocktail/mocktail.dart';

class EventRepositoryMock extends Mock implements IEventRepository {}

void main() {
  final repository = EventRepositoryMock();
  final usecase = FeatchSalesDatesUsecase(repository);
  String eventId = '14';

  test('deve retornar os dados de SalesDates', () async {
    when(() => repository.featchSalesDates(eventId))
        .thenAnswer((invocation) async => right(SalesDates()));

    final response = await usecase(eventId);

    expect(response.fold(id, id), isA<SalesDates>());
  });

  testWidgets('deve retornar o FalireException para erro da consulta', (tester) async {
    const error = FalireException('Error');
    when(() => repository.featchSalesDates(eventId)).thenAnswer((invocation) async => left(error));

    final response = await usecase(eventId);

    expect(response.fold(id, id), isA<FalireException>());
  });
}
