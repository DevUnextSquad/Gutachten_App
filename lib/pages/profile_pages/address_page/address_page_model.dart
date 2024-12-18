import '/backend/api_requests/api_calls.dart';
import '/componants/no_address_yet_componant/no_address_yet_componant_widget.dart';
import '/components/address_change_success_componant_widget.dart';
import '/components/change_address_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/components/delete_address_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/address_list_shimmer/address_list_shimmer_widget.dart';
import 'address_page_widget.dart' show AddressPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AddressPageModel extends FlutterFlowModel<AddressPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // Stores action output result for [Backend Call - API (DeleteAddressApi)] action in Container widget.
  ApiCallResponse? deleteAddressFunction;
  // Stores action output result for [Backend Call - API (SetDefaultAddressApi)] action in Container widget.
  ApiCallResponse? setDefaultAddressFunction;

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
