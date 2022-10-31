import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/user.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/storage_repository.dart';
import 'package:projeto_base/src/domain/usecases/save_user_storage_usecase.dart';
import 'package:mocktail/mocktail.dart';

class StorageRepositoryMock extends Mock implements IStorageRepository {}

void main() {
  final repository = StorageRepositoryMock();
  final usecase = SaveUserStorageUsecase(repository);
  final User user = User(name: 'name', token: 'token');

  test('deve retornar um void para user salvo com sucesso', () async {
    when(() => repository.saveUserStorage(user)).thenAnswer((invocation) async => right(true));

    final response = await usecase(user);

    expect(response.fold(id, id), isA<bool>());

    expect(response.fold(id, id), true);
  });

  test('deve retornar um FalireException se der error ao salvo user', () async {
    const error = FalireException('Error');
    when(() => repository.saveUserStorage(user)).thenAnswer((invocation) async => left(error));

    final response = await usecase(user);

    expect(response.fold(id, id), isA<FalireException>());

    final result = (response.fold(id, id) as FalireException);

    expect(result.message, 'Error');
  });
}
