class Country_read {
  bool status;
  String message;
  Data data;

  Country_read({
      this.status, 
      this.message, 
      this.data});

  Country_read.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }

}

class Data {
  Country country;
  List<League> league;

  Data({
      this.country, 
      this.league});

  Data.fromJson(dynamic json) {
    country = json["country"] != null ? Country.fromJson(json["country"]) : null;
    if (json["league"] != null) {
      league = [];
      json["league"].forEach((v) {
        league.add(League.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (country != null) {
      map["country"] = country.toJson();
    }
    if (league != null) {
      map["league"] = league.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class League {
  int id;
  String name;
  String description;
  String photoUrl;
  String thumbUrl;
  int countryId;

  League({
      this.id, 
      this.name, 
      this.description, 
      this.photoUrl, 
      this.thumbUrl, 
      this.countryId});

  League.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    photoUrl = json["photo_url"];
    thumbUrl = json["thumb_url"];
    countryId = json["country_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["photo_url"] = photoUrl;
    map["thumb_url"] = thumbUrl;
    map["country_id"] = countryId;
    return map;
  }

}

class Country {
  int id;
  String name;
  String description;
  String photoUrl;
  String thumbUrl;

  Country({
      this.id, 
      this.name, 
      this.description, 
      this.photoUrl, 
      this.thumbUrl});

  Country.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    photoUrl = json["photo_url"];
    thumbUrl = json["thumb_url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["photo_url"] = photoUrl;
    map["thumb_url"] = thumbUrl;
    return map;
  }

}