import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/pdv.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/usecases/featch_pdvs_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_base/src/domain/repositories/event_repository.dart';

class EventRepositoryMock extends Mock implements IEventRepository {}

void main() {
  final repository = EventRepositoryMock();
  final usecase = FeatchPdvsUsecase(repository);
  String eventId = '14';

  test('deve retornar um lista de Pdvs', () async {
    when(() => repository.featchPdvs(eventId)).thenAnswer((invocation) async => right(<Pdv>[]));

    final response = await usecase(eventId);

    expect(response.fold(id, id), isA<List<Pdv>>());
  });

  test('deve retornar FalireException para error da consulta', () async {
    const error = FalireException('Error');
    when(() => repository.featchPdvs(eventId)).thenAnswer((invocation) async => left(error));

    final response = await usecase(eventId);

    expect(response.fold(id, id), isA<FalireException>());
  });
}
