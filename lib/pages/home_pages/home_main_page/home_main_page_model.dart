import '/backend/api_requests/api_calls.dart';
import '/components/verified_email_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/home_pages/home_componant/home_componant_widget.dart';
import '/pages/my_order_pages/my_order_componant/my_order_componant_widget.dart';
import '/pages/profile_pages/profile_componant/profile_componant_widget.dart';
import '/pages/search_pages/search_componant/search_componant_widget.dart';
import 'home_main_page_widget.dart' show HomeMainPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeMainPageModel extends FlutterFlowModel<HomeMainPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetUserApi)] action in HomeMainPage widget.
  ApiCallResponse? getUserFunction;
  // Stores action output result for [Backend Call - API (VerifyUserApi)] action in HomeMainPage widget.
  ApiCallResponse? userVerifiedFunction;
  // Stores action output result for [Backend Call - API (VehicleListApi)] action in HomeMainPage widget.
  ApiCallResponse? vehicleListFunctionHome;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for HomeComponant component.
  late HomeComponantModel homeComponantModel;
  // Model for SearchComponant component.
  late SearchComponantModel searchComponantModel;
  // Model for MyOrderComponant component.
  late MyOrderComponantModel myOrderComponantModel;
  // Model for ProfileComponant component.
  late ProfileComponantModel profileComponantModel;

  @override
  void initState(BuildContext context) {
    homeComponantModel = createModel(context, () => HomeComponantModel());
    searchComponantModel = createModel(context, () => SearchComponantModel());
    myOrderComponantModel = createModel(context, () => MyOrderComponantModel());
    profileComponantModel = createModel(context, () => ProfileComponantModel());
  }

  @override
  void dispose() {
    homeComponantModel.dispose();
    searchComponantModel.dispose();
    myOrderComponantModel.dispose();
    profileComponantModel.dispose();
  }
}
