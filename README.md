# Flutter News App

## Overview

This Flutter News App is a project designed to showcase best practices in Flutter development, incorporating Clean Architecture, BLoC state management, dependency injection with Get_it, local database storage using Floor, and network calls with Retrofit. The app fetches real-time news data from a public API, providing users with a seamless and responsive news browsing experience.

## Features

- **Clean Architecture:** Separation of concerns for maintainability and scalability.
- **BLoC State Management:** Efficiently manage and update the UI state.
- **Dependency Injection:** Utilize Get_it for dependency injection to enhance code organization.
- **Local Database:** Employ Floor for local data storage, ensuring offline access to previously fetched news.
- **Network Calls:** Use Retrofit to make efficient and structured API calls.

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

To successfully run the Flutter News App, you need to configure your API key. Follow the steps below to set up the configuration:

### 1. Acquire API Key

Obtain an API key from your preferred news API provider.

### 2. Update [Configuration Files](lib/src/core/constants/constants.dart)

## Dependencies

The Flutter News App utilizes the following dependencies:

### [Bloc](https://pub.dev/packages/flutter_bloc)

[Bloc](https://pub.dev/packages/flutter_bloc) is a predictable state management library that helps to manage the state of the application in a clear and organized way.

### [Get_it](https://pub.dev/packages/get_it)

[Get_it](https://pub.dev/packages/get_it) is a simple service locator for dependency injection. It enhances code organization and provides a clean way to manage dependencies.

### [Floor](https://pub.dev/packages/floor)

[Floor](https://pub.dev/packages/floor) is a persistence library for Flutter and Dart that wraps SQLite. It facilitates local data storage, ensuring offline access to previously fetched news.

### [Retrofit](https://pub.dev/packages/retrofit)

[Retrofit](https://pub.dev/packages/retrofit) is a type-safe HTTP client for Dart. It enables structured and efficient API calls.

## Contributing

Contributions to the Flutter News App are welcome!

