import 'dart:convert';
import 'model/model.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when error from server.
class DogoApiFailure implements Exception {
  // const DogoApiFailure();
}

/// Dogo API client
class DogosApi {
  /// {@macro dogo_api_client}

  final http.Client _client;

  DogosApi({http.Client? client}) : _client = client ?? http.Client();

  final _baseUrl = 'https://dog.ceo/api';

  /// Finds random image of dogo => [DogoRandomImageModel] with message as image url
  Future<DogoRandomImageModel> getRandomImage() async {
    final response =
        await _client.get(Uri.parse('$_baseUrl/breeds/image/random'));
    if (response.statusCode == 200) {
      return DogoRandomImageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load image');
    }
  }

  /// Finds all dogos breeds => [DogosBreedModel] with message as list of breeds
  Future<DogosBreedModel> getBreeds() async {
    final response = await _client.get(Uri.parse('$_baseUrl/breeds/list/all'));
    if (response.statusCode == 200) {
      return DogosBreedModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  /// Finds all dogos sub breeds => [DogosSubBreedModel] with message as list of sub breeds
  Future<DogosSubBreedModel> getSubBreeds(String breed) async {
    final response =
        await _client.get(Uri.parse('$_baseUrl/breed/$breed/list'));
    if (response.statusCode == 200) {
      return DogosSubBreedModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load sub breeds');
    }
  }

  /// Finds random image of dogo by breed => [DogoRandomImageModel] with message as image url
  Future<DogoRandomImageModel> getRandomImageByBreed(String breed) async {
    final response =
        await _client.get(Uri.parse('$_baseUrl/breed/$breed/images/random'));
    if (response.statusCode == 200) {
      return DogoRandomImageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load image');
    }
  }

  /// Finds random image of dogo by sub breed => [DogoRandomImageModel] with message as image url
  Future<DogoRandomImageModel> getRandomImageBySubBreed(
      String breed, String subBreed) async {
    final response = await _client
        .get(Uri.parse('$_baseUrl/breed/$breed/$subBreed/images/random'));
    if (response.statusCode == 200) {
      return DogoRandomImageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load image');
    }
  }

  /// Finds all images of dogo by breed => [DogoImagesModel] with message as list of image urls
  Future<DogoImagesModel> getImagesByBreed(String breed) async {
    final response =
        await _client.get(Uri.parse('$_baseUrl/breed/$breed/images'));
    if (response.statusCode == 200) {
      return DogoImagesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load images');
    }
  }

  /// Finds all images of dogo by sub breed => [DogoImagesModel] with message as list of image urls
  Future<DogoImagesModel> getImagesBySubBreed(
      String breed, String subBreed) async {
    final response =
        await _client.get(Uri.parse('$_baseUrl/breed/$breed/$subBreed/images'));
    if (response.statusCode == 200) {
      return DogoImagesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load images');
    }
  }
}
