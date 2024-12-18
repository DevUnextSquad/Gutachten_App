import '/backend/api_requests/api_calls.dart';
import '/componants/blank_componant/blank_componant_widget.dart';
import '/componants/no_service_yet_componant/no_service_yet_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/main_list_shimmer/main_list_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'banner_page_widget.dart' show BannerPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BannerPageModel extends FlutterFlowModel<BannerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;

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
