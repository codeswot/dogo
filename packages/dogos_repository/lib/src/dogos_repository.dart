import 'package:dogo_api/dogo_api.dart';
import 'package:dogos_repository/dogos_repository.dart';

class DogoRepository {
  final DogosApi _dogosApi;

  DogoRepository({DogosApi? dogosApi}) : _dogosApi = dogosApi ?? DogosApi();

  Future<Dogo> _fetchDogoFromApi(
      Future<DogoRandomImageModel> Function() apiCall) async {
    try {
      final dogoResponse = await apiCall();
      return Dogo(
        url: dogoResponse.message,
        status: dogoResponse.status,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Dogo> getRandomDogo() async {
    return _fetchDogoFromApi(() => _dogosApi.getRandomImage());
  }

  Future<Dogo> getRandomDogoByBreed(String breed) async {
    return _fetchDogoFromApi(() => _dogosApi.getRandomImageByBreed(breed));
  }

  Future<Dogo> getRandomDogoByBreedAndSubBreed({
    required String breed,
    required String subBreed,
  }) async {
    return _fetchDogoFromApi(
        () => _dogosApi.getRandomImageBySubBreed(breed, subBreed));
  }

  Future<DogosList> _fetchDogoImageListFromApi(
      Future<DogoImagesModel> Function() apiCall) async {
    try {
      final dogosResponse = await apiCall();
      return DogosList(
        urls: dogosResponse.message,
        status: dogosResponse.status,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<DogosList> getDogosByBreed(String breed) async {
    return _fetchDogoImageListFromApi(() => _dogosApi.getImagesByBreed(breed));
  }

  Future<DogosList> getDogosByBreedAndSubBreed({
    required String breed,
    required String subBreed,
  }) async {
    return _fetchDogoImageListFromApi(
        () => _dogosApi.getImagesBySubBreed(breed, subBreed));
  }

  Future<DogoBreedList> _fetchBreedListFromApi(
      Future<DogosBreedModel> Function() apiCall) async {
    try {
      final breedsResponse = await apiCall();
      return DogoBreedList(
        breeds: breedsResponse.message.keys.toList(),
        status: breedsResponse.status,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<DogoBreedList> getBreeds() async {
    return _fetchBreedListFromApi(() => _dogosApi.getBreeds());
  }

  Future<DogoSubBreedList> getSubBreedsByBreed(String breed) async {
    try {
      final subBreedsResponse = await _dogosApi.getSubBreeds(breed);
      return DogoSubBreedList(
        subBreeds: subBreedsResponse.message,
        status: subBreedsResponse.status,
      );
    } catch (e) {
      rethrow;
    }
  }
}
