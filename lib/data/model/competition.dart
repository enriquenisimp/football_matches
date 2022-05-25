import 'package:football_matches/data/model/area.dart';
class Competitions{
  int? count;
  List<Competition>? competition;

  Competitions({this.count, this.competition});

  Competitions.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['competitions'] != null) {
      print(json['competitions']);
      competition = <Competition>[];
      json['competitions'].forEach((v) { competition!.add(Competition.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (competition != null) {
      data['competitions'] = competition!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Competition {
  int? id;
  Area? area;
  String? name;
  String? code;
  String? plan;
  String? lastUpdated;

  Competition({this.id, this.area, this.name, this.code, this.plan, this.lastUpdated});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = json['area'] != null ?  Area.fromJson(json['area']) : null;
    name = json['name'];
    code = json['code'];
    plan = json['plan'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    data['name'] = this.name;
    data['code'] = this.code;
    data['plan'] = this.plan;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}