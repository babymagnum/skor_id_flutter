import 'package:skor_id_flutter/model/league_read.dart';

leagueReadFromJson(LeagueRead data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'];
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['data'] != null) {
		data.data = LeagueReadData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> leagueReadToJson(LeagueRead entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

leagueReadDataFromJson(LeagueReadData data, Map<String, dynamic> json) {
	if (json['league'] != null) {
		data.league = LeagueReadDataLeague().fromJson(json['league']);
	}
	if (json['country'] != null) {
		data.country = LeagueReadDataCountry().fromJson(json['country']);
	}
	if (json['club'] != null) {
		data.club = (json['club'] as List).map((v) => LeagueReadDataClub().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> leagueReadDataToJson(LeagueReadData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['league'] = entity.league?.toJson();
	data['country'] = entity.country?.toJson();
	data['club'] =  entity.club?.map((v) => v.toJson())?.toList();
	return data;
}

leagueReadDataLeagueFromJson(LeagueReadDataLeague data, Map<String, dynamic> json) {
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

Map<String, dynamic> leagueReadDataLeagueToJson(LeagueReadDataLeague entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo_url'] = entity.photoUrl;
	data['thumb_url'] = entity.thumbUrl;
	data['country_id'] = entity.countryId;
	return data;
}

leagueReadDataCountryFromJson(LeagueReadDataCountry data, Map<String, dynamic> json) {
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

Map<String, dynamic> leagueReadDataCountryToJson(LeagueReadDataCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo_url'] = entity.photoUrl;
	data['thumb_url'] = entity.thumbUrl;
	return data;
}

leagueReadDataClubFromJson(LeagueReadDataClub data, Map<String, dynamic> json) {
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

Map<String, dynamic> leagueReadDataClubToJson(LeagueReadDataClub entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['photo_url'] = entity.photoUrl;
	data['thumb_url'] = entity.thumbUrl;
	data['league_id'] = entity.leagueId;
	return data;
}