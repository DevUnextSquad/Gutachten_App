import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forgot_password_page_widget.dart' show ForgotPasswordPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPageModel
    extends FlutterFlowModel<ForgotPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a valid email address';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (ForgotPasswordApi)] action in Button widget.
  ApiCallResponse? forgotPasswordFunction;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
