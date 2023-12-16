# Flutter News App

![Flutter News App](banner.png)

## Overview

This Flutter News App is a project designed to showcase best practices in Flutter development,
incorporating Clean Architecture, BLoC state management, dependency injection with Get_it, local
database storage using Floor, and network calls with Retrofit. The app fetches real-time news data
from a public API, providing users with a seamless and responsive news browsing experience.

## Features

- **Clean Architecture:** Separation of concerns for maintainability and scalability.
- **BLoC State Management:** Efficiently manage and update the UI state.
- **Firebase:** Authentication of users using Firebase Auth and Firebase Storage.
- **Google Sign-In:** Users can sign in with their google account.
- **Dependency Injection:** Utilize Get_it for dependency injection to enhance code organization.
- **Local Database:** Employ Floor for local data storage, ensuring offline access to previously
  fetched news.
- **Network Calls:** Use Retrofit to make efficient and structured API calls.
- **Deep Linking:** Deep linking is a mechanism that allows direct navigation to specific content
  within a mobile application, facilitating seamless access to specific screens or actions via URLs
  or URIs.

## Setup

1. **Clone the repository:**
   ```bash
   https://github.com/manirahmanzadeh/news.git

2. **Install dependencies:**
    ```bash
   flutter pub get

3. **Run the app:**
   ```bash
   flutter run

## Configuration

To successfully run the Flutter News App, you need to configure your API key. Follow the steps below
to set up the configuration:

### 1. Acquire API Key

Obtain an API key from your preferred news API provider.

### 2. Update [Configuration Files](lib/src/core/constants/constants.dart)

## Dependencies

The Flutter News App utilizes the following dependencies:

### [Bloc](https://pub.dev/packages/flutter_bloc)

[Bloc](https://pub.dev/packages/flutter_bloc) is a predictable state management library that helps
to manage the state of the application in a clear and organized way.

### [Firebase Core](https://pub.dev/packages/firebase_core)

[Firebase Core](https://pub.dev/packages/firebase_core) is a Flutter plugin to use the Firebase Core
API, which enables connecting to multiple Firebase apps.

### [Firebase Auth](https://pub.dev/packages/firebase_auth)

[Firebase Auth](https://pub.dev/packages/firebase_auth) is a Flutter plugin to use the Firebase
Authentication API.

### [Firebase Storage](https://pub.dev/packages/firebase_storage)

[Firebase Storage](https://pub.dev/packages/firebase_storage) is a Flutter plugin to use the
Firebase Cloud Storage API.

### [Get_it](https://pub.dev/packages/get_it)

[Get_it](https://pub.dev/packages/get_it) is a simple service locator for dependency injection. It
enhances code organization and provides a clean way to manage dependencies.

### [Floor](https://pub.dev/packages/floor)

[Floor](https://pub.dev/packages/floor) is a persistence library for Flutter and Dart that wraps
SQLite. It facilitates local data storage, ensuring offline access to previously fetched news.

### [Retrofit](https://pub.dev/packages/retrofit)

[Retrofit](https://pub.dev/packages/retrofit) is a type-safe HTTP client for Dart. It enables
structured and efficient API calls.

### [Google Sign In](https://pub.dev/packages/google_sign_in)

[Google Sign In](https://pub.dev/packages/google_sign_in)  provides a convenient and streamlined
solution for integrating Google Sign-In functionality into Flutter applications.

### [Image Picker](https://pub.dev/packages/image_picker)

[Image Picker](https://pub.dev/packages/image_picker)  facilitates seamless image selection from the
device's gallery or camera, enhancing user interactions with image-related functionalities in the
app.

### [Uni Links](https://pub.dev/packages/uni_links)

[Uni Links](https://pub.dev/packages/uni_links)  enables deep linking and URI handling, allowing
seamless integration of universal links and custom URI schemes for navigation and data sharing
within the application.

## Contributing

Contributions to the Flutter News App are welcome!

