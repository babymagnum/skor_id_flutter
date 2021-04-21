import 'package:skor_id_flutter/model/country_read.dart';

countryReadFromJson(CountryRead data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'];
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['data'] != null) {
		data.data = CountryReadData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> countryReadToJson(CountryRead entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

countryReadDataFromJson(CountryReadData data, Map<String, dynamic> json) {
	if (json['country'] != null) {
		data.country = CountryReadDataCountry().fromJson(json['country']);
	}
	if (json['league'] != null) {
		data.league = (json['league'] as List).map((v) => CountryReadDataLeague().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> countryReadDataToJson(CountryReadData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['country'] = entity.country?.toJson();
	data['league'] =  entity.league?.map((v) => v.toJson())?.toList();
	return data;
}

countryReadDataCountryFromJson(CountryReadDataCountry data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['photo_url'] != null) {
		data.photoUrl = json['photo_url'].toString();
	}
	if (json['thumb_url'] != null) {
		data.thumbUrl = json['thumb_url'].toString();
	}
	return data;
}

Map<String, dynamic> countryReadDataCountryToJson(CountryReadDataCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo_url'] = entity.photoUrl;
	data['thumb_url'] = entity.thumbUrl;
	return data;
}

countryReadDataLeagueFromJson(CountryReadDataLeague data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['photo_url'] != null) {
		data.photoUrl = json['photo_url'].toString();
	}
	if (json['thumb_url'] != null) {
		data.thumbUrl = json['thumb_url'].toString();
	}
	if (json['country_id'] != null) {
		data.countryId = json['country_id'] is String
				? int.tryParse(json['country_id'])
				: json['country_id'].toInt();
	}
	return data;
}

Map<String, dynamic> countryReadDataLeagueToJson(CountryReadDataLeague entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo_url'] = entity.photoUrl;
	data['thumb_url'] = entity.thumbUrl;
	data['country_id'] = entity.countryId;
	return data;
}