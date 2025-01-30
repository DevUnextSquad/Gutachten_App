import 'package:flutter/material.dart'; // Importiert das Flutter-Material-Design-Paket
import 'flutter_flow/request_manager.dart'; // Importiert den Request-Manager
import '/backend/schema/structs/index.dart'; // Importiert die Schema-Strukturen
import '/backend/api_requests/api_manager.dart'; // Importiert den API-Manager
import 'package:shared_preferences/shared_preferences.dart'; // Ermöglicht das Speichern und Abrufen von Daten
import 'flutter_flow/flutter_flow_util.dart'; // Nützliche Hilfsfunktionen für Flutter Flow
import 'dart:convert'; // Ermöglicht das Codieren und Dekodieren von JSON-Daten


// Definiert die App-Zustandsklasse, die ChangeNotifier erweitert
class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal(); // Erstellt eine statische Instanz der Klasse

  factory FFAppState() { // Factory-Konstruktor, gibt immer die gleiche Instanz zurück
    return _instance;
  }

  FFAppState._internal(); // Privater Konstruktor für Singleton-Implementierung

  static void reset() { // Setzt den Zustand zurück
    _instance = FFAppState._internal();
  }

  // Initialisiert den gespeicherten Zustand aus SharedPreferences
  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance(); // Lädt die gespeicherten Daten
    _safeInit(() {
      _isLogin = prefs.getBool('ff_isLogin') ?? _isLogin; // Lädt den Login-Status
    });
    _safeInit(() {
      _isIntro = prefs.getBool('ff_isIntro') ?? _isIntro; // Lädt den Einführungsstatus
    });
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId; // Lädt die Benutzer-ID
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userDetails')) {
        try {
          _userDetails = jsonDecode(prefs.getString('ff_userDetails') ?? ''); // Lädt Benutzerdetails
        } catch (e) {
          print("Can't decode persisted json. Error: $e."); // Fehlerbehandlung bei fehlerhaftem JSON
        }
      }
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token; // Lädt das Token
    });
    _safeInit(() {
      _currentPassword =
          prefs.getString('ff_currentPassword') ?? _currentPassword; // Lädt das aktuelle Passwort
    });
    _safeInit(() {
      _deviceId = prefs.getString('ff_deviceId') ?? _deviceId; // Lädt die Geräte-ID
    });
    _safeInit(() {
      _vehicleId = prefs.getString('ff_vehicleId') ?? _vehicleId; // Lädt die Fahrzeug-ID
    });
    _safeInit(() {
      _vehiclenumber = prefs.getString('ff_vehiclenumber') ?? _vehiclenumber; // Lädt die Fahrzeugnummer
    });
    _safeInit(() {
      _isVerified = prefs.getBool('ff_isVerified') ?? _isVerified; // Prüft die Verifizierung
    });
    _safeInit(() {
      _tokenFcm = prefs.getString('ff_tokenFcm') ?? _tokenFcm; // Lädt das FCM-Token
    });
    _safeInit(() {
      _isLoginVehicleCheck =
          prefs.getBool('ff_isLoginVehicleCheck') ?? _isLoginVehicleCheck; // Lädt den Fahrzeug-Login-Status
    });
  }

  void update(VoidCallback callback) { // Aktualisiert den Zustand und benachrichtigt Listener
    callback(); 
    notifyListeners();
  }

  late SharedPreferences prefs; // SharedPreferences-Objekt zum Speichern von Daten

  // Definition von verschiedenen Zustandsvariablen mit Getter und Setter
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool value) {
    _isLogin = value;
    prefs.setBool('ff_isLogin', value);
  }

  bool _isIntro = false;
  bool get isIntro => _isIntro;
  set isIntro(bool value) {
    _isIntro = value;
    prefs.setBool('ff_isIntro', value);
  }

  int _homeIndex = 0;
  int get homeIndex => _homeIndex;
  set homeIndex(int value) {
    _homeIndex = value;
  }

  List<String> _searchList = [];
  List<String> get searchList => _searchList;
  set searchList(List<String> value) {
    _searchList = value;
  }

  void addToSearchList(String value) {
    searchList.add(value);
  }

  void removeFromSearchList(String value) {
    searchList.remove(value);
  }

  void removeAtIndexFromSearchList(int index) {
    searchList.removeAt(index);
  }

  void updateSearchListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchList[index] = updateFn(_searchList[index]);
  }

  void insertAtIndexInSearchList(int index, String value) {
    searchList.insert(index, value);
  }

  String _countryCode = '91';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  int _selectVehicleTypeList = 0;
  int get selectVehicleTypeList => _selectVehicleTypeList;
  set selectVehicleTypeList(int value) {
    _selectVehicleTypeList = value;
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    prefs.setString('ff_userId', value);
  }

  dynamic _userDetails;
  dynamic get userDetails => _userDetails;
  set userDetails(dynamic value) {
    _userDetails = value;
    prefs.setString('ff_userDetails', jsonEncode(value));
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  String _currentPassword = '';
  String get currentPassword => _currentPassword;
  set currentPassword(String value) {
    _currentPassword = value;
    prefs.setString('ff_currentPassword', value);
  }

  String _deviceId = 'TP1A.220624.018';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;
    prefs.setString('ff_deviceId', value);
  }

  String _bookingTimeAppState = '';
  String get bookingTimeAppState => _bookingTimeAppState;
  set bookingTimeAppState(String value) {
    _bookingTimeAppState = value;
  }

  String _vehicleId = '';
  String get vehicleId => _vehicleId;
  set vehicleId(String value) {
    _vehicleId = value;
    prefs.setString('ff_vehicleId', value);
  }

  String _vehiclenumber = '';
  String get vehiclenumber => _vehiclenumber;
  set vehiclenumber(String value) {
    _vehiclenumber = value;
    prefs.setString('ff_vehiclenumber', value);
  }

  String _paypalTransationId = '';
  String get paypalTransationId => _paypalTransationId;
  set paypalTransationId(String value) {
    _paypalTransationId = value;
  }

  bool _paymentSuccessCheck = false;
  bool get paymentSuccessCheck => _paymentSuccessCheck;
  set paymentSuccessCheck(bool value) {
    _paymentSuccessCheck = value;
  }

  bool _isVerified = false;
  bool get isVerified => _isVerified;
  set isVerified(bool value) {
    _isVerified = value;
    prefs.setBool('ff_isVerified', value);
  }

  String _tokenFcm = '';
  String get tokenFcm => _tokenFcm;
  set tokenFcm(String value) {
    _tokenFcm = value;
    prefs.setString('ff_tokenFcm', value);
  }

  List<dynamic> _selectTimeDate = [];
  List<dynamic> get selectTimeDate => _selectTimeDate;
  set selectTimeDate(List<dynamic> value) {
    _selectTimeDate = value;
  }

  void addToSelectTimeDate(dynamic value) {
    selectTimeDate.add(value);
  }

  void removeFromSelectTimeDate(dynamic value) {
    selectTimeDate.remove(value);
  }

  void removeAtIndexFromSelectTimeDate(int index) {
    selectTimeDate.removeAt(index);
  }

  void updateSelectTimeDateAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    selectTimeDate[index] = updateFn(_selectTimeDate[index]);
  }

  void insertAtIndexInSelectTimeDate(int index, dynamic value) {
    selectTimeDate.insert(index, value);
  }

  String _countryCodeEdit = '';
  String get countryCodeEdit => _countryCodeEdit;
  set countryCodeEdit(String value) {
    _countryCodeEdit = value;
  }

  bool _isLoginVehicleCheck = false;
  bool get isLoginVehicleCheck => _isLoginVehicleCheck;
  set isLoginVehicleCheck(bool value) {
    _isLoginVehicleCheck = value;
    prefs.setBool('ff_isLoginVehicleCheck', value);
  }

  bool _connected = true;
  bool get connected => _connected;
  set connected(bool value) {
    _connected = value;
  }

  final _vehicleCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> vehicleCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _vehicleCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVehicleCacheCache() => _vehicleCacheManager.clear();
  void clearVehicleCacheCacheKey(String? uniqueKey) =>
      _vehicleCacheManager.clearRequest(uniqueKey);

  final _addressCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> addressCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _addressCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAddressCacheCache() => _addressCacheManager.clear();
  void clearAddressCacheCacheKey(String? uniqueKey) =>
      _addressCacheManager.clearRequest(uniqueKey);

  final _cancleOrderCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> cancleOrderCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _cancleOrderCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCancleOrderCacheCache() => _cancleOrderCacheManager.clear();
  void clearCancleOrderCacheCacheKey(String? uniqueKey) =>
      _cancleOrderCacheManager.clearRequest(uniqueKey);

  final _complateOrderCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> complateOrderCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _complateOrderCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearComplateOrderCacheCache() => _complateOrderCacheManager.clear();
  void clearComplateOrderCacheCacheKey(String? uniqueKey) =>
      _complateOrderCacheManager.clearRequest(uniqueKey);

  final _ongoingOrderCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> ongoingOrderCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _ongoingOrderCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearOngoingOrderCacheCache() => _ongoingOrderCacheManager.clear();
  void clearOngoingOrderCacheCacheKey(String? uniqueKey) =>
      _ongoingOrderCacheManager.clearRequest(uniqueKey);

  final _getUserCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getUserCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getUserCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetUserCacheCache() => _getUserCacheManager.clear();
  void clearGetUserCacheCacheKey(String? uniqueKey) =>
      _getUserCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
