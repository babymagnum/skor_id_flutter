class Login {
  bool status;
  String message;
  Data data;

  Login({
      this.status, 
      this.message, 
      this.data});

  Login.fromJson(dynamic json) {
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
  String accessToken;
  String tokenType;
  int expiresIn;

  Data({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn});

  Data.fromJson(dynamic json) {
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