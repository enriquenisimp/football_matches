import 'package:football_matches/data/model/competition.dart';
import 'package:football_matches/data/model/season.dart';
import 'package:football_matches/data/model/standings.dart';

class StandingByCompetition {
  Competition? competition;
  Season? season;
  List<Standings>? standings;

  StandingByCompetition({ this.competition, this.season, this.standings});

  StandingByCompetition.fromJson(Map<String, dynamic> json) {
    competition = json['competition'] != null ?  Competition.fromJson(json['competition']) : null;
    season = json['season'] != null ?  Season.fromJson(json['season']) : null;
    if (json['standings'] != null) {
      standings = <Standings>[];
      json['standings'].forEach((v) { standings!.add(Standings.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (competition != null) {
      data['competition'] = competition!.toJson();
    }
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (standings != null) {
      data['standings'] = standings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}