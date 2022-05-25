import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_matches/common_widgets/failure_widget.dart';
import 'package:football_matches/core/enums/data_states.dart';
import 'package:football_matches/data/repository/matches_respository.dart';
import 'package:football_matches/data/usecases/matches_usecases.dart';
import 'package:football_matches/presentation/competition_winner/bloc/competition_winner_cubit.dart';
import 'package:football_matches/presentation/competition_winner/widgets/active_competittions_widget.dart';
import 'package:football_matches/presentation/competition_winner/widgets/header_widget.dart';
import 'package:football_matches/presentation/competition_winner/widgets/squad_widget.dart';

class CompetitionWinner extends StatelessWidget {
  final String idCompetition;
  const CompetitionWinner(
    this.idCompetition, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CompetitionWinnerCubit(MatchesUseCases(MatchesRepository(Dio()))),
        child: CompetitionWinnerView(idCompetition));
  }
}

class CompetitionWinnerView extends StatefulWidget {
  final String idCompetition;
  const CompetitionWinnerView(this.idCompetition, {Key? key}) : super(key: key);

  @override
  _CompetitionWinnerViewState createState() => _CompetitionWinnerViewState();
}

class _CompetitionWinnerViewState extends State<CompetitionWinnerView> {
  late CompetitionWinnerCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<CompetitionWinnerCubit>(context);
    cubit.getTeamWinner(widget.idCompetition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CompetitionWinnerCubit, CompetitionWinnerState>(
          bloc: cubit,
          builder: (context, state) {
            if (state.dataStates == DataStates.success) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "CONGRATULATIONS TO THE WINNER!",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Image.network(state.team!.crestUrl!),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.team!.name!,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SquadWidget(squad: state.team!.squad),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: HeaderWidget(
                        title: "Venue",
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          state.team!.venue!,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ActiveCompetitionsWidget(competitions: state.team!.activeCompetitions!),
                    ),

                  ],
                ),
              );
            } else if (state.dataStates == DataStates.failure) {
              return FailureWidget(
                  title: state.errorScenario!.title,
                  message: state.errorScenario!.message,
                  onTap: () {});
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
