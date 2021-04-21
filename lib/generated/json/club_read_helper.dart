import 'package:skor_id_flutter/model/club_read.dart';

clubReadFromJson(ClubRead data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'];
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['data'] != null) {
		data.data = ClubReadData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> clubReadToJson(ClubRead entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

clubReadDataFromJson(ClubReadData data, Map<String, dynamic> json) {
	if (json['club'] != null) {
		data.club = ClubReadDataClub().fromJson(json['club']);
	}
	if (json['league'] != null) {
		data.league = ClubReadDataLeague().fromJson(json['league']);
	}
	if (json['country'] != null) {
		data.country = ClubReadDataCountry().fromJson(json['country']);
	}
	if (json['tags'] != null) {
		data.tags = (json['tags'] as List).map((v) => v).toList().cast<dynamic>();
	}
	return data;
}

Map<String, dynamic> clubReadDataToJson(ClubReadData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['club'] = entity.club?.toJson();
	data['league'] = entity.league?.toJson();
	data['country'] = entity.country?.toJson();
	data['tags'] = entity.tags;
	return data;
}

clubReadDataClubFromJson(ClubReadDataClub data, Map<String, dynamic> json) {
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
	if (json['league_id'] != null) {
		data.leagueId = json['league_id'] is String
				? int.tryParse(json['league_id'])
				: json['league_id'].toInt();
	}
	return data;
}

Map<String, dynamic> clubReadDataClubToJson(ClubReadDataClub entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo_url'] = entity.photoUrl;
	data['thumb_url'] = entity.thumbUrl;
	data['league_id'] = entity.leagueId;
	return data;
}

clubReadDataLeagueFromJson(ClubReadDataLeague data, Map<String, dynamic> json) {
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

Map<String, dynamic> clubReadDataLeagueToJson(ClubReadDataLeague entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo_url'] = entity.photoUrl;
	data['thumb_url'] = entity.thumbUrl;
	data['country_id'] = entity.countryId;
	return data;
}

clubReadDataCountryFromJson(ClubReadDataCountry data, Map<String, dynamic> json) {
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

Map<String, dynamic> clubReadDataCountryToJson(ClubReadDataCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo_url'] = entity.photoUrl;
	data['thumb_url'] = entity.thumbUrl;
	return data;
}