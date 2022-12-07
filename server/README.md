# Pickles Tech

### _A brief summary over the Pickles' technologies_

## Tech Stacks

- [Flutter](https://flutter.dev/) - Open source framework by Google for building beautiful, natively compiled, multi-platform applications
- [GetX](https://pub.dev/packages/get) - High-performance state management, intelligent dependency injection, and route management for Flutter
- [node.js](http://nodejs.org/) - Server environement
- [Express](http://expressjs.com/) - Fast node.js network app framework
- [Firebase](https://firebase.google.com/) - NoSQL and real-time hosting of databases, this project utilize the [Firebase Authentication](https://firebase.google.com/docs/auth) and [Firestore Database](https://firebase.google.com/docs/firestore)

## External APIs

- [BarcodeSpider.com](https://www.barcodespider.com/) - UPC code lookup database

## Notable Dependencies

- [Google's ML Kit for Flutter](https://pub.dev/packages/google_ml_kit) - Flutter dependency used to extract product code from receipt
- [mobile_scanner](https://pub.dev/packages/mobile_scanner) - Flutter dependency used to detect barcode

## Environmnet Version

### Flutter

```sh
flutter --version
```

> Flutter 3.6.0-1.0.pre.30 • channel master • https://github.com/flutter/flutter.git
> Framework • revision 6e89042d9b (4 weeks ago) • 2022-11-10 21:58:00 -0500
> Engine • revision 0721c860e2
> Tools • Dart 2.19.0 (build 2.19.0-383.0.dev) • DevTools 2.19.0

### Dart

```sh
dart --version
```

> Dart SDK version: 2.19.0-383.0.dev (dev) (Wed Nov 9 09:36:39 2022 -0800) on "windows_x64"

### Nodejs

```sh
node --version
```

> v16.16.0

### Android Emulator

> Google Pixel 4 API 30

## Installation

Install the dependencies for frontend and server environment , start the server, then build the app.

```sh
git clone https://github.com/muhammadegaa/minang-cuisine.git
flutter pub get
cd server
npm install
cd ..
flutter run ##Execute when Android Emulator is running
```

## Rest APIs

Please see our [Postman API Documentation](https://www.postman.com/grey-firefly-314014/workspace/minang-cuisine/api/0054eb98-c6c1-4520-a1db-15a7b0cc2943) to see full implementation, including the request and response body.
