# Dogo Api (Package) 🐾

###  [Deliveristo Flutter Frontend Coding Challenge](https://github.com/andreaperinu/flutter-challenge#deliveristo-flutter-frontend-coding-challenge) 

A Dart library for interacting with the Dogo API to retrieve random dog images, dog breeds, sub-breeds, and more.

## Table of Contents

- [Usage](#usage)
- [Features](#features)
- [Installation](#installation)
- [Examples](#examples)
- [API Reference](#api-reference)
- [Running Test](#running-test)


## Usage

The Dogo API Client provides a convenient way to interact with the Dogo API and fetch various data related to dogs, including random dog images, dog breeds, sub-breeds, and more.

## Features

- Retrieve random dog images.
- Get a list of dog breeds.
- Get a list of sub-breeds for a specific breed.
- Fetch random dog images by breed.
- Fetch random dog images by sub-breed.
- Get all images of dogos by breed.
- Get all images of dogos by sub-breed.

## Installation

This api code is included in the main app through the (repositoy package) path => packages/dogos_repository/pubspec.yaml
however this api code can work independently and be published to a repository

```yaml
dependencies:
  dogo_api: 
	path:  ../dogo_api

```
## Examples

```dart import 'package:dogo_api_client/dogo_api_client.dart';

void main() {
  final dogoApi = DogoApi();

  // Retrieve a random dog image
  dogoApi.getRandomImage().then((randomImage) {
    print('Random Dog Image URL: ${randomImage.message}');
  });

  // Fetch a list of dog breeds
  dogoApi.getBreeds().then((breeds) {
    print('Dog Breeds: ${breeds.message}');
  });
}
 ```

## API Reference

-   `DogoApi` class: The main API client for interacting with the Dogo API.
-   `DogoRandomImageModel`: Represents a model for a random dog image response.
-   `DogosBreedModel`: Represents a model for a list of dog breeds response.
-   `DogosSubBreedModel`: Represents a model for a list of sub-breeds response.
-   `DogoImagesModel`: Represents a model for a list of dog images response.
-   `DogoApiFailure`: Exception thrown when there is an error from the server.

## Running Test
This will run all the test in the api and run a code coverage
  ```flutter test --coverage
    genhtml coverage/lcov.info -o coverage
    open coverage/index.html```
