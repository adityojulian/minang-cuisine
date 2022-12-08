# Pickles

![alt text](https://www.rapyd.net/wp-content/uploads/2019/10/Screen-Shot-2020-05-27-at-9.23.21-AM.png)

Pickles is a solution by to solve problems of waste and supply chain management in one simple app by utilising Rapyd APIs for every transactions. This project is used for Rapyd Hackathon.

## How it works?

1. Scan single or bulk product from product barcode, or shopping receipt
2. Add recycleable items to your inventory
3. Recycle the items to produce points and money and ulitmately make impacts by contributing to sustainable projects

# Pickles Tech

### _A brief summary over the Pickles' technologies_

## Tech Stacks

- [Flutter](https://flutter.dev/) - Open source framework by Google for building beautiful, natively compiled, multi-platform applications
- [GetX](https://pub.dev/packages/get) - High-performance state management, intelligent dependency injection, and route management for Flutter
- [node.js](http://nodejs.org/) - Server environement
- [Express](http://expressjs.com/) - Fast node.js network app framework
- [Firebase](https://firebase.google.com/) - NoSQL and real-time hosting of databases, this project utilize the [Firebase Authentication](https://firebase.google.com/docs/auth) and [Firestore Database](https://firebase.google.com/docs/firestore)

## Rapyd API

List of [Rapyd APIs](https://docs.rapyd.net/build-with-rapyd/docs) utilized in this project

| Rapyd API      | Official Documentation                                                                                                                                                                                                                                                                          | Use Case                                                                                                                                                      |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Rapyd Disburse | [Rapyd Create Payout](https://docs.rapyd.net/build-with-rapyd/reference/payout#create-payout), [Rapyd List Payout](https://docs.rapyd.net/build-with-rapyd/reference/payout#list-payouts)                                                                                                       | Transaction from users' wallet to outside Bank. This is used to pay donation, bank transfer to personal bank account.                                         |
| Rapyd Wallet   | [Rapyd Create Wallet](https://docs.rapyd.net/build-with-rapyd/reference/wallet#create-wallet), [Rapyd Update Wallet](https://docs.rapyd.net/build-with-rapyd/reference/wallet#update-wallet), [Rapyd Retrieve Wallet](https://docs.rapyd.net/build-with-rapyd/reference/wallet#retrieve-wallet) | Interact with users' wallet. This is used to create wallet when signing-up, convert or redeem points into money via wallet transfer between Pickles and user. |

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
git clone https://github.com/muhammadegaa/pickles.git
flutter pub get
cd server
npm install
node server.js
cd ..
flutter run ##Execute when Android Emulator is running
```

## Rest APIs

Please see our [Postman API Documentation](https://www.postman.com/grey-firefly-314014/workspace/minang-cuisine/api/0054eb98-c6c1-4520-a1db-15a7b0cc2943) to see full implementation, including the request and response body.
