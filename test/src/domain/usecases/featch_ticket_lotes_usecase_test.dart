import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/ticket_lotes.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/event_repository.dart';
import 'package:projeto_base/src/domain/usecases/featch_ticket_lotes_usecase.dart';
import 'package:mocktail/mocktail.dart';

class EventRepositoryMock extends Mock implements IEventRepository {}

void main() {
  final repository = EventRepositoryMock();
  final usecase = FeatchTicketLotesUsecase(repository);
  String eventId = '14';

  test('deve retornar um lista de TicketLotes', () async {
    when(() => repository.featchTicketLotes(eventId))
        .thenAnswer((invocation) async => right(<TicketLotes>[]));

    final response = await usecase(eventId);

    expect(response.fold(id, id), isA<List<TicketLotes>>());
  });

  test('deve retornar um FalireException para algum erro na consulta', () async {
    const error = FalireException('Error');

    when(() => repository.featchTicketLotes(eventId)).thenAnswer((invocation) async => left(error));

    final result = await usecase(eventId);

    expect(result.fold(id, id), isA<FalireException>());
  });
}
