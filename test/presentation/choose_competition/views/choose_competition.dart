// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child common_widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_matches/core/theme/theme.dart';
import 'package:football_matches/data/model/area.dart';
import 'package:football_matches/data/repository/matches_respository.dart';
import 'package:football_matches/data/usecases/matches_usecases.dart';

import 'package:football_matches/main.dart';
import 'package:football_matches/presentation/choose_competition/bloc/competition_cubit.dart';
import 'package:football_matches/presentation/choose_competition/views/choose_competition.dart';
import 'package:mockito/mockito.dart';

import '../bloc/competition_cubit_test.mocks.dart';

void main() {

  MatchesRepository repository =MockMatchesRepository();
  when(repository.getAreas()).thenAnswer((realInvocation) => Future.value(Areas(count: 0)));

  testWidgets('Choose competition widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        home: BlocProvider(
          create: (_) => CompetitionCubit(
            MatchesUseCases(repository),
          ),
          child: const ChooseCompetition(),
        )));
  });
}
