class User {
  String token;
  String name;
  String? role;

  User({
    required this.token,
    required this.name,
    this.role,
  });
}
