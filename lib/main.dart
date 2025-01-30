// Importiert benutzerdefinierte Aktionen aus dem actions-Verzeichnis
import '/custom_code/actions/index.dart' as actions;
// Importiert das Provider-Paket für State Management
import 'package:provider/provider.dart';
// Importiert grundlegende Flutter-Funktionalitäten
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Importiert Pakete für Mehrsprachigkeit
import 'package:flutter_localizations/flutter_localizations.dart';
// Importiert URL-Strategie für Web
import 'package:flutter_web_plugins/url_strategy.dart';
// Importiert eigene Theme-Einstellungen
import '/flutter_flow/flutter_flow_theme.dart';
// Importiert verschiedene Flutter Flow Hilfsfunktionen
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

// Hauptfunktion der App
void main() async {
  // Initialisiert Flutter-Bindungen
  WidgetsFlutterBinding.ensureInitialized();
  // Konfiguriert GoRouter URL-Verhalten
  GoRouter.optionURLReflectsImperativeAPIs = true;
  // Setzt URL-Strategie für Web
  usePathUrlStrategy();
  
  // Firebase-Initialisierung Hinweise
  // Benötigt für iOS: GoogleService-Info.plist
  // Benötigt für Android: google-services.json
  
  // Start der benutzerdefinierten Initialisierungen
  await actions.connected();          // Prüft Verbindung
  await actions.initStatusBar();      // Initialisiert Statusleiste
  await actions.firebaseInit();       // Initialisiert Firebase
  await actions.notificationPermission(); // Fragt Benachrichtigungserlaubnis
  await actions.notificationInit();   // Initialisiert Benachrichtigungen

  // Initialisiert den App-Zustand
  final appState = FFAppState();
  await appState.initializePersistedState();

  // Startet die App mit Provider für State Management
  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

// Hauptwidget der App
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  // Hilfsmethode um den State überall in der App zu finden
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

// State-Klasse für MyApp
class _MyAppState extends State<MyApp> {
  // Speichert den aktuellen Theme-Modus
  ThemeMode _themeMode = ThemeMode.system;

  // Deklariert wichtige App-Variablen
  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    // Initialisiert App-State und Router
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  // Methode zum sicheren Ändern des Theme-Modus
  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Unext',
      // Konfiguriert Mehrsprachigkeit
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Setzt Deutsch als Standardsprache
      supportedLocales: const [Locale('de', '')],
      // Setzt die Startsprache explizit auf Deutsch
      locale: const Locale('de', ''),
      // Konfiguriert das helle Theme
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      // Setzt den aktiven Theme-Modus
      themeMode: _themeMode,
      // Konfiguriert den Router
      routerConfig: _router,
    );
  }
}