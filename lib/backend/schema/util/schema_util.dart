import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Exportiert benötigte Pakete für die Verwendung in anderen Dateien
export 'package:collection/collection.dart' show ListEquality;
export 'package:flutter/material.dart' show Color, Colors;
export 'package:from_css_color/from_css_color.dart';

// Definition eines Funktionstyps für das Erstellen von Strukturobjekten
typedef StructBuilder<T> = T Function(Map<String, dynamic> data);

// Abstrakte Basisklasse für alle serialisierbaren Strukturen
abstract class BaseStruct {
  // Methode zum Konvertieren in eine Map
  Map<String, dynamic> toSerializableMap();
  // Methode zum Konvertieren in einen JSON-String
  String serialize() => json.encode(toSerializableMap());
}

// Funktion zum Deserialisieren von Strukturparametern
dynamic deserializeStructParam<T>(
  dynamic param,
  ParamType paramType,
  bool isList, {
  required StructBuilder<T> structBuilder,
}) {
  // Null-Check
  if (param == null) {
    return null;
  } 
  // Listen-Verarbeitung
  else if (isList) {
    final paramValues;
    try {
      // Versucht Parameter als Liste zu interpretieren oder aus JSON zu dekodieren
      paramValues = param is Iterable ? param : json.decode(param);
    } catch (e) {
      return null;
    }
    if (paramValues is! Iterable) {
      return null;
    }
    // Konvertiert jedes Element der Liste
    return paramValues
        .map<T>((e) => deserializeStructParam<T>(e, paramType, false,
            structBuilder: structBuilder))
        .toList();
  } 
  // Map-Verarbeitung
  else if (param is Map<String, dynamic>) {
    return structBuilder(param);
  } 
  // Einzelwert-Verarbeitung
  else {
    return deserializeParam<T>(
      param,
      paramType,
      isList,
      structBuilder: structBuilder,
    );
  }
}

// Konvertiert eine Liste von Maps in eine Liste von Strukturobjekten
List<T>? getStructList<T>(
  dynamic value,
  StructBuilder<T> structBuilder,
) =>
    value is! List
        ? null
        : value
            .where((e) => e is Map<String, dynamic>)
            .map((e) => structBuilder(e as Map<String, dynamic>))
            .toList();

// Konvertiert verschiedene Farbformate in Flutter Color-Objekte
Color? getSchemaColor(dynamic value) => value is String
    ? fromCssColor(value)
    : value is Color
        ? value
        : null;

// Konvertiert eine Liste von Farbwerten in eine Liste von Color-Objekten
List<Color>? getColorsList(dynamic value) =>
    value is! List ? null : value.map(getSchemaColor).withoutNulls;

// Konvertiert eine Liste von Werten in eine typisierte Liste
List<T>? getDataList<T>(dynamic value) =>
    value is! List ? null : value.map((e) => castToType<T>(e)!).toList();