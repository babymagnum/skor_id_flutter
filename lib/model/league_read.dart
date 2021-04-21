import 'package:skor_id_flutter/generated/json/base/json_convert_content.dart';
import 'package:skor_id_flutter/generated/json/base/json_field.dart';

class LeagueRead with JsonConvert<LeagueRead> {
	bool? status;
	String? message;
	LeagueReadData? data;
}

class LeagueReadData with JsonConvert<LeagueReadData> {
	LeagueReadDataLeague? league;
	LeagueReadDataCountry? country;
	List<LeagueReadDataClub>? club;
}

class LeagueReadDataLeague with JsonConvert<LeagueReadDataLeague> {
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

class LeagueReadDataCountry with JsonConvert<LeagueReadDataCountry> {
	int? id;
	String? name;
	String? description;
	@JSONField(name: "photo_url")
	String? photoUrl;
	@JSONField(name: "thumb_url")
	String? thumbUrl;
}

class LeagueReadDataClub with JsonConvert<LeagueReadDataClub> {
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
