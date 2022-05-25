import 'package:football_matches/core/enums/winner_match.dart';
import 'package:football_matches/data/model/competition.dart';

import 'area.dart';

class MatchesByCompetition {
  int? count;
  List<Matches>? matches;

  MatchesByCompetition({this.count, this.matches});

  MatchesByCompetition.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) { matches!.add( Matches.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['count'] = count;
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  int? id;
  String? utcDate;
  String? status;
  int? matchday;
  String? stage;
  String? lastUpdated;
  Score? score;
  Area? homeTeam;
  Area? awayTeam;

  Matches({this.id, this.utcDate, this.status, this.matchday, this.stage, this.lastUpdated, this.score, this.homeTeam, this.awayTeam});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    utcDate = json['utcDate'];
    status = json['status'];
    matchday = json['matchday'];
    stage = json['stage'];
    lastUpdated = json['lastUpdated'];
    score = json['score'] != null ?  Score.fromJson(json['score']) : null;
    homeTeam = json['homeTeam'] != null ?  Area.fromJson(json['homeTeam']) : null;
    awayTeam = json['awayTeam'] != null ?  Area.fromJson(json['awayTeam']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    data['utcDate'] = utcDate;
    data['status'] = status;
    data['matchday'] = matchday;
    data['stage'] = stage;
    data['lastUpdated'] = lastUpdated;
    if (score != null) {
      data['score'] = score!.toJson();
    }
    if (homeTeam != null) {
      data['homeTeam'] = homeTeam!.toJson();
    }
    if (awayTeam != null) {
      data['awayTeam'] = awayTeam!.toJson();
    }

    return data;
  }
}

class Score {
  WinnerMatch? winner;
  String? duration;
  FullTime? fullTime;
  // ExtraTime? extraTime;
  // ExtraTime? penalties;

  Score({this.winner, this.duration, this.fullTime,
    // this.extraTime, this.penalties
  });

  Score.fromJson(Map<String, dynamic> json) {
    winner = realValue(json['winner']);
    duration = json['duration'];
    fullTime = json['fullTime'] != null ?  FullTime.fromJson(json['fullTime']) : null;
    // extraTime = json['extraTime'] != null ? new ExtraTime.fromJson(json['extraTime']) : null;
    // penalties = json['penalties'] != null ? new ExtraTime.fromJson(json['penalties']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['winner'] = winner;
    data['duration'] = duration;
    if (fullTime != null) {
      data['fullTime'] = fullTime!.toJson();
    }
    // if (extraTime != null) {
    //   data['extraTime'] = extraTime!.toJson();
    // }
    // if (penalties != null) {
    //   data['penalties'] = this.penalties!.toJson();
    // }
    return data;
  }
}

class FullTime {
  int? homeTeam;
  int? awayTeam;

  FullTime({this.homeTeam, this.awayTeam});

  FullTime.fromJson(Map<String, dynamic> json) {
    homeTeam = json['homeTeam'];
    awayTeam = json['awayTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homeTeam'] = homeTeam;
    data['awayTeam'] = awayTeam;
    return data;
  }
}