<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package manages firebase authentication.

## Features

- Sign In with email and password
- Sign out
- Send password reset email
- Create user with email and password
- Get stream of authentication changes


## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

```dart
await FirebaseAuthRepo().signInWithEmailAndPassword(email:myemail, password:mypassword);
```
