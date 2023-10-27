import 'package:bloc_test/bloc_test.dart';
import 'package:deliveristo_challenge/dogo_sub_breed/cubit/dogo_sub_breed_cubit.dart';
import 'package:dogos_repository/dogos_repository.dart' as dogo_repo;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDogoRepository extends Mock implements dogo_repo.DogoRepository {}

class MockDogoSubBreedList extends Mock implements dogo_repo.DogoSubBreedList {}

void main() {
  group(
    'DogoSubBreedCubit',
    () {
      late dogo_repo.DogoRepository repo;
      late dogo_repo.DogoSubBreedList dogoSubBreedList;
      late DogoSubBreedCubit cubit;

      setUp(() {
        repo = MockDogoRepository();
        dogoSubBreedList = MockDogoSubBreedList();
        when(() => repo.getSubBreedsByBreed('hound')).thenAnswer(
          (_) async => dogoSubBreedList,
        );
        cubit = DogoSubBreedCubit(repo);
      });
      test(
        'initial state is DogoSubBreedInitial',
        () {
          expect(
            DogoSubBreedCubit(dogo_repo.DogoRepository()).state,
            const DogoSubBreedInitial(),
          );
        },
      );
      group(
        'get dogo sub breed list',
        () {
          blocTest<DogoSubBreedCubit, DogoSubBreedState>(
            'gets dogo sub breed list',
            build: () => cubit,
            act: (cubit) async => await cubit.getDogoSubBreed('hound'),
            expect: () => [
              const DogoSubBreedLoading(),
              DogoSubBreedSuccess(dogoSubBreed: dogoSubBreedList)
            ],
          );
        },
      );
    },
  );
}
