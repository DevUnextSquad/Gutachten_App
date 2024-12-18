import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/select_vehicle_type_list_shimmer/select_vehicle_type_list_shimmer_widget.dart';
import 'select_vehicle_type_page_widget.dart' show SelectVehicleTypePageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SelectVehicleTypePageModel
    extends FlutterFlowModel<SelectVehicleTypePageWidget> {
  ///  Local state fields for this page.

  String? vehicleTypeId;

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
