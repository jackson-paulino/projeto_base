import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/withdraw_pdv.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/event_repository.dart';
import 'package:projeto_base/src/domain/usecases/featch_withdraw_pdv_usecase.dart';
import 'package:mocktail/mocktail.dart';

class EventRepositoryMock extends Mock implements IEventRepository {}

void main() {
  final repository = EventRepositoryMock();
  final usecase = FeatchWithdrawPdvUsecase(repository);
  String eventId = '14';

  test('deve retornar os dados de retiradas por pdvs', () async {
    when(() => repository.featchWithdrawPdv(eventId)).thenAnswer((_) async => right(WithdrawPdv()));

    final response = await usecase(eventId);

    expect(response.fold(id, id), isA<WithdrawPdv>());
  });

  test('deve retornar um FalireException para consulta incorreta', () async {
    const error = FalireException('Error');
    when(() => repository.featchWithdrawPdv(eventId)).thenAnswer((_) async => left(error));

    final response = await usecase(eventId);

    expect(response.fold(id, id), isA<FalireException>());

    final result = (response.fold(id, id) as FalireException);

    expect(result.message, 'Error');
  });
}
