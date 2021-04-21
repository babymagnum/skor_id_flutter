import 'package:skor_id_flutter/generated/json/base/json_convert_content.dart';
import 'package:skor_id_flutter/generated/json/base/json_field.dart';

class ClubRead with JsonConvert<ClubRead> {
	bool? status;
	String? message;
	ClubReadData? data;
}

class ClubReadData with JsonConvert<ClubReadData> {
	ClubReadDataClub? club;
	ClubReadDataLeague? league;
	ClubReadDataCountry? country;
	List<dynamic>? tags;
}

class ClubReadDataClub with JsonConvert<ClubReadDataClub> {
	int? id;
	String? name;
	String? description;
	@JSONField(name: "photo_url")
	String? photoUrl;
	@JSONField(name: "thumb_url")
	String? thumbUrl;
	@JSONField(name: "league_id")
	int? leagueId;
}

class ClubReadDataLeague with JsonConvert<ClubReadDataLeague> {
	int? id;
	String? name;
	String? description;
	@JSONField(name: "photo_url")
	String? photoUrl;
	@JSONField(name: "thumb_url")
	String? thumbUrl;
	@JSONField(name: "country_id")
	int? countryId;
}

class ClubReadDataCountry with JsonConvert<ClubReadDataCountry> {
	int? id;
	String? name;
	String? description;
	@JSONField(name: "photo_url")
	String? photoUrl;
	@JSONField(name: "thumb_url")
	String? thumbUrl;
}
