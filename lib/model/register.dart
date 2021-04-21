import 'package:skor_id_flutter/generated/json/base/json_convert_content.dart';
import 'package:skor_id_flutter/generated/json/base/json_field.dart';

class Register with JsonConvert<Register> {
	bool? status;
	String? message;
	RegisterData? data;
}

class RegisterData with JsonConvert<RegisterData> {
	RegisterDataUser? user;
	RegisterDataToken? token;
}

class RegisterDataUser with JsonConvert<RegisterDataUser> {
	String? name;
	String? mobile;
	String? email;
	@JSONField(name: "updated_at")
	String? updatedAt;
	@JSONField(name: "created_at")
	String? createdAt;
	int? id;
}

class RegisterDataToken with JsonConvert<RegisterDataToken> {
	@JSONField(name: "access_token")
	String? accessToken;
	@JSONField(name: "token_type")
	String? tokenType;
	@JSONField(name: "expires_in")
	int? expiresIn;
}
