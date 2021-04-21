class UpdateUserRequest {
  String name;
  String mobile;
  String photo;
  String birthday;
  String address;

  UpdateUserRequest(
      this.name, this.mobile, this.photo, this.birthday, this.address);

  dynamic getBody() {
    return {
      "name": name,
      "mobile": mobile,
      "photo": photo,
      "birthday": birthday,
      "address": address
    };
  }
}