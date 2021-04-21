import 'package:skor_id_flutter/model/login.dart';

loginFromJson(Login data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'];
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['data'] != null) {
		data.data = LoginData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> loginToJson(Login entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

loginDataFromJson(LoginData data, Map<String, dynamic> json) {
	if (json['access_token'] != null) {
		data.accessToken = json['access_token'].toString();
	}
	if (json['token_type'] != null) {
		data.tokenType = json['token_type'].toString();
	}
	if (json['expires_in'] != null) {
		data.expiresIn = json['expires_in'] is String
				? int.tryParse(json['expires_in'])
				: json['expires_in'].toInt();
	}
	return data;
}

Map<String, dynamic> loginDataToJson(LoginData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['access_token'] = entity.accessToken;
	data['token_type'] = entity.tokenType;
	data['expires_in'] = entity.expiresIn;
	return data;
}