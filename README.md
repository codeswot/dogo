
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
    `cd dogo`     
3.  Install the required dependencies:
    `flutter pub get`     
4.  Launch the app:
    `flutter run`
   

The app should now be up and running on your device or emulator.

<img src="https://github.com/codeswot/dogo/blob/main/assets/dogo.gif" alt="home" width="200"/>

## Getting Started

To get started with the DogoApp, follow these steps:

### Home (random dogo)

1.  Launch the app on your device or emulator.
    
2.  You will be presented with the main screen, which displays a random dog image.
    
3.  Explore the app's features using the navigation options provided.
            

### Select a Dog Breed

1.  Launch the app.
    
2.  Tap on the "Dogo Breed" Tile.
    
3.  Select a dog breed from the list.
    
4.  Home page will refresh with the selected breed
    

### View Sub-Breeds

1.  Launch the app.
    
2.  Tap on the "Dogo Sub Breed" Tile.
    
3.  Select a dog breed from the list.

4. Select a dog subbreed from the next list.
    
5.  The home page will refresh with selected breed, sub-breed
    

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
4. Select a dog subbreed for the selected breed from the list.
    
5.  Browse through the collection of dog images.

## Test
to run the test simply run
```flutter test```


## Tools used
- flutter_bloc (statemanagment)
- json_serializable (serialise data)
- mocktail (mock dog api)

## Resources
for this app i utelised a decouple aproach to seperarte the api logic as a pacage of its own, the docs are bellow
1. [Dogo API reference](https://github.com/codeswot/dogo/tree/main/packages/dogo_api)
2. [Dogo Repository reference](https://github.com/codeswot/dogo/tree/main/packages/dogos_repository)
