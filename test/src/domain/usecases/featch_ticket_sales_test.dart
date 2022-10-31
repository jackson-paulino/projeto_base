import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/balance_tickets.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/event_repository.dart';
import 'package:projeto_base/src/domain/usecases/featch_ticket_sales_usecase.dart';
import 'package:mocktail/mocktail.dart';

class EventRepositoryMock extends Mock implements IEventRepository {}

void main() {
  final repository = EventRepositoryMock();
  final usecase = FeatchTicketSalesUsecase(repository);
  String eventId = '14';

  test('deve retornar os dados da venda de ingressos', () async {
    when(() => repository.featchTicketSales(eventId))
        .thenAnswer((_) async => right(BalanceTickets()));

    final result = await usecase(eventId);

    expect(result.fold(id, id), isA<BalanceTickets>());
  });

  test('deve retornar um FalireException para algum erro na consulta', () async {
    const error = FalireException('Error');

    when(() => repository.featchTicketSales(eventId)).thenAnswer((_) async => left(error));

    final result = await usecase(eventId);

    expect(result.fold(id, id), isA<FalireException>());
  });
}
