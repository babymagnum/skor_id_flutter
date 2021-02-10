class LoginRequest {
  LoginRequest(this.email, this.password);

  String email;
  String password;

  dynamic getBody() {
    return {
      "email": email,
      "password": password,
    };
  }
}