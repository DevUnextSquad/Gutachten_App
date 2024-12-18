import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/my_order_pages/cancel_orders_componant/cancel_orders_componant_widget.dart';
import '/pages/my_order_pages/complate_orders_componant/complate_orders_componant_widget.dart';
import '/pages/my_order_pages/ongoing_orders_payment_componant/ongoing_orders_payment_componant_widget.dart';
import 'my_order_confirm_page_widget.dart' show MyOrderConfirmPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyOrderConfirmPageModel
    extends FlutterFlowModel<MyOrderConfirmPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for OngoingOrdersPaymentComponant component.
  late OngoingOrdersPaymentComponantModel ongoingOrdersPaymentComponantModel;
  // Model for CancelOrdersComponant component.
  late CancelOrdersComponantModel cancelOrdersComponantModel;
  // Model for ComplateOrdersComponant component.
  late ComplateOrdersComponantModel complateOrdersComponantModel;

  @override
  void initState(BuildContext context) {
    ongoingOrdersPaymentComponantModel =
        createModel(context, () => OngoingOrdersPaymentComponantModel());
    cancelOrdersComponantModel =
        createModel(context, () => CancelOrdersComponantModel());
    complateOrdersComponantModel =
        createModel(context, () => ComplateOrdersComponantModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    ongoingOrdersPaymentComponantModel.dispose();
    cancelOrdersComponantModel.dispose();
    complateOrdersComponantModel.dispose();
  }
}
