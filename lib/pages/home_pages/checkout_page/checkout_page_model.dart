import '/backend/api_requests/api_calls.dart';
import '/componants/blank_componant/blank_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/check_out_shimmer/check_out_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'checkout_page_widget.dart' show CheckoutPageWidget;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CheckoutPageModel extends FlutterFlowModel<CheckoutPageWidget> {
  ///  Local state fields for this page.

  bool? isApplied = false;

  bool showText = false;

  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ApplyCouponApi)] action in TextField widget.
  ApiCallResponse? applyCouponFunctionCopy;
  // Stores action output result for [Backend Call - API (ApplyCouponApi)] action in Container widget.
  ApiCallResponse? applyCouponFunction;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (GetAddressApi)] action in Button widget.
  ApiCallResponse? getAddressFunction;
  // Stores action output result for [Backend Call - API (VehicleListApi)] action in Button widget.
  ApiCallResponse? vehicleListfunction;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
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
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
