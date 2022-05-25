import 'package:bloc/bloc.dart';
import 'package:football_matches/core/enums/data_states.dart';
import 'package:football_matches/core/enums/error_type.dart';
import 'package:football_matches/data/model/area.dart';
import 'package:football_matches/data/model/competition.dart';
import 'package:football_matches/data/usecases/matches_usecases.dart';
import 'package:football_matches/domain/entities/user_selections.dart';

import '../../../domain/entities/error_scenario.dart';

part 'competition_state.dart';

class CompetitionCubit extends Cubit<CompetitionState> {
  MatchesUseCases matchesUseCases;
  CompetitionCubit(this.matchesUseCases) : super(const CompetitionState());

  chooseCompetition(String idCompetition) {
    emit(state.copyWith(
        userSelections:
            state.userSelections!.copyWith(idCompetition: idCompetition)));
  }

  chooseArea(String idArea) {
    emit(state.copyWith(userSelections: UserSelections(idArea: idArea)));
  }

  getAreas() async {
    emit(state.copyWith(dataStates: DataStates.loading));

    final result = await matchesUseCases.getAreas();
    if (result != null) {
      emit(state.copyWith(areas: result, dataStates: DataStates.success));
    } else {
      emit(state.copyWith(
          dataStates: DataStates.failure,
          errorScenario: ErrorScenario(
              "Something went wrong, please try again.",
              "Something went wrong",
              ErrorType.serviceFail)));
    }
  }

  getCompetitions() async {
    emit(state.copyWith(dataStates: DataStates.loading));

    final result = await matchesUseCases
        .getCompetitionsByArea(state.userSelections!.idArea!);
    if (result != null) {
      if (result.count! > 0) {
        emit(state.copyWith(
            competitions: result,
            dataStates: DataStates.success,
            isAreaSelected: true));
      } else {
        emit(state.copyWith(dataStates: DataStates.failure, errorScenario: ErrorScenario(
            "There is no competitions founded in this Area, please try a different one.",
            "No competitions founded",
            ErrorType.noRecord)));
      }
    } else {
      emit(state.copyWith(
          dataStates: DataStates.failure,
          errorScenario: ErrorScenario(
              "Something went wrong, please try again.",
              "Something went wrong",
              ErrorType.serviceFail)));
    }
  }

  resetValues() {
    emit(state.copyWith(isAreaSelected: false, userSelections: null));
    getAreas();
  }
}
