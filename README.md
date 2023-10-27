
# Dogo App 🐾

### [Deliveristo Flutter Frontend Coding Challenge](https://github.com/andreaperinu/flutter-challenge#deliveristo-flutter-frontend-coding-challenge)
**Thank you for giving the oppotunity to work on this challenge, here is explanation on my solution.**

## Table of Contents

-  [Overview](#overview)
-  [Features](#features)
-  [Installation](#installation)
-  [Getting Started](#getting-started)
-  [Test](#test)

## Overview

DogoApp the main app for the challenge user interface built on top of the Dogo API and the `dogos_repository`. It allows users to perform the following actions:

  - View random dog images.
- Select a specific dog breed.
- View a list of sub-breeds for a selected breed.
- View a gallery of dog images based on breed or sub-breed.

  

## Features

  - Retrieve random dog images.
-   Random image by breed
-   Images list by breed (Gallery)
-   Random image by breed and sub breed
-   Images list by breed and sub breed (Gallery)
- Get a list of dog breeds.
- Get a list of sub-breeds for a specific breed.


  

## Installation

  

To use the DogoApp, follow these installation instructions:
1. Clone the repository to your local machine:
```shell
git clone https://github.com/codeswot/dogo.git

cd dogo/
```
2. Install the required dependencies: 
 ```shell
 flutter pub get
  flutter run
  ```


  
Certainly! Here's a template for documenting the main app. Please note that you should tailor the documentation to your specific app, providing details about its functionality and usage.

markdownCopy code

``# DogoApp Documentation

DogoApp is a Dart application that provides a user-friendly interface to interact with the Dogo API and retrieve random dog images, dog breeds, and sub-breeds. This documentation provides an overview of the app's features, installation instructions, and usage examples.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Test](#test)


## Overview

DogoApp is a user interface built on top of the Dogo API and the `dogos_repository`. It allows users to perform the following actions:

- View random dog images.
- Select a specific dog breed.
- View a list of sub-breeds for a selected breed.
- View a gallery of dog images based on breed or sub-breed.

## Features

- Retrieve random dog images.
- Get a list of dog breeds.
- Get a list of sub-breeds for a specific breed.
- View dog images by breed or sub-breed in a gallery.

## Installation

To use the DogoApp, follow these installation instructions:

1. Clone the repository to your local machine:

   ```shell
   git clone https://github.com/your-username/dogo-app.git`` 

2.  Navigate to the project directory:
    
    shellCopy code
    
    `cd dogo-app` 
    
3.  Install the required dependencies:
    
    shellCopy code
    
    `flutter pub get` 
    
4.  Launch the app:
    
    shellCopy code
    
    `flutter run` 
    

The app should now be up and running on your device or emulator.

## Getting Started

To get started with the DogoApp, follow these steps:

### Home (random dogo)

1.  Launch the app on your device or emulator.
    
2.  You will be presented with the main screen, which displays a random dog image.
![Home Page](https://github.com/codeswot/dogo/blob/main/assets/ss_home.png)
    
4.  Explore the app's features using the navigation options provided.
            

### Select a Dog Breed

1.  Launch the app.
    
2.  Tap on the "Dogo Breed" Tile.
    
3.  Select a dog breed from the list.
    
4.  Home page will refresh with selected breed
    

### View Sub-Breeds

1.  Launch the app.
    
2.  Tap on the "Dogo Sub Breed" Tile.
    
3.  Select a dog breed from the list.

4. Select a dog sub breed from the next list.
    
5.  Home page will refresh with selected breed,sub breed
    

### Gallery View (List of Dog images)
#### By Breed

1.  Launch the app.
    
2.  Tap  the "Breed" Tile.
    
3.  Select a dog breed from the list.
    
4.  Browse through the collection of dog images.

#### By Sub Breed

1.  Launch the app.
    
2.  Tap  the "Sub Breed" Tile.
    
3.  Select a dog breed from the list.
4. Select a dog sub breed for the selected breed from the list.
    
5.  Browse through the collection of dog images.

## Test
to run the test simply run
```flutter test```


## Tools used
- flutter_bloc (statemanagment)
- json_serializable (serialise data)
- mocktail (mock dog api)
