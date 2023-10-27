import 'package:bloc_test/bloc_test.dart';
import 'package:deliveristo_challenge/dogo/cubit/dogos_cubit.dart';
import 'package:dogos_repository/dogos_repository.dart' as dogo_repo;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDogoRepository extends Mock implements dogo_repo.DogoRepository {}

class MockDogosList extends Mock implements dogo_repo.DogosList {}

const fakeUrls = [
  'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg',
  'https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg',
];
const fakeDogoStatus = 'success';
const fakeBreed = 'hound';
const fakeSubBreed = 'afghan';
void main() {
  group('DogosCubit', () {
    late dogo_repo.DogoRepository repo;
    late dogo_repo.DogosList dogos;
    late DogosCubit cubit;

    setUp(() {
      repo = MockDogoRepository();
      dogos = MockDogosList();
      when(() => dogos.urls).thenReturn(fakeUrls);
      when(() => dogos.status).thenReturn(fakeDogoStatus);
      when(() => repo.getDogosByBreed(fakeBreed))
          .thenAnswer((_) async => dogos);
      when(() => repo.getDogosByBreedAndSubBreed(
          breed: fakeBreed,
          subBreed: fakeSubBreed)).thenAnswer((_) async => dogos);
      cubit = DogosCubit(repo);
    });
    test('initial state is DogosInitial', () {
      expect(
          DogosCubit(dogo_repo.DogoRepository()).state, const DogosInitial());
    });
    group('get dogos', () {
      blocTest<DogosCubit, DogosState>('gets dogos by breed',
          build: () => cubit,
          act: (cubit) async => await cubit.getDogos(breed: fakeBreed),
          expect: () => [const DogosLoading(), DogosSuccess(dogos: dogos)]);

      blocTest<DogosCubit, DogosState>('gets dogos by sub breed',
          build: () => cubit,
          act: (cubit) async =>
              await cubit.getDogos(breed: fakeBreed, subBreed: fakeSubBreed),
          expect: () => [const DogosLoading(), DogosSuccess(dogos: dogos)]);
    });
  });
}
