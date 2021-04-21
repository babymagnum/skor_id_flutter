class RegisterRequest {
  String name;
  String mobile;
  String email;
  String password;
  String password_confirmation;

  RegisterRequest(this.name, this.mobile, this.email, this.password,
      this.password_confirmation);

  dynamic getBody() {
    return {
      "name": name,
      "mobile": mobile,
      "email" : email,
      "password" : password,
      "password_confirmation" : password_confirmation
    };
  }
}