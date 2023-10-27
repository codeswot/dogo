import 'package:dogos_repository/src/dogos_repository.dart';
import 'package:dogos_repository/src/models/models.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dogo_api/dogo_api.dart' as dogo_api;
import 'package:test/test.dart';

class MockDogoApi extends Mock implements dogo_api.DogosApi {}

void main() {
  group(
    'DogoRepository',
    () {
      late dogo_api.DogosApi dogosApi;
      late DogoRepository dogoRepository;
      setUp(() {
        dogosApi = MockDogoApi();
        dogoRepository = DogoRepository(
          dogosApi: dogosApi,
        );
      });
      group('constructor', () {
        test('instantiates dogos api client when not injected', () {
          expect(DogoRepository(), isNotNull);
        });
      });
      test('[Random image]', () async {
        final response = dogo_api.DogoRandomImageModel(
          message:
              'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg',
          status: 'success',
        );
        when(() => dogosApi.getRandomImage()).thenAnswer((_) async => response);
        final dogo = await dogoRepository.getRandomDogo();
        expect(dogo, isA<Dogo>());
        expect(dogo.url, response.message);
        expect(dogo.status, response.status);
      });
      test('[Random image by breed]', () async {
        final response = dogo_api.DogoRandomImageModel(
          message:
              'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg',
          status: 'success',
        );
        when(() => dogosApi.getRandomImageByBreed('terrier'))
            .thenAnswer((_) async => response);

        final dogo = await dogoRepository.getRandomDogoByBreed('terrier');
        expect(dogo, isA<Dogo>());
        expect(dogo.url, response.message);
        expect(dogo.status, response.status);
      });
      test('Random image by breed and sub breed]', () async {
        final response = dogo_api.DogoRandomImageModel(
          message:
              'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg',
          status: 'success',
        );
        when(() => dogosApi.getRandomImageBySubBreed('terrier', 'norwich'))
            .thenAnswer((_) async => response);

        final dogo = await dogoRepository.getRandomDogoByBreedAndSubBreed(
          breed: 'terrier',
          subBreed: 'norwich',
        );
        expect(dogo, isA<Dogo>());
        expect(dogo.url, response.message);
        expect(dogo.status, response.status);
      });
      test('[Images list by breed]', () async {
        final response = dogo_api.DogoImagesModel(
          message: [
            'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg',
            'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg',
            'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg',
          ],
          status: 'success',
        );
        when(() => dogosApi.getImagesByBreed('terrier'))
            .thenAnswer((_) async => response);

        final dogos = await dogoRepository.getDogosByBreed('terrier');
        expect(dogos, isA<DogosList>());
        expect(dogos.urls, response.message);
        expect(dogos.status, response.status);
      });
      test('[Images list by breed and sub breed]', () async {
        final response = dogo_api.DogoImagesModel(
          message: [
            'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg',
            'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg',
            'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg',
          ],
          status: 'success',
        );
        when(() => dogosApi.getImagesBySubBreed('terrier', 'norwich'))
            .thenAnswer((_) async => response);

        final dogos = await dogoRepository.getDogosByBreedAndSubBreed(
          breed: 'terrier',
          subBreed: 'norwich',
        );
        expect(dogos, isA<DogosList>());
        expect(dogos.urls, response.message);
        expect(dogos.status, response.status);
      });
    },
  );
}
