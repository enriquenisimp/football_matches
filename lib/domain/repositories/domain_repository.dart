import 'package:football_matches/core/enums/winner_match.dart';
import 'package:football_matches/data/model/matches_by_competition.dart';
import 'package:football_matches/data/model/team.dart';
import 'package:football_matches/domain/entities/team_score.dart';

class DomainRepository {
 static List<TeamScore> getScoresFromMatches(
    MatchesByCompetition matchesByCompetition,
  ) {
    List<TeamScore> teamsScore = <TeamScore>[];
    for (var i = 0; i < matchesByCompetition.count!; i++) {
      final match = matchesByCompetition.matches![i];
      if (teamsScore.isNotEmpty) {
        var indexAway = teamsScore
            .indexWhere((element) => element.id == match.awayTeam!.id);
        if (indexAway<0) {
          teamsScore.add(TeamScore(
              id: match.awayTeam!.id!,
              matchesWon: match.score!.winner == WinnerMatch.awayTeam ? 1 : 0,
              diffGoals: match.score!.fullTime!.awayTeam! -
                  match.score!.fullTime!.homeTeam!));
        } else {
          teamsScore[indexAway]=teamsScore[indexAway].copyWith(
              won: match.score!.winner == WinnerMatch.awayTeam,
              diffGoals: teamsScore[indexAway].diffGoals +
                  (match.score!.fullTime!.awayTeam! -
                      match.score!.fullTime!.homeTeam!));
        }
        var indexHome = teamsScore
            .indexWhere((element) => element.id == match.homeTeam!.id);
        if (indexHome<0) {
          teamsScore.add(TeamScore(
              id: match.homeTeam!.id!,
              matchesWon: match.score!.winner == WinnerMatch.homeTeam ? 1 : 0,
              diffGoals: match.score!.fullTime!.homeTeam! -
                  match.score!.fullTime!.awayTeam!));
        } else {
          teamsScore[indexHome]=(teamsScore[indexHome].copyWith(
              won: match.score!.winner == WinnerMatch.homeTeam,
              diffGoals: teamsScore[indexHome].diffGoals +
                  (match.score!.fullTime!.homeTeam! -
                      match.score!.fullTime!.awayTeam!)));
        }
      } else {
        if (match.awayTeam != null) {
          teamsScore.add(TeamScore(
              id: match.awayTeam!.id!,
              matchesWon: match.score!.winner == WinnerMatch.awayTeam ? 1 : 0,
              diffGoals: match.score!.fullTime!.awayTeam! -
                  match.score!.fullTime!.homeTeam!));
        }
        if (match.homeTeam != null) {
          teamsScore.add(TeamScore(
              id: match.homeTeam!.id!,
              matchesWon: match.score!.winner == WinnerMatch.homeTeam ? 1 : 0,
              diffGoals: match.score!.fullTime!.homeTeam! -
                  match.score!.fullTime!.awayTeam!));
        }
      }
    }
    print("here we start unordered:");
    teamsScore.reversed.forEach((element) {print("${element.id}: ${element.matchesWon}  diffGoal:${element.diffGoals}");});
    return teamsScore;
  }

  static TeamScore getWinnerFromScores(List<TeamScore> teamsScores){
    teamsScores.sort((teamA, teamB){
     int compared= teamA.matchesWon.compareTo(teamB.matchesWon);
      if(compared!=0) {
        return compared;
      } else{
        return teamA.diffGoals.compareTo(teamB.diffGoals);
      }
    });
    print("here we start ordered:");
    teamsScores.reversed.forEach((element) {print("${element.id}: ${element.matchesWon} diffGoal:${element.diffGoals}");});
    return teamsScores.last;
  }

}
