import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_matches/data/repository/matches_respository.dart';
import 'package:football_matches/data/usecases/matches_usecases.dart';
import 'package:football_matches/presentation/choose_competition/bloc/competition_cubit.dart';
import 'package:football_matches/presentation/choose_competition/views/choose_competition.dart';

import 'core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        home: BlocProvider(
          create: (_) => CompetitionCubit(
            MatchesUseCases(MatchesRepository(Dio())),
          ),
          child: const ChooseCompetition(),
        ));
  }
}
