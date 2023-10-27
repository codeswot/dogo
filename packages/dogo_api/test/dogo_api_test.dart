import 'package:dogo_api/src/src.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('DogosApi', () {
    late http.Client httpClient;
    late DogosApi dogosApiClient;
    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(
      () {
        httpClient = MockHttpClient();
        dogosApiClient = DogosApi(client: httpClient);
      },
    );
    group('constructor', () {
      test('does not require an httpClient', () {
        expect(DogosApi(), isNotNull);
      });
    });

    group('RandomDogoImage', () {
      test(
        'makes correct http request',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(200);
          when(() => res.body).thenReturn(
            '{"message":"https://images.dog.ceo/breeds/akita/Akita_hiking_in_Shpella_e_Pellumbasit.jpg","status": "success"}',
          );
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          try {
            await dogosApiClient.getRandomImage();
            verify(
              () => httpClient.get(
                Uri.parse('https://dog.ceo/api/breeds/image/random'),
              ),
            ).called(1);
          } catch (_) {}
        },
      );
      test(
        'throws Exception when http request fails',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(400);
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          expect(
            () async => await dogosApiClient.getRandomImage(),
            throwsA(isA<Exception>()),
          );
        },
      );
      test('returns random dogo image', () async {
        final res = MockResponse();
        when(() => res.statusCode).thenReturn(200);
        when(() => res.body).thenReturn(
          '{"message":"https://images.dog.ceo/breeds/akita/Akita_hiking_in_Shpella_e_Pellumbasit.jpg","status": "success"}',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => res);

        final result = await dogosApiClient.getRandomImage();

        expect(
          result,
          isA<DogoRandomImageModel>()
              .having((w) => w.message, 'Image url',
                  'https://images.dog.ceo/breeds/akita/Akita_hiking_in_Shpella_e_Pellumbasit.jpg')
              .having((w) => w.status, 'Status', 'success'),
        );
      });
    });
    group('DogoBreedList', () {
      test(
        'makes correct http request',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(200);
          when(() => res.body).thenReturn(
            '{"message":{"akita":[],"appenzeller":[],"australian":["shepherd"],"hound":["afghan","basset","blood","english","ibizan","plott","walker"]},"status":"success"}',
          );
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          try {
            await dogosApiClient.getBreeds();
            verify(
              () => httpClient.get(
                Uri.parse('https://dog.ceo/api/breeds/list/all'),
              ),
            ).called(1);
          } catch (_) {}
        },
      );
      test(
        'throws Exception when http request fails',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(400);
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          expect(
            () async => await dogosApiClient.getBreeds(),
            throwsA(isA<Exception>()),
          );
        },
      );
      test('returns dogo breeds', () async {
        final res = MockResponse();
        when(() => res.statusCode).thenReturn(200);
        when(() => res.body).thenReturn(
          '{"message":{"akita":[],"appenzeller":[],"australian":["shepherd"],"hound":["afghan","basset","blood","english","ibizan","plott","walker"]},"status":"success"}',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => res);

        final result = await dogosApiClient.getBreeds();

        expect(
          result,
          isA<DogosBreedModel>().having((w) => w.message, 'Breed list', {
            'akita': [],
            'appenzeller': [],
            'australian': ['shepherd'],
            'hound': [
              'afghan',
              'basset',
              'blood',
              'english',
              'ibizan',
              'plott',
              'walker'
            ],
          }).having((w) => w.status, 'Status', 'success'),
        );
      });
    });

    group('DogoSubBreedList', () {
      test(
        'makes correct http request',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(200);
          when(() => res.body).thenReturn(
            '{"message":["afghan","basset","blood","english","ibizan","plott","walker"],"status":"success"}',
          );
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          try {
            await dogosApiClient.getSubBreeds('hound');
            verify(
              () => httpClient.get(
                Uri.parse('https://dog.ceo/api/breed/hound/list'),
              ),
            ).called(1);
          } catch (_) {}
        },
      );
      test(
        'throws Exception when http request fails',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(400);
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          expect(
            () async => await dogosApiClient.getSubBreeds('hound'),
            throwsA(isA<Exception>()),
          );
        },
      );
      test('returns dogo sub breeds', () async {
        final res = MockResponse();
        when(() => res.statusCode).thenReturn(200);
        when(() => res.body).thenReturn(
          '{"message":["afghan","basset","blood","english","ibizan","plott","walker"],"status":"success"}',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => res);

        final result = await dogosApiClient.getSubBreeds('hound');

        expect(
          result,
          isA<DogosSubBreedModel>().having((w) => w.message, 'Sub Breed list', [
            'afghan',
            'basset',
            'blood',
            'english',
            'ibizan',
            'plott',
            'walker'
          ]).having((w) => w.status, 'Status', 'success'),
        );
      });
    });

    group('RandomDogoImageByBreed', () {
      test(
        'makes correct http request',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(200);
          when(() => res.body).thenReturn(
            '{"message":"https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg","status":"success"}',
          );
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          try {
            await dogosApiClient.getRandomImageByBreed('hound');
            verify(
              () => httpClient.get(
                Uri.parse('https://dog.ceo/api/breed/hound/images/random'),
              ),
            ).called(1);
          } catch (_) {}
        },
      );
      test(
        'throws Exception when http request fails',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(400);
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          expect(
            () async => await dogosApiClient.getRandomImageByBreed('hound'),
            throwsA(isA<Exception>()),
          );
        },
      );
      test('returns random dogo image by breed', () async {
        final res = MockResponse();
        when(() => res.statusCode).thenReturn(200);
        when(() => res.body).thenReturn(
          '{"message":"https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg","status":"success"}',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => res);

        final result = await dogosApiClient.getRandomImageByBreed('hound');

        expect(
          result,
          isA<DogoRandomImageModel>()
              .having((w) => w.message, 'Image url',
                  'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg')
              .having((w) => w.status, 'Status', 'success'),
        );
      });
    });

    group('RandomDogoImageByBreedAndSubBreed', () {
      test(
        'makes correct http request',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(200);
          when(() => res.body).thenReturn(
            '{"message":"https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg","status":"success"}',
          );
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          try {
            await dogosApiClient.getRandomImageBySubBreed('hound', 'afghan');
            verify(
              () => httpClient.get(
                Uri.parse(
                    'https://dog.ceo/api/breed/hound/afghan/images/random'),
              ),
            ).called(1);
          } catch (_) {}
        },
      );
      test(
        'throws Exception when http request fails',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(400);
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          expect(
            () async => await dogosApiClient.getRandomImageBySubBreed(
                'hound', 'afghan'),
            throwsA(isA<Exception>()),
          );
        },
      );
      test('returns random dogo image by breed and sub breed', () async {
        final res = MockResponse();
        when(() => res.statusCode).thenReturn(200);
        when(() => res.body).thenReturn(
          '{"message":"https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg","status":"success"}',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => res);

        final result =
            await dogosApiClient.getRandomImageBySubBreed('hound', 'afghan');

        expect(
          result,
          isA<DogoRandomImageModel>()
              .having((w) => w.message, 'Image url',
                  'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg')
              .having((w) => w.status, 'Status', 'success'),
        );
      });
    });

    group('DogoImagesByBreedList', () {
      test(
        'makes correct http request',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(200);
          when(() => res.body).thenReturn(
            '{"message":["https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg","https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg","https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg"],"status":"success"}',
          );
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          try {
            await dogosApiClient.getImagesByBreed('hound');
            verify(
              () => httpClient.get(
                Uri.parse('https://dog.ceo/api/breed/hound/images'),
              ),
            ).called(1);
          } catch (_) {}
        },
      );
      test(
        'throws Exception when http request fails',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(400);
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          expect(
            () async => await dogosApiClient.getImagesByBreed('hound'),
            throwsA(isA<Exception>()),
          );
        },
      );
      test('returns dogo images by breed', () async {
        final res = MockResponse();
        when(() => res.statusCode).thenReturn(200);
        when(() => res.body).thenReturn(
          '{"message":["https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg","https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg","https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg"],"status":"success"}',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => res);

        final result = await dogosApiClient.getImagesByBreed('hound');

        expect(
            result,
            isA<DogoImagesModel>().having(
              (w) => w.message,
              'Image list',
              [
                'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg',
                'https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg',
                'https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg',
              ],
            ).having((w) => w.status, 'Status', 'success'));
      });
    });

    group('DogoImagesBySubBreedList', () {
      test(
        'makes correct http request',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(200);
          when(() => res.body).thenReturn(
            '{"message":["https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg","https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg","https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg"],"status":"success"}',
          );
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          try {
            await dogosApiClient.getImagesBySubBreed('hound', 'afghan');
            verify(
              () => httpClient.get(
                Uri.parse('https://dog.ceo/api/breed/hound/afghan/images'),
              ),
            ).called(1);
          } catch (_) {}
        },
      );
      test(
        'throws Exception when http request fails',
        () async {
          final res = MockResponse();
          when(() => res.statusCode).thenReturn(400);
          when(() => httpClient.get(any())).thenAnswer((_) async => res);

          expect(
            () async =>
                await dogosApiClient.getImagesBySubBreed('hound', 'afghan'),
            throwsA(isA<Exception>()),
          );
        },
      );
      test('returns dogo images by sub breed', () async {
        final res = MockResponse();
        when(() => res.statusCode).thenReturn(200);
        when(() => res.body).thenReturn(
          '{"message":["https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg","https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg","https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg"],"status":"success"}',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => res);

        final result =
            await dogosApiClient.getImagesBySubBreed('hound', 'afghan');

        expect(
            result,
            isA<DogoImagesModel>().having(
              (w) => w.message,
              'Image list',
              [
                'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg',
                'https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg',
                'https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg',
              ],
            ).having((w) => w.status, 'Status', 'success'));
      });
    });
  });
}
