import '../../domain/entities/user_pdv.dart';

class UserPdvDataStruct {
  String id;
  String name;
  String login;
  String cpf;
  String createdAt;
  String updatedAt;
  String email;
  String confirmationToken;
  bool isActive;

  UserPdvDataStruct({
    required this.id,
    required this.name,
    required this.login,
    required this.cpf,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.confirmationToken,
    required this.isActive,
  });

  static UserPdvDataStruct fromDataStruct(UserPdv data) {
    return UserPdvDataStruct(
        id: (data.id ?? 0).toString(),
        name: data.name ?? '',
        login: data.login ?? '',
        cpf: data.cpf ?? '',
        createdAt: data.createdAt ?? '',
        updatedAt: data.updatedAt ?? '',
        email: data.email ?? '',
        confirmationToken: data.confirmationToken ?? '',
        isActive: data.isActive ?? false);
  }
}
