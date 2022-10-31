import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/domain/entities/user.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/auth_repository.dart';
import 'package:projeto_base/src/domain/usecases/auth_user_usecase.dart';
import 'package:projeto_base/src/shared/data_struct/auth_data_struct.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

void main() {
  final IAuthRepository repository = AuthRepositoryMock();
  final AuthUserUsecase usecase = AuthUserUsecase(repository);
  final authData = AuthDataStruct(login: 'login', password: '123');
  test('deve retornar o user para o login e password estão corretos', () async {
    final user = User(token: 'token', name: 'name');

    when(() => repository.authUser(authData)).thenAnswer((_) async => right(user));

    final response = await usecase(authData);

    expect(response.fold(id, id), isA<User>());
  });

  test('deve retornar FalireException para login invalido', () async {
    const error = FalireException('Error');

    when(() => repository.authUser(authData)).thenAnswer((invocation) async => left(error));

    final response = await usecase(authData);

    expect(response.fold(id, id), isA<FalireException>());
  });
}
