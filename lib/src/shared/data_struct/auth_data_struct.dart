class AuthDataStruct {
  final String login;
  final String password;

  AuthDataStruct({required this.login, required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['login'] = login;
    data['password'] = password;

    return data;
  }
}
