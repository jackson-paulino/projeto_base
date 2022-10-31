import '../../domain/entities/user.dart';

class UserAdapter {
  static User fromJson(dynamic data) {
    return User(
      token: data['token'],
      name: data['name'],
      role: data['role'],
    );
  }
}
