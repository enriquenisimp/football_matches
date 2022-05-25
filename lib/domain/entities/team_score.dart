import 'package:football_matches/core/enums/winner_match.dart';

class TeamScore{
  final int id;
  final int matchesWon;
  final int diffGoals;

  TeamScore({required this.id, this.matchesWon=0, this.diffGoals=0});

  TeamScore copyWith({
    int? id,
    required bool won,
    int? diffGoals
  }) {
    return TeamScore(
      id: id ?? this.id,
      matchesWon:won ?  matchesWon +1: matchesWon,
      diffGoals:diffGoals?? this.diffGoals
    );
  }
}