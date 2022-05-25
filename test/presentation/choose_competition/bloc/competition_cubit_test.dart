// Mock Cubit
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_matches/core/enums/data_states.dart';
import 'package:football_matches/data/model/area.dart';
import 'package:football_matches/data/repository/matches_respository.dart';
import 'package:football_matches/data/usecases/matches_usecases.dart';
import 'package:football_matches/presentation/choose_competition/bloc/competition_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'competition_cubit_test.mocks.dart';

class MockCompetitionCubit extends MockCubit<CompetitionState>
    implements CompetitionCubit {}

//class MockRepository extends Mock implements MatchesRepository {}

@GenerateMocks([MatchesRepository])
void main() {
  mainCubit();
}

void mainCubit() {
  late MatchesRepository repository;
  repository = MockMatchesRepository();
  when(repository.getAreas()).thenAnswer(
        (_) => Future.value(
        Areas(count: 0)
    ),
  );
  // group('whenListen', () {
  //   test("Let's mock the CounterCubit's stream!", () {
  //     // Create Mock CounterCubit Instance
  //     final cubit = MockCompetitionCubit();
  //
  //     // Stub the listen with a fake Stream
  //     whenListen(cubit, Stream.fromIterable([0, 1, 2, 3]));
  //
  //     // Expect that the CounterCubit instance emitted the stubbed Stream of
  //     // states
  //     expectLater(cubit.stream, emitsInOrder(<int>[0, 1, 2, 3]));
  //   });
  // });

  group('MockCompetitionCubit', () {

    blocTest<CompetitionCubit, CompetitionState>(
      'emits [1] when increment is called',
      build: () => CompetitionCubit(MatchesUseCases(repository)),
      act: (cubit) => cubit.getAreas(),
      expect: () => const <CompetitionState>[
        CompetitionState(dataStates: DataStates.loading),
        CompetitionState(dataStates: DataStates.success),
      ],
    );
  });
}
