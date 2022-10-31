import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/event.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/event_repository.dart';
import 'package:projeto_base/src/domain/usecases/featch_events_usecase.dart';
import 'package:mocktail/mocktail.dart';

class EventRepositoryMock extends Mock implements IEventRepository {}

void main() {
  final repository = EventRepositoryMock();
  final usecase = FeatchEventsUsecase(repository);

  test('deve retornar um lista de eventos', () async {
    when(() => repository.featchEvents()).thenAnswer((_) async => right([]));

    final result = await usecase();

    expect(result.fold(id, id), isA<List<Event>>());
  });

  test('deve retornar um FalireException se o token for vazio', () async {
    const error = FalireException('Error');

    when(() => repository.featchEvents()).thenAnswer((_) async => left(error));

    final result = await usecase();

    expect(result.fold(id, id), isA<IErrorsException>());
  });
}
