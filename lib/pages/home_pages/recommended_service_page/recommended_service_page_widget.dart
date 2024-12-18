import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/recommennded_list_shimmer/recommennded_list_shimmer_widget.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'recommended_service_page_model.dart';
export 'recommended_service_page_model.dart';

class RecommendedServicePageWidget extends StatefulWidget {
  const RecommendedServicePageWidget({super.key});

  @override
  State<RecommendedServicePageWidget> createState() =>
      _RecommendedServicePageWidgetState();
}

class _RecommendedServicePageWidgetState
    extends State<RecommendedServicePageWidget> {
  late RecommendedServicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendedServicePageModel());
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
                  title: 'Recommended service',
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
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              safeSetState(
                                  () => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            child: ListView(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                16.0,
                                0,
                                16.0,
                              ),
                              scrollDirection: Axis.vertical,
                              children: [
                                FutureBuilder<ApiCallResponse>(
                                  future: (_model.apiRequestCompleter ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(CarServiceGroup
                                                .servicesApiCall
                                                .call()))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: RecommenndedListShimmerWidget(),
                                      );
                                    }
                                    final wrapServicesApiResponse =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final recommendedServiceList =
                                            CarServiceGroup.servicesApiCall
                                                    .serviceDetailsList(
                                                      wrapServicesApiResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];

                                        return Wrap(
                                          spacing: 16.0,
                                          runSpacing: 16.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: List.generate(
                                              recommendedServiceList.length,
                                              (recommendedServiceListIndex) {
                                            final recommendedServiceListItem =
                                                recommendedServiceList[
                                                    recommendedServiceListIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'BannerPage',
                                                  queryParameters: {
                                                    'serviceId': serializeParam(
                                                      getJsonField(
                                                        recommendedServiceListItem,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'name': serializeParam(
                                                      getJsonField(
                                                        recommendedServiceListItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      810.0) {
                                                    return ((MediaQuery.sizeOf(
                                                                    context)
                                                                .width -
                                                            64) *
                                                        1 /
                                                        3);
                                                  } else if ((MediaQuery.sizeOf(
                                                                  context)
                                                              .width >=
                                                          810.0) &&
                                                      (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          1280.0)) {
                                                    return ((MediaQuery.sizeOf(
                                                                    context)
                                                                .width -
                                                            96) *
                                                        1 /
                                                        5);
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width >=
                                                      1280.0) {
                                                    return ((MediaQuery.sizeOf(
                                                                    context)
                                                                .width -
                                                            144) *
                                                        1 /
                                                        8);
                                                  } else {
                                                    return ((MediaQuery.sizeOf(
                                                                    context)
                                                                .width -
                                                            144) *
                                                        1 /
                                                        8);
                                                  }
                                                }(),
                                                height: 142.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 91.0,
                                                      height: 91.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      200),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      200),
                                                          imageUrl:
                                                              '${FFAppConstants.imageUrl}${getJsonField(
                                                            recommendedServiceListItem,
                                                            r'''$.image''',
                                                          ).toString()}',
                                                          width: 40.0,
                                                          height: 40.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        recommendedServiceListItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.2,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
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
