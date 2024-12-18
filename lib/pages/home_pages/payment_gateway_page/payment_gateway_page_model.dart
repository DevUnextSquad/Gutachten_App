import '/backend/api_requests/api_calls.dart';
import '/componants/blank_componant/blank_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/components/order_success_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/payment_gateway_shimmer/payment_gateway_shimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'payment_gateway_page_widget.dart' show PaymentGatewayPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PaymentGatewayPageModel
    extends FlutterFlowModel<PaymentGatewayPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // Stores action output result for [Backend Call - API (BookAVehicle)] action in Button widget.
  ApiCallResponse? bookingApiStripeFunction;
  // Stores action output result for [Backend Call - API (BookAVehicleNoCoupon)] action in Button widget.
  ApiCallResponse? bookingApiStripeNoCouponFunction;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
  }
}
