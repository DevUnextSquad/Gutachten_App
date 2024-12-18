import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'verification_page_widget.dart' show VerificationPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationPageModel extends FlutterFlowModel<VerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a valid OTP';
    }
    if (val.length < 4) {
      return 'Requires 4 characters.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (OTPVerificationApi)] action in Button widget.
  ApiCallResponse? verifyOtpFunction;
  // Stores action output result for [Backend Call - API (SignInApi)] action in Button widget.
  ApiCallResponse? signInFunction;
  // Stores action output result for [Backend Call - API (VehicleListApi)] action in Button widget.
  ApiCallResponse? vehicleListFunction;
  // Stores action output result for [Backend Call - API (SignUpApi)] action in RichTextSpan widget.
  ApiCallResponse? signupResendFunction;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
    pinCodeController?.dispose();
  }
}
