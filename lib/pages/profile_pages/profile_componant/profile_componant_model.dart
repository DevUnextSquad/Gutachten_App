import '/backend/api_requests/api_calls.dart';
import '/components/car_change_success_componant_widget.dart';
import '/components/change_car_componant_widget.dart';
import '/components/logout_alrt_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmers/profile_shimmer/profile_shimmer_widget.dart';
import '/shimmers/vehicle_home_shimmer/vehicle_home_shimmer_widget.dart';
import 'dart:async';
import 'profile_componant_widget.dart' show ProfileComponantWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProfileComponantModel extends FlutterFlowModel<ProfileComponantWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (SetDefaultVehicleApi)] action in Container widget.
  ApiCallResponse? setDefaultCarFunctionCopy;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Stores action output result for [Backend Call - API (SignOutApi)] action in Container widget.
  ApiCallResponse? signOutFunction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
