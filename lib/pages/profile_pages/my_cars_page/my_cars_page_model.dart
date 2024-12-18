import '/backend/api_requests/api_calls.dart';
import '/componants/no_my_car_componant/no_my_car_componant_widget.dart';
import '/components/car_change_success_componant_widget.dart';
import '/components/change_car_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/components/delete_car_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/my_car_list_shimmer/my_car_list_shimmer_widget.dart';
import 'dart:async';
import 'my_cars_page_widget.dart' show MyCarsPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyCarsPageModel extends FlutterFlowModel<MyCarsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Stores action output result for [Backend Call - API (DeleteVehicleApi)] action in Container widget.
  ApiCallResponse? deleteVehicleFunction;
  // Stores action output result for [Backend Call - API (SetDefaultVehicleApi)] action in Container widget.
  ApiCallResponse? setDefaultCarApi;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
  }

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
