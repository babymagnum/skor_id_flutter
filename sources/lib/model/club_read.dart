class Club_read {
  bool status;
  String message;
  Data data;

  Club_read({
      this.status, 
      this.message, 
      this.data});

  Club_read.fromJson(dynamic json) {
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
  Club club;
  League league;
  Country country;
  List<dynamic> tags;

  Data({
      this.club, 
      this.league, 
      this.country, 
      this.tags});

  Data.fromJson(dynamic json) {
    club = json["club"] != null ? Club.fromJson(json["club"]) : null;
    league = json["league"] != null ? League.fromJson(json["league"]) : null;
    country = json["country"] != null ? Country.fromJson(json["country"]) : null;
    if (json["tags"] != null) {
      tags = [];
      json["tags"].forEach((v) {
        tags.add(dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (club != null) {
      map["club"] = club.toJson();
    }
    if (league != null) {
      map["league"] = league.toJson();
    }
    if (country != null) {
      map["country"] = country.toJson();
    }
    if (tags != null) {
      map["tags"] = tags.map((v) => v.toJson()).toList();
    }
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

class Club {
  int id;
  String name;
  String description;
  String photoUrl;
  String thumbUrl;
  int leagueId;

  Club({
      this.id, 
      this.name, 
      this.description, 
      this.photoUrl, 
      this.thumbUrl, 
      this.leagueId});

  Club.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    photoUrl = json["photo_url"];
    thumbUrl = json["thumb_url"];
    leagueId = json["league_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["photo_url"] = photoUrl;
    map["thumb_url"] = thumbUrl;
    map["league_id"] = leagueId;
    return map;
  }

}