class Login {
  String username;
  String password;
  bool? rememberMe;
  Login({
    required this.username,
    required this.password,
    this.rememberMe,
  });

  Map<String, dynamic> toDatabaseJson() => {
    'username': username,
    'password': password,
  };
}