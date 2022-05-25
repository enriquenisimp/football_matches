import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_matches/common_widgets/failure_widget.dart';
import 'package:football_matches/core/enums/data_states.dart';
import 'package:football_matches/domain/entities/item_dropdown.dart';
import 'package:football_matches/presentation/choose_competition/bloc/competition_cubit.dart';
import 'package:football_matches/presentation/choose_competition/widgets/option_selector_widget.dart';
import 'package:football_matches/presentation/competition_winner/views/competition_winner.dart';


class ChooseCompetition extends StatefulWidget {
  const ChooseCompetition({Key? key}) : super(key: key);

  @override
  _ChooseCompetitionState createState() => _ChooseCompetitionState();
}

class _ChooseCompetitionState extends State<ChooseCompetition> {
  late CompetitionCubit competitionCubit;
  @override
  void initState() {
    // TODO: implement initState
    competitionCubit = BlocProvider.of(context);
    competitionCubit.getAreas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: BlocBuilder<CompetitionCubit, CompetitionState>(
              builder: (context, state) {
            if (state.dataStates == DataStates.success) {
              if (!state.isAreaSelected) {
                return Center(
                  child: OptionSelector(
                    title: "Choose Area",
                    valueSelected: state.userSelections?.idArea ??
                        state.areas!.area![0].id!.toString(),
                    onChanged: (value) {
                      if (value != null) {
                        competitionCubit.chooseArea(value);
                      }
                    },
                    onPressed: () {
                      competitionCubit.getCompetitions();
                    },
                    items: List.generate(
                      state.areas!.count!,
                      (index) => ItemDropdown(state.areas!.area![index].id!,
                          state.areas!.area![index].name!),
                    ),
                    buttonTitle: 'Next',
                  ),
                );
              } else {
                return OptionSelector(
                  title: "Choose Competition",
                  valueSelected: state.userSelections?.idCompetition ??
                      state.competitions!.competition![0].id!.toString(),
                  onChanged: (value) {
                    if(value!=null) {
                      competitionCubit.chooseCompetition(value);
                    }
                  },
                  onPressed: () async {
                    if(state.userSelections?.idCompetition!=null) {
                     await Navigator.push(context,
                        MaterialPageRoute(builder:(context)=>
                         CompetitionWinner(state.userSelections!.idCompetition!) ));
                    }
                  },
                  items: List.generate(
                    state.competitions!.count!,
                    (index) => ItemDropdown(
                        state.competitions!.competition![index].id!,
                        state.competitions!.competition![index].name!),
                  ),
                  buttonTitle: 'Next',
                );
              }
            } else if (state.dataStates == DataStates.failure) {
              return FailureWidget(
                  title: state.errorScenario!.title,
                  message: state.errorScenario!.message,
                  onTap: () {
                    competitionCubit.resetValues();
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
