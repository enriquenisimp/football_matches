import 'package:football_matches/data/model/area.dart';
import 'package:football_matches/data/model/squad.dart';

class TeamDetails {
  int? id;
  Area? area;
  List<ActiveCompetitions>? activeCompetitions;
  String? name;
  String? shortName;
  String? tla;
  String? crestUrl;
  String? address;
  String? phone;
  String? website;
  String? email;
  int? founded;
  String? clubColors;
  String? venue;
  List<Squad>? squad;
  String? lastUpdated;

  TeamDetails(
      {this.id,
        this.area,
        this.activeCompetitions,
        this.name,
        this.shortName,
        this.tla,
        this.crestUrl,
        this.address,
        this.phone,
        this.website,
        this.email,
        this.founded,
        this.clubColors,
        this.venue,
        this.squad,
        this.lastUpdated});

  TeamDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = json['area'] != null ?  Area.fromJson(json['area']) : null;
    if (json['activeCompetitions'] != null) {
      activeCompetitions = <ActiveCompetitions>[];
      json['activeCompetitions'].forEach((v) {
        activeCompetitions!.add( ActiveCompetitions.fromJson(v));
      });
    }
    name = json['name'];
    shortName = json['shortName'];
    tla = json['tla'];
    crestUrl = json['crestUrl'];
    address = json['address'];
    phone = json['phone'];
    website = json['website'];
    email = json['email'];
    founded = json['founded'];
    clubColors = json['clubColors'];
    venue = json['venue'];
    if (json['squad'] != null) {
      squad = <Squad>[];
      json['squad'].forEach((v) {
        squad!.add(  Squad.fromJson(v));
      });
    }
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (area != null) {
      data['area'] = area!.toJson();
    }
    if (activeCompetitions != null) {
      data['activeCompetitions'] =
          activeCompetitions!.map((v) => v.toJson()).toList();
    }
    data['name'] =  name;
    data['shortName'] =  shortName;
    data['tla'] =  tla;
    data['crestUrl'] =  crestUrl;
    data['address'] =  address;
    data['phone'] =  phone;
    data['website'] =  website;
    data['email'] =  email;
    data['founded'] =  founded;
    data['clubColors'] =  clubColors;
    data['venue'] =  venue;
    if ( squad != null) {
      data['squad'] =  squad!.map((v) => v.toJson()).toList();
    }
    data['lastUpdated'] =  lastUpdated;
    return data;
  }
}

class ActiveCompetitions {
  int? id;
  Area? area;
  String? name;
  String? code;
  String? plan;
  String? lastUpdated;

  ActiveCompetitions(
      {this.id, this.area, this.name, this.code, this.plan, this.lastUpdated});

  ActiveCompetitions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = json['area'] != null ?   Area.fromJson(json['area']) : null;
    name = json['name'];
    code = json['code'];
    plan = json['plan'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] =  id;
    if ( area != null) {
      data['area'] =  area!.toJson();
    }
    data['name'] =  name;
    data['code'] =  code;
    data['plan'] =  plan;
    data['lastUpdated'] =  lastUpdated;
    return data;
  }
}

