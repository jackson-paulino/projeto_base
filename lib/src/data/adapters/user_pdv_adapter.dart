import '../../domain/entities/user_pdv.dart';

class UserPdvAdapter {
  static UserPdv fromJson(Map<String, dynamic> data) {
    return UserPdv(
      id: data['id'],
      name: data['name'],
      login: data['login'],
      cpf: data['cpf'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
      email: data['email'],
      confirmationToken: data['confirmation_token'],
      isActive: data['is_active'],
    );
  }
}
