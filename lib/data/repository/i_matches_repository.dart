import 'package:football_matches/data/model/area.dart';
import 'package:football_matches/data/model/competition.dart';
import 'package:football_matches/data/model/standing_by_competition.dart';
import 'package:football_matches/data/model/team.dart';

import '../model/matches_by_competition.dart';
import '../model/team_details.dart';

abstract class IMatchesRepository{



  Future<Areas?> getAreas();
  Future<Competitions?> getCompetitions();
  Future<MatchesByCompetition?> getWinner(String idCompetition);
  Future<TeamDetails?> getTeamDetails(String idTeam);

}