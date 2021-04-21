class Register {
  bool status;
  String message;
  Data data;

  Register({
      this.status, 
      this.message, 
      this.data});

  Register.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }

}

class Data {
  User user;
  Token token;

  Data({
      this.user, 
      this.token});

  Data.fromJson(dynamic json) {
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    token = json["token"] != null ? Token.fromJson(json["token"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (user != null) {
      map["user"] = user.toJson();
    }
    if (token != null) {
      map["token"] = token.toJson();
    }
    return map;
  }

}

class Token {
  String accessToken;
  String tokenType;
  int expiresIn;

  Token({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn});

  Token.fromJson(dynamic json) {
    accessToken = json["access_token"];
    tokenType = json["token_type"];
    expiresIn = json["expires_in"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["access_token"] = accessToken;
    map["token_type"] = tokenType;
    map["expires_in"] = expiresIn;
    return map;
  }

}

class User {
  String name;
  String mobile;
  String email;
  String updatedAt;
  String createdAt;
  int id;

  User({
      this.name, 
      this.mobile, 
      this.email, 
      this.updatedAt, 
      this.createdAt, 
      this.id});

  User.fromJson(dynamic json) {
    name = json["name"];
    mobile = json["mobile"];
    email = json["email"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["mobile"] = mobile;
    map["email"] = email;
    map["updated_at"] = updatedAt;
    map["created_at"] = createdAt;
    map["id"] = id;
    return map;
  }

}