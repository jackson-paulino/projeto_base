import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/data/datasources/clear_user_storage_datasource.dart';
import 'package:projeto_base/src/data/datasources/featch_user_storage_datasource.dart';
import 'package:projeto_base/src/data/datasources/save_user_storage_datasource.dart';
import 'package:projeto_base/src/data/repositories/storage_repository.dart';
import 'package:projeto_base/src/domain/entities/user.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:mocktail/mocktail.dart';

class SaveUserStorageDatasourceMock extends Mock implements ISaveUserStorageDatasource {}

class FeatchUserStorageDatasourceMock extends Mock implements IFeatchUserStorageDatasource {}

class ClearUserStorageDatasourceMock extends Mock implements IClearUserStorageDatasource {}

void main() {
  final saveUserStorage = SaveUserStorageDatasourceMock();
  final featchUserStorage = FeatchUserStorageDatasourceMock();
  final clearUserStorage = ClearUserStorageDatasourceMock();
  final repository = StorageRepository(saveUserStorage, featchUserStorage, clearUserStorage);

  test('deve retornar o user salvo no storage', () async {
    final User user = User(token: 'token', name: 'name', role: 'role');

    when(() => featchUserStorage.featchUserStorage()).thenAnswer((_) async => user);

    final result = await repository.featchUserStorage();

    final resultStorage = result.fold((l) => l, (r) => r);

    expect(resultStorage, isA<User>());
  });

  test('deve retornar null quando não tiver user salvo no storage', () async {
    when(() => featchUserStorage.featchUserStorage()).thenAnswer((_) async => null);

    final result = await repository.featchUserStorage();

    final resultStorage = result.fold((l) => l, (r) => r);

    expect(resultStorage, null);
  });

  test('deve retornar FalireException quando der erro na consulta do storage', () async {
    const error = FalireException('Error');
    when(() => featchUserStorage.featchUserStorage()).thenThrow(error);

    final result = await repository.featchUserStorage();

    final resultStorage = result.fold((l) => l, (r) => r);

    expect(resultStorage, isA<IErrorsException>());

    final resultErrror = (resultStorage as IErrorsException);

    expect(resultErrror.message, 'Error');
  });
}
