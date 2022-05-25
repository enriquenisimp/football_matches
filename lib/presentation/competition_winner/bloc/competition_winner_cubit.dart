import 'package:bloc/bloc.dart';
import 'package:football_matches/core/enums/data_states.dart';
import 'package:football_matches/core/enums/error_type.dart';
import 'package:football_matches/data/model/team.dart';
import 'package:football_matches/data/model/team_details.dart';
import 'package:football_matches/data/usecases/matches_usecases.dart';
import 'package:football_matches/domain/entities/error_scenario.dart';
import 'package:meta/meta.dart';

part 'competition_winner_state.dart';

class CompetitionWinnerCubit extends Cubit<CompetitionWinnerState> {
  MatchesUseCases matchesUseCases;
  CompetitionWinnerCubit(this.matchesUseCases) : super(CompetitionWinnerState());

  getTeamWinner(String idCompetition) async {
   final result = await matchesUseCases.getWinner(idCompetition);


   if(result!=null){
     getTeamWinnerDetails(result.id.toString());
   }else{
     emit(state.copyWith(
         dataStates: DataStates.failure,
         errorScenario: ErrorScenario("Something went wrong, please try again", "Something went wrong", ErrorType.serviceFail)));
   }
  }

  getTeamWinnerDetails(String idTeam) async {
    final result = await matchesUseCases.getTeamDetails(idTeam);

    if(result!=null){
      emit(state.copyWith(team:result, dataStates: DataStates.success));
    }else{
      emit(state.copyWith(
          dataStates: DataStates.failure,
          errorScenario: ErrorScenario("Something went wrong, please try again", "Something went wrong", ErrorType.serviceFail)));
    }
  }
}
