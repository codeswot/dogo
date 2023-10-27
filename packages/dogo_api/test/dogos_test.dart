import 'package:dogo_api/src/model/model.dart';
import 'package:test/test.dart';

void main() {
  group('Dogos Model', () {
    group(
      'fromJson',
      () {
        test('returns correct DogoRandomImageModel object', () {
          expect(
            DogoRandomImageModel.fromJson(
              <String, dynamic>{
                'message':
                    'https://images.dog.ceo/breeds/labrador/n02099712_5679.jpg',
                'status': 'success'
              },
            ),
            isA<DogoRandomImageModel>()
                .having((w) => w.message, 'Image url',
                    'https://images.dog.ceo/breeds/labrador/n02099712_5679.jpg')
                .having((w) => w.status, 'Status', 'success'),
          );
        });
        test(
          'returns correct DogosBreedModel object',
          () {
            expect(
              DogosBreedModel.fromJson(
                <String, dynamic>{
                  'message': {
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
                  },
                  'status': 'success',
                },
              ),
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
          },
        );
        test(
          'returns correct DogosSubBreedModel object',
          () {
            expect(
              DogosSubBreedModel.fromJson(
                <String, dynamic>{
                  'message': [
                    'afghan',
                    'basset',
                    'blood',
                    'english',
                    'ibizan',
                    'plott',
                    'walker'
                  ],
                  'status': 'success'
                },
              ),
              isA<DogosSubBreedModel>().having(
                  (w) => w.message, 'Sub breed list', [
                'afghan',
                'basset',
                'blood',
                'english',
                'ibizan',
                'plott',
                'walker'
              ]).having((w) => w.status, 'Status', 'success'),
            );
          },
        );
        test(
          'returns correct DogosImageModel object',
          () {
            expect(
              DogoImagesModel.fromJson(
                <String, dynamic>{
                  'message': [
                    'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg',
                    'https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg',
                    'https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg'
                  ],
                  'status': 'success'
                },
              ),
              isA<DogoImagesModel>().having((w) => w.message, 'Image list', [
                'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg',
                'https://images.dog.ceo/breeds/hound-afghan/n02088094_1007.jpg',
                'https://images.dog.ceo/breeds/hound-afghan/n02088094_1023.jpg'
              ]).having((w) => w.status, 'Status', 'success'),
            );
          },
        );
      
      },
    );
  });
}
