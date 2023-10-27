import 'package:bloc_test/bloc_test.dart';
import 'package:deliveristo_challenge/dogo/cubit/dogo_cubit.dart';
import 'package:dogos_repository/dogos_repository.dart' as dogo_repo;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDogoRepository extends Mock implements dogo_repo.DogoRepository {}

class MockDogo extends Mock implements dogo_repo.Dogo {}

const fakeDogoUrl =
    'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg';
const fakeDogoStatus = 'success';
const fakeBreed = 'hound';
const fakeSubBreed = 'afghan';

void main() {
  group('DogoCubit', () {
    late dogo_repo.DogoRepository repo;
    late dogo_repo.Dogo dogo;
    late DogoCubit cubit;

    setUp(() {
      repo = MockDogoRepository();
      dogo = MockDogo();
      when(() => dogo.url).thenReturn(fakeDogoUrl);
      when(() => dogo.status).thenReturn(fakeDogoStatus);
      when(() => repo.getRandomDogo()).thenAnswer((_) async => dogo);
      when(() => repo.getRandomDogoByBreed(fakeBreed))
          .thenAnswer((_) async => dogo);
      when(() => repo.getRandomDogoByBreedAndSubBreed(
          breed: fakeBreed,
          subBreed: fakeSubBreed)).thenAnswer((_) async => dogo);
      cubit = DogoCubit(repo);
    });
    test('initial state is DogoInitial', () {
      expect(DogoCubit(dogo_repo.DogoRepository()).state, const DogoInitial());
    });
    group('get dogo', () {
      //
      blocTest<DogoCubit, DogoState>('gets random dogo',
          build: () => cubit,
          act: (cubit) async => await cubit.getDogo(),
          expect: () => [const DogoLoading(), DogoSuccess(dogo: dogo)]);
      blocTest<DogoCubit, DogoState>('gets dogo by breed',
          build: () => cubit,
          act: (cubit) async => await cubit.getDogo(breed: fakeBreed),
          expect: () => [const DogoLoading(), DogoSuccess(dogo: dogo)]);

      blocTest<DogoCubit, DogoState>('gets dogo by sub breed',
          build: () => cubit,
          act: (cubit) async =>
              await cubit.getDogo(breed: fakeBreed, subBreed: fakeSubBreed),
          expect: () => [const DogoLoading(), DogoSuccess(dogo: dogo)]);
      // // handle failed test logic
      // blocTest<DogoCubit, DogoState>('handles failed dogo request',
      //     build: () {
      //       when(() => repo.getRandomDogo()).thenThrow(Exception('oops'));
      //       return cubit;
      //     },
      //     act: (cubit) async => await cubit.getDogo(),
      //     expect: () => [const DogoLoading(), const DogoFailure()]);
    });
  });
}
