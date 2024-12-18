import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'verified_email_o_t_p_dialog_widget.dart'
    show VerifiedEmailOTPDialogWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifiedEmailOTPDialogModel
    extends FlutterFlowModel<VerifiedEmailOTPDialogWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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
  ApiCallResponse? otpVerificationFunction;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
