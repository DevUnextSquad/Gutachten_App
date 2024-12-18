import '/backend/api_requests/api_calls.dart';
import '/components/car_change_success_componant_widget.dart';
import '/components/change_car_componant_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmers/home_list_shimmer/home_list_shimmer_widget.dart';
import '/shimmers/home_shimmer/home_shimmer_widget.dart';
import '/shimmers/vehicle_home_shimmer/vehicle_home_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'home_componant_widget.dart' show HomeComponantWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeComponantModel extends FlutterFlowModel<HomeComponantWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (SetDefaultVehicleApi)] action in Container widget.
  ApiCallResponse? setDefaultCarFunction;
  bool apiRequestCompleted4 = false;
  String? apiRequestLastUniqueKey4;
  bool apiRequestCompleted3 = false;
  String? apiRequestLastUniqueKey3;
  bool apiRequestCompleted1 = false;
  String? apiRequestLastUniqueKey1;
  bool apiRequestCompleted2 = false;
  String? apiRequestLastUniqueKey2;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  /// Query cache managers for this widget.

  final _allMaintainCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allMaintainCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allMaintainCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllMaintainCacheCache() => _allMaintainCacheManager.clear();
  void clearAllMaintainCacheCacheKey(String? uniqueKey) =>
      _allMaintainCacheManager.clearRequest(uniqueKey);

  final _allbannerCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allbannerCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allbannerCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllbannerCacheCache() => _allbannerCacheManager.clear();
  void clearAllbannerCacheCacheKey(String? uniqueKey) =>
      _allbannerCacheManager.clearRequest(uniqueKey);

  final _allServiceApiManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allServiceApi({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allServiceApiManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllServiceApiCache() => _allServiceApiManager.clear();
  void clearAllServiceApiCacheKey(String? uniqueKey) =>
      _allServiceApiManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearAllMaintainCacheCache();

    clearAllbannerCacheCache();

    clearAllServiceApiCache();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted4;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted3;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
