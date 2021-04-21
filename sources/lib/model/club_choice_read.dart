class Club_choice_read {
  bool status;
  String message;
  List<Data> data;

  Club_choice_read({
      this.status, 
      this.message, 
      this.data});

  Club_choice_read.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    if (data != null) {
      map["data"] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  League league;
  List<Club> club;

  Data({
      this.league, 
      this.club});

  Data.fromJson(dynamic json) {
    league = json["league"] != null ? League.fromJson(json["league"]) : null;
    if (json["club"] != null) {
      club = [];
      json["club"].forEach((v) {
        club.add(Club.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (league != null) {
      map["league"] = league.toJson();
    }
    if (club != null) {
      map["club"] = club.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Club {
  int clubId;
  int choosedBy;
  Club club;
  Choosed choosed;

  Club({
      this.clubId, 
      this.choosedBy, 
      this.club, 
      this.choosed});

  Club.fromJson(dynamic json) {
    clubId = json["club_id"];
    choosedBy = json["choosed_by"];
    club = json["club"] != null ? Club.fromJson(json["club"]) : null;
    choosed = json["choosed"] != null ? Choosed.fromJson(json["choosed"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["club_id"] = clubId;
    map["choosed_by"] = choosedBy;
    if (club != null) {
      map["club"] = club.toJson();
    }
    if (choosed != null) {
      map["choosed"] = choosed.toJson();
    }
    return map;
  }

}

class Choosed {
  int id;
  String fullname;
  String email;
  String jobTitle;
  String photo;

  Choosed({
      this.id, 
      this.fullname, 
      this.email, 
      this.jobTitle, 
      this.photo});

  Choosed.fromJson(dynamic json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    jobTitle = json["job_title"];
    photo = json["photo"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["fullname"] = fullname;
    map["email"] = email;
    map["job_title"] = jobTitle;
    map["photo"] = photo;
    return map;
  }

}

class Club {
  int id;
  String name;
  String description;
  String photoUrl;
  String thumbUrl;

  Club({
      this.id, 
      this.name, 
      this.description, 
      this.photoUrl, 
      this.thumbUrl});

  Club.fromJson(dynamic json) {
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

  League({
      this.id, 
      this.name, 
      this.description, 
      this.photoUrl, 
      this.thumbUrl});

  League.fromJson(dynamic json) {
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