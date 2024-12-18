import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'privacy_policy_page_model.dart';
export 'privacy_policy_page_model.dart';

class PrivacyPolicyPageWidget extends StatefulWidget {
  const PrivacyPolicyPageWidget({super.key});

  @override
  State<PrivacyPolicyPageWidget> createState() =>
      _PrivacyPolicyPageWidgetState();
}

class _PrivacyPolicyPageWidgetState extends State<PrivacyPolicyPageWidget> {
  late PrivacyPolicyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.customCenterAppbarModel,
                updateCallback: () => safeSetState(() {}),
                child: CustomCenterAppbarWidget(
                  title: 'Privacy policy',
                  backIcon: false,
                  addIcon: false,
                  onTapAdd: () async {},
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().connected) {
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: FutureBuilder<ApiCallResponse>(
                          future: CarServiceGroup.pagesApiCall.call(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final listViewPagesApiResponse = snapshot.data!;

                            return ListView(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                16.0,
                                0,
                                0,
                              ),
                              scrollDirection: Axis.vertical,
                              children: [
                                if (CarServiceGroup.pagesApiCall.success(
                                      listViewPagesApiResponse.jsonBody,
                                    ) ==
                                    1)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: custom_widgets.HtmlConverter(
                                      width: double.infinity,
                                      height: 50.0,
                                      text: CarServiceGroup.pagesApiCall
                                          .privacyPolicy(
                                        listViewPagesApiResponse.jsonBody,
                                      )!,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Lottie.asset(
                          'assets/jsons/No_Wifi.json',
                          width: 150.0,
                          height: 130.0,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
