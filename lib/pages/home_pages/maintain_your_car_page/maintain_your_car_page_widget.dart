import '/backend/api_requests/api_calls.dart';
import '/componants/blank_componant/blank_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/main_list_shimmer/main_list_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'maintain_your_car_page_model.dart';
export 'maintain_your_car_page_model.dart';

class MaintainYourCarPageWidget extends StatefulWidget {
  const MaintainYourCarPageWidget({super.key});

  @override
  State<MaintainYourCarPageWidget> createState() =>
      _MaintainYourCarPageWidgetState();
}

class _MaintainYourCarPageWidgetState extends State<MaintainYourCarPageWidget> {
  late MaintainYourCarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MaintainYourCarPageModel());
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
          child: FutureBuilder<ApiCallResponse>(
            future: CarServiceGroup.currencyApiCall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: Container(
                    width: 0.0,
                    height: 0.0,
                    child: BlankComponantWidget(),
                  ),
                );
              }
              final columnCurrencyApiResponse = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.customCenterAppbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CustomCenterAppbarWidget(
                      title: 'Maintain your car with',
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
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(CarServiceGroup
                                              .allPackagesApiCall
                                              .call()))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: MainListShimmerWidget(),
                                    );
                                  }
                                  final listViewAllPackagesApiResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final maintainYourCarList =
                                          CarServiceGroup.allPackagesApiCall
                                                  .packageDetailsList(
                                                    listViewAllPackagesApiResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];

                                      return RefreshIndicator(
                                        key: Key('RefreshIndicator_74n138bx'),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        onRefresh: () async {
                                          safeSetState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            16.0,
                                            0,
                                            16.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: maintainYourCarList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 16.0),
                                          itemBuilder: (context,
                                              maintainYourCarListIndex) {
                                            final maintainYourCarListItem =
                                                maintainYourCarList[
                                                    maintainYourCarListIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'AllCarDetailsPage',
                                                  queryParameters: {
                                                    'packageId': serializeParam(
                                                      getJsonField(
                                                        maintainYourCarListItem,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'packageName':
                                                        serializeParam(
                                                      getJsonField(
                                                        maintainYourCarListItem,
                                                        r'''$.title''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'packageImage':
                                                        serializeParam(
                                                      getJsonField(
                                                        maintainYourCarListItem,
                                                        r'''$.image''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'price': serializeParam(
                                                      getJsonField(
                                                        maintainYourCarListItem,
                                                        r'''$.price''',
                                                      ),
                                                      ParamType.double,
                                                    ),
                                                    'serviceId': serializeParam(
                                                      getJsonField(
                                                        maintainYourCarListItem,
                                                        r'''$.serviceDetails._id''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'serviceName':
                                                        serializeParam(
                                                      getJsonField(
                                                        maintainYourCarListItem,
                                                        r'''$.serviceDetails.name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'serviceImage':
                                                        serializeParam(
                                                      getJsonField(
                                                        maintainYourCarListItem,
                                                        r'''$.serviceDetails.image''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'currencySymbol':
                                                        serializeParam(
                                                      CarServiceGroup
                                                          .currencyApiCall
                                                          .currency(
                                                        columnCurrencyApiResponse
                                                            .jsonBody,
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 345.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  16.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  16.0),
                                                        ),
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
                                                            maintainYourCarListItem,
                                                            r'''$.image''',
                                                          ).toString()}',
                                                          width:
                                                              double.infinity,
                                                          height: 174.0,
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment(
                                                              -1.0, -1.0),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              getJsonField(
                                                                maintainYourCarListItem,
                                                                r'''$.title''',
                                                              ).toString(),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            6.0),
                                                                    child: custom_widgets
                                                                        .GetCurrencySymboolBold(
                                                                      width:
                                                                          15.0,
                                                                      height:
                                                                          20.0,
                                                                      isSimbool: CarServiceGroup
                                                                          .currencyApiCall
                                                                          .currency(
                                                                        columnCurrencyApiResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    maintainYourCarListItem,
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Expanded(
                                                                  child: custom_widgets
                                                                      .ReadMoreHtml(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        50.0,
                                                                    htmlContent:
                                                                        getJsonField(
                                                                      maintainYourCarListItem,
                                                                      r'''$.description''',
                                                                    ).toString(),
                                                                    maxLength:
                                                                        60,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            26.0,
                                                                            12.0,
                                                                            26.0,
                                                                            12.0),
                                                                        child:
                                                                            Text(
                                                                          'Book now',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 1.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      height:
                                                                          2.0)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
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
              );
            },
          ),
        ),
      ),
    );
  }
}
