import '/backend/api_requests/api_calls.dart';
import '/components/verified_email_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/car_detail_main_shimmer/car_detail_main_shimmer_widget.dart';
import 'dart:math';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'all_car_details_page_widget.dart' show AllCarDetailsPageWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AllCarDetailsPageModel extends FlutterFlowModel<AllCarDetailsPageWidget> {
  ///  Local state fields for this page.

  int? pageviewindex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (GetUserApi)] action in Button widget.
  ApiCallResponse? getUserFunction;
  // Stores action output result for [Backend Call - API (VerifyUserApi)] action in Button widget.
  ApiCallResponse? userVerifiedFunction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
