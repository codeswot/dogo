
# Dogo Repository (Package) 🐾
The `DogoRepository` is a Dart class that acts as an intermediary between the Dogo API and your application. It provides methods to fetch dog images and related data from the `DogosApi` .

## Table of Contents

- [Overview](#overview)
- [Instalation](#instalation)
- [API Methods](#api-methods)
- [Examples](#examples)



## Overview

The `DogoRepository` class encapsulates the logic for interacting with the Dogo API, which provides access to random dog images, lists of dog breeds, sub-breeds, and more. It uses the `DogosApi` class from the `dogos_api` package to make API requests and handle responses.

## Installation

  

This repository code is included in the main app => /pubspec.yaml
however it can work independently and be published to a repository

 
```yaml
dependencies:
dogos_repository:
path:  ./packages/dogos_repository
```

## API Methods

### Fetching Random Dog Images

- `getRandomDogo()`: Retrieves a random dog image.
- `getRandomDogoByBreed(String breed)`: Retrieves a random dog image by specifying a breed.
- `getRandomDogoByBreedAndSubBreed(String breed, String subBreed)`: Retrieves a random dog image by specifying both a breed and a sub-breed.

### Fetching Lists of Dog Images

- `getDogosByBreed(String breed)`: Fetches a list of dog images by specifying a breed.
- `getDogosByBreedAndSubBreed(String breed, String subBreed)`: Fetches a list of dog images by specifying both a breed and a sub-breed.

### Fetching Lists of Dog Breeds

- `getBreeds()`: Fetches a list of all dog breeds.
- `getSubBreedsByBreed(String breed)`: Fetches a list of sub-breeds for a specific breed.

## Examples

To use the `DogoRepository` in your Dart project, create an instance of the class and use its methods to interact with the Dogo API.

```dart
import 'package:dogo_api/dogo_api.dart';
import 'package:dogos_repository/dogos_repository.dart';

void main() {
  final dogoRepository = DogoRepository();

  // Retrieve a random dog image
  dogoRepository.getRandomDogo().then((dogo) {
    print('Random Dog Image URL: ${dogo.url}');
  });

  // Fetch a list of dog breeds
  dogoRepository.getBreeds().then((breeds) {
    print('Dog Breeds: ${breeds.breeds}');
  });
}
