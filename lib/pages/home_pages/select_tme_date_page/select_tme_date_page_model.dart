import '/backend/api_requests/api_calls.dart';
import '/componants/no_slot_set_componant/no_slot_set_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/select_date_shimmer/select_date_shimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_tme_date_page_widget.dart' show SelectTmeDatePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SelectTmeDatePageModel extends FlutterFlowModel<SelectTmeDatePageWidget> {
  ///  Local state fields for this page.

  String? bookingTimePage;

  int? bookingTime;

  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - API (AvailableSlotsApi)] action in Calendar widget.
  ApiCallResponse? apiResult1dn;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
  }
}
