part of 'competition_winner_cubit.dart';


class CompetitionWinnerState {
  final TeamDetails? team;
  final DataStates dataStates;
  final ErrorScenario? errorScenario;

  const CompetitionWinnerState({
    this.team,
    this.dataStates:DataStates.initial,
    this.errorScenario,
  });

  CompetitionWinnerState copyWith({
    TeamDetails? team,
    DataStates? dataStates,
    ErrorScenario? errorScenario,
  }) {
    return CompetitionWinnerState(
      team: team ?? this.team,
      dataStates: dataStates ?? this.dataStates,
      errorScenario: errorScenario ?? this.errorScenario,
    );
  }

}
