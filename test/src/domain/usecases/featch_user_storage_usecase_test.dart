import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/user.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/storage_repository.dart';
import 'package:projeto_base/src/domain/usecases/featch_user_storage_usecase.dart';
import 'package:mocktail/mocktail.dart';

class StorageRepositoryMock extends Mock implements IStorageRepository {}

void main() {
  final repository = StorageRepositoryMock();
  final usecase = FeatchUserStorageUsecase(repository);

  test('deve retornar um user salvo no Storage', () async {
    final User user = User(token: 'token', name: 'name', role: 'role');
    when(() => repository.featchUserStorage()).thenAnswer((invocation) async => right(user));

    final result = await usecase();

    expect(result.fold(id, id), isA<User>());
  });

  test('deve retornar null para dados não encontrados', () async {
    when(() => repository.featchUserStorage()).thenAnswer((invocation) async => right(null));

    final result = await usecase();

    expect(result.fold(id, id), null);
  });

  test('deve retornar um FalireException para erro na leitura do Storage', () async {
    const error = FalireException('Error');
    when(() => repository.featchUserStorage()).thenAnswer((invocation) async => left(error));

    final result = await usecase();

    expect(result.fold(id, id), isA<FalireException>());

    final consulte = (result.fold(id, id) as FalireException);

    expect(consulte.message, 'Error');
  });
}
