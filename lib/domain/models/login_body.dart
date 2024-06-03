class LoginBody {
  final String username;
  final String password;

  LoginBody({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}
