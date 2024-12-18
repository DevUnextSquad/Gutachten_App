import '/components/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/my_order_pages/cancel_orders_componant/cancel_orders_componant_widget.dart';
import '/pages/my_order_pages/complate_orders_componant/complate_orders_componant_widget.dart';
import '/pages/my_order_pages/ongoing_orders_componant/ongoing_orders_componant_widget.dart';
import 'my_order_componant_widget.dart' show MyOrderComponantWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyOrderComponantModel extends FlutterFlowModel<MyOrderComponantWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for single_appbar component.
  late SingleAppbarModel singleAppbarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for OngoingOrdersComponant component.
  late OngoingOrdersComponantModel ongoingOrdersComponantModel;
  // Model for CancelOrdersComponant component.
  late CancelOrdersComponantModel cancelOrdersComponantModel;
  // Model for ComplateOrdersComponant component.
  late ComplateOrdersComponantModel complateOrdersComponantModel;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
    ongoingOrdersComponantModel =
        createModel(context, () => OngoingOrdersComponantModel());
    cancelOrdersComponantModel =
        createModel(context, () => CancelOrdersComponantModel());
    complateOrdersComponantModel =
        createModel(context, () => ComplateOrdersComponantModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
    tabBarController?.dispose();
    ongoingOrdersComponantModel.dispose();
    cancelOrdersComponantModel.dispose();
    complateOrdersComponantModel.dispose();
  }
}
