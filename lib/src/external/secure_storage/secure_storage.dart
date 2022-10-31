import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/user.dart';

class SecureStorage {
  final FlutterSecureStorage storage;

  SecureStorage(this.storage);

  String? _mapUser(User user) {
    return '''{"token": "${user.token}", "name": "${user.name}", "role": "${user.role}"}''';
  }

  Future<bool> saveUserStorage(User user) async {
    try {
      var usr = _mapUser(user);
      await storage.write(key: 'user', value: usr);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> featchUserStorage() async {
    try {
      final result = await storage.read(key: 'user');

      if (result != null) {
        final Map<String, dynamic> convertMap = jsonDecode(result);

        final user = User(
          token: convertMap['token'],
          name: convertMap['name'],
          role: convertMap['role'],
        );

        return user;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<bool> clearUserStorage() async {
    try {
      await storage.delete(key: 'user');
      return true;
    } catch (e) {
      return false;
    }
  }
}
