import 'package:football_matches/core/enums/team_filter.dart';
import 'package:football_matches/data/model/area.dart';
import 'package:football_matches/data/model/competition.dart';
import 'package:football_matches/data/model/team.dart';
import 'package:football_matches/data/model/team_details.dart';
import 'package:football_matches/data/repository/matches_respository.dart';
import 'package:football_matches/data/usecases/i_matches_usecases.dart';
import 'package:football_matches/domain/entities/team_score.dart';
import 'package:football_matches/domain/repositories/domain_repository.dart';

class MatchesUseCases implements IMatchesUseCases{
  MatchesRepository matchesRepository;
  MatchesUseCases(this.matchesRepository);


  @override
  Future<Competitions?> getCompetitionsByArea(String idArea) async {

   final result = await matchesRepository.getCompetitions();
   final competitionsFiltered = result?.competition?.
   where((element) => element.area?.id.toString()==idArea)
       .toList();
   return Competitions(count: competitionsFiltered?.length, competition:competitionsFiltered);
  }

  @override
  Future<Areas?> getAreas() {
    return matchesRepository.getAreas();
  }

  @override
  Future<TeamScore?> getWinner(String idCompetition) async {
    final result = await matchesRepository.getWinner(idCompetition);
    TeamScore? teamWinner;
    if(result!=null) {
      teamWinner = DomainRepository.getWinnerFromScores(DomainRepository.getScoresFromMatches(result));
    }

    return teamWinner;
  }

  @override
  Future<TeamDetails?> getTeamDetails(String idTeam) async {
    final result = await matchesRepository.getTeamDetails(idTeam);

    return result;
  }

}