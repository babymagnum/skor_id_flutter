import 'package:skor_id_flutter/generated/json/base/json_convert_content.dart';
import 'package:skor_id_flutter/generated/json/base/json_field.dart';

class Login with JsonConvert<Login> {
	bool? status;
	String? message;
	LoginData? data;
}

class LoginData with JsonConvert<LoginData> {
	@JSONField(name: "access_token")
	String? accessToken;
	@JSONField(name: "token_type")
	String? tokenType;
	@JSONField(name: "expires_in")
	int? expiresIn;
}
