import 'package:football_matches/data/model/area.dart';
import 'package:football_matches/data/model/team_details.dart';
import 'package:football_matches/domain/entities/team_score.dart';

import '../model/competition.dart';

abstract class IMatchesUseCases{

  Future<TeamScore?> getWinner(String idCompetition);
  Future<TeamDetails?> getTeamDetails(String idTeam);
  Future<Competitions?> getCompetitionsByArea(String isArea);
  Future<Areas?> getAreas();

}