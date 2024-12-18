import '/backend/api_requests/api_calls.dart';
import '/componants/no_coupon_set_componant/no_coupon_set_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'my_coupon_page_widget.dart' show MyCouponPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyCouponPageModel extends FlutterFlowModel<MyCouponPageWidget> {
  ///  Local state fields for this page.

  String? couponCode;

  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ApplyCouponApi)] action in Container widget.
  ApiCallResponse? applyCouponFunction;

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
}
