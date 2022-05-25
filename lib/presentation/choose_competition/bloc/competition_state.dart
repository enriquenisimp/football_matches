part of 'competition_cubit.dart';


class CompetitionState{
  final DataStates dataStates;
  final Competitions? competitions;
  final Areas? areas;
  final bool isAreaSelected;
  final UserSelections? userSelections;
  final ErrorScenario? errorScenario;

  const CompetitionState({
    this.dataStates=DataStates.initial,
    this.competitions,
    this.areas,
    this.isAreaSelected=false,
    this.userSelections,
    this.errorScenario,
  });

  CompetitionState copyWith({
    DataStates? dataStates,
    Competitions? competitions,
    Areas? areas,
    bool? isAreaSelected,
    UserSelections? userSelections,
    ErrorScenario? errorScenario
  }) {
    return CompetitionState(
      dataStates: dataStates ?? this.dataStates,
      competitions: competitions ?? this.competitions,
      areas: areas ?? this.areas,
      isAreaSelected:isAreaSelected?? this.isAreaSelected,
      userSelections: userSelections?? this.userSelections,
        errorScenario: errorScenario?? this.errorScenario
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompetitionState &&
          runtimeType == other.runtimeType &&
          dataStates == other.dataStates;

  @override
  int get hashCode => dataStates.hashCode;
}
