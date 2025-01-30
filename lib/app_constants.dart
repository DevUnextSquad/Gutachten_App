import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';

// Eine abstrakte Klasse, die als Container für App-weite Konstanten dient.
abstract class FFAppConstants {
  // Eine konstante URL für Bilder, die möglicherweise auf einem Admin-Portal gehostet sind.
  static const String imageUrl =
      'https://unext-093c7f7b34c2.herokuapp.com/images/';  // Link zum Admin-Portal

  // Eine API-Schlüssel-Konstante, vermutlich für Firebase oder eine andere API-Authentifizierung.
  static const String apiKey = 'AIzaSyBvecUP300B0DvdGnGZA6BKUQwez2E44O8';

  // Die App-ID, wahrscheinlich für Firebase-Authentifizierung und Identifikation der App.
  static const String appId = '1:463819102155:web:295edc1857bab5b4ba884e';

  // Die Sender-ID für Firebase Cloud Messaging (FCM), die für das Senden von Push-Benachrichtigungen verwendet wird.
  static const String messagingSenderId = '463819102155';

  // Die Projekt-ID in Firebase, die das spezifische Firebase-Projekt identifiziert.
  static const String projectId = 'carwashapp-4b688';
}

