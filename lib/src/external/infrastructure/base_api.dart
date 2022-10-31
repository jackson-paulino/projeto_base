class BaseApi {
  static Map<String, dynamic> headers(String token) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }
}
