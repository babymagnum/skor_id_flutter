import 'package:skor_id_flutter/model/register.dart';

registerFromJson(Register data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'];
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['data'] != null) {
		data.data = RegisterData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> registerToJson(Register entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

registerDataFromJson(RegisterData data, Map<String, dynamic> json) {
	if (json['user'] != null) {
		data.user = RegisterDataUser().fromJson(json['user']);
	}
	if (json['token'] != null) {
		data.token = RegisterDataToken().fromJson(json['token']);
	}
	return data;
}

Map<String, dynamic> registerDataToJson(RegisterData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user'] = entity.user?.toJson();
	data['token'] = entity.token?.toJson();
	return data;
}

registerDataUserFromJson(RegisterDataUser data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	return data;
}

Map<String, dynamic> registerDataUserToJson(RegisterDataUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['mobile'] = entity.mobile;
	data['email'] = entity.email;
	data['updated_at'] = entity.updatedAt;
	data['created_at'] = entity.createdAt;
	data['id'] = entity.id;
	return data;
}

registerDataTokenFromJson(RegisterDataToken data, Map<String, dynamic> json) {
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

Map<String, dynamic> registerDataTokenToJson(RegisterDataToken entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['access_token'] = entity.accessToken;
	data['token_type'] = entity.tokenType;
	data['expires_in'] = entity.expiresIn;
	return data;
}