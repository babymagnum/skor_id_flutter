import 'package:skor_id_flutter/generated/json/base/json_convert_content.dart';
import 'package:skor_id_flutter/generated/json/base/json_field.dart';

class CountryRead with JsonConvert<CountryRead> {
	bool? status;
	String? message;
	CountryReadData? data;
}

class CountryReadData with JsonConvert<CountryReadData> {
	CountryReadDataCountry? country;
	List<CountryReadDataLeague>? league;
}

class CountryReadDataCountry with JsonConvert<CountryReadDataCountry> {
	int? id;
	String? name;
	String? description;
	@JSONField(name: "photo_url")
	String? photoUrl;
	@JSONField(name: "thumb_url")
	String? thumbUrl;
}

class CountryReadDataLeague with JsonConvert<CountryReadDataLeague> {
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
