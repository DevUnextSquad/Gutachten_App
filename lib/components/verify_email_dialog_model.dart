import '/backend/api_requests/api_calls.dart';
import '/components/verified_email_o_t_p_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'verify_email_dialog_widget.dart' show VerifyEmailDialogWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyEmailDialogModel extends FlutterFlowModel<VerifyEmailDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (ResendOTPApi)] action in Button widget.
  ApiCallResponse? resetOtpFunction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
