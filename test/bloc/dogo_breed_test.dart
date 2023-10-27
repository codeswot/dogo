import 'package:bloc_test/bloc_test.dart';
import 'package:deliveristo_challenge/dogo_breed/cubit/dogo_breed_cubit.dart';
import 'package:dogos_repository/dogos_repository.dart' as dogo_repo;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDogoRepository extends Mock implements dogo_repo.DogoRepository {}

class MockDogoBreedList extends Mock implements dogo_repo.DogoBreedList {}

void main() {
  group('DogoBreedCubit', () {
    late dogo_repo.DogoRepository repo;
    late dogo_repo.DogoBreedList dogoBreedList;
    late DogoBreedCubit cubit;

    setUp(() {
      repo = MockDogoRepository();
      dogoBreedList = MockDogoBreedList();
      when(() => repo.getBreeds()).thenAnswer((_) async => dogoBreedList);
      cubit = DogoBreedCubit(repo);
    });
    test('initial state is DogoBreedInitial', () {
      expect(DogoBreedCubit(dogo_repo.DogoRepository()).state,
          const DogoBreedInitial());
    });
    group('get dogo breed list', () {
      blocTest<DogoBreedCubit, DogoBreedState>('gets dogo breed list',
          build: () => cubit,
          act: (cubit) async => await cubit.getDogoBreed(),
          expect: () => [
                const DogoBreedLoading(),
                DogoBreedSuccess(dogoBreed: dogoBreedList)
              ]);
    });
  });
}
