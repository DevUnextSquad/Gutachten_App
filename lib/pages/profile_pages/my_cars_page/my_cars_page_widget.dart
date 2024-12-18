import '/backend/api_requests/api_calls.dart';
import '/componants/no_my_car_componant/no_my_car_componant_widget.dart';
import '/components/car_change_success_componant_widget.dart';
import '/components/change_car_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/components/delete_car_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/my_car_list_shimmer/my_car_list_shimmer_widget.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'my_cars_page_model.dart';
export 'my_cars_page_model.dart';

class MyCarsPageWidget extends StatefulWidget {
  const MyCarsPageWidget({super.key});

  @override
  State<MyCarsPageWidget> createState() => _MyCarsPageWidgetState();
}

class _MyCarsPageWidgetState extends State<MyCarsPageWidget> {
  late MyCarsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyCarsPageModel());
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
                  title: 'My cars',
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: FFAppState()
                                      .vehicleCache(
                                    requestFn: () =>
                                        CarServiceGroup.vehicleListApiCall.call(
                                      userId: FFAppState().userId,
                                      token: FFAppState().token,
                                    ),
                                  )
                                      .then((result) {
                                    _model.apiRequestCompleted = true;
                                    return result;
                                  }),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: MyCarListShimmerWidget(),
                                      );
                                    }
                                    final listViewVehicleListApiResponse =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final vehicleList =
                                            CarServiceGroup.vehicleListApiCall
                                                    .vehicleDetailsList(
                                                      listViewVehicleListApiResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];
                                        if (vehicleList.isEmpty) {
                                          return Center(
                                            child: Container(
                                              height: 208.0,
                                              child: NoMyCarComponantWidget(),
                                            ),
                                          );
                                        }

                                        return RefreshIndicator(
                                          key: Key('RefreshIndicator_iey59xrm'),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          onRefresh: () async {
                                            safeSetState(() {
                                              FFAppState()
                                                  .clearVehicleCacheCache();
                                              _model.apiRequestCompleted =
                                                  false;
                                            });
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
                                            itemCount: vehicleList.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 16.0),
                                            itemBuilder:
                                                (context, vehicleListIndex) {
                                              final vehicleListItem =
                                                  vehicleList[vehicleListIndex];
                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 104.0,
                                                                height: 104.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .gray100,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
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
                                                                      vehicleListItem,
                                                                      r'''$.vehicleTypeDetails.image''',
                                                                    ).toString()}',
                                                                    width: 68.0,
                                                                    height:
                                                                        68.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      vehicleListItem,
                                                                      r'''$.vehicle_name''',
                                                                    ).toString(),
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
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'SelectVehicleTypeEditPage',
                                                                      queryParameters:
                                                                          {
                                                                        'vehicleId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            vehicleListItem,
                                                                            r'''$.id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'vehicleName':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            vehicleListItem,
                                                                            r'''$.vehicle_name''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'vehicleNumber':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            vehicleListItem,
                                                                            r'''$.vehicle_number''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'vehicleTypeId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            vehicleListItem,
                                                                            r'''$.vehicleTypeDetails._id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10.0),
                                                                      child:
                                                                          Text(
                                                                        'Edit',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (false ==
                                                                  getJsonField(
                                                                    vehicleListItem,
                                                                    r'''$.is_default''',
                                                                  ))
                                                                Expanded(
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                child: DeleteCarDialogWidget(
                                                                                  onTapYes: () async {
                                                                                    _model.deleteVehicleFunction = await CarServiceGroup.deleteVehicleApiCall.call(
                                                                                      userId: FFAppState().userId,
                                                                                      vehicleId: getJsonField(
                                                                                        vehicleListItem,
                                                                                        r'''$.id''',
                                                                                      ).toString(),
                                                                                      token: FFAppState().token,
                                                                                    );

                                                                                    if (CarServiceGroup.deleteVehicleApiCall.success(
                                                                                          (_model.deleteVehicleFunction?.jsonBody ?? ''),
                                                                                        ) ==
                                                                                        1) {
                                                                                      Navigator.pop(context);
                                                                                      safeSetState(() {
                                                                                        FFAppState().clearVehicleCacheCache();
                                                                                        _model.apiRequestCompleted = false;
                                                                                      });
                                                                                      await _model.waitForApiRequestCompleted();
                                                                                      FFAppState().clearVehicleCacheCache();
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            CarServiceGroup.deleteVehicleApiCall.message(
                                                                                              (_model.deleteVehicleFunction?.jsonBody ?? ''),
                                                                                            )!,
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 2000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      );
                                                                                      Navigator.pop(context);
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10.0),
                                                                          child:
                                                                              Text(
                                                                            'Delete',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'SF Pro Display',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 16.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  17.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(dialogContext).unfocus(),
                                                                        child:
                                                                            ChangeCarComponantWidget(
                                                                          onTapYes:
                                                                              () async {
                                                                            _model.setDefaultCarApi =
                                                                                await CarServiceGroup.setDefaultVehicleApiCall.call(
                                                                              userId: FFAppState().userId,
                                                                              vehicleId: getJsonField(
                                                                                vehicleListItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                              vehicleNumber: getJsonField(
                                                                                vehicleListItem,
                                                                                r'''$.vehicle_number''',
                                                                              ).toString(),
                                                                              token: FFAppState().token,
                                                                            );

                                                                            if (CarServiceGroup.setDefaultVehicleApiCall.success(
                                                                                  (_model.setDefaultCarApi?.jsonBody ?? ''),
                                                                                ) ==
                                                                                1) {
                                                                              safeSetState(() {
                                                                                FFAppState().clearVehicleCacheCache();
                                                                                _model.apiRequestCompleted = false;
                                                                              });
                                                                              await _model.waitForApiRequestCompleted();
                                                                              Navigator.pop(context);
                                                                              FFAppState().clearVehicleCacheCache();
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                      child: CarChangeSuccessComponantWidget(),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    CarServiceGroup.setDefaultVehicleApiCall.message(
                                                                                      (_model.setDefaultCarApi?.jsonBody ?? ''),
                                                                                    )!,
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 2000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              );
                                                                              Navigator.pop(context);
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: true ==
                                                                          getJsonField(
                                                                            vehicleListItem,
                                                                            r'''$.is_default''',
                                                                          )
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .success
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .gray200,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          5.0,
                                                                          12.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    'Default',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'SF Pro Display',
                                                                          color: true ==
                                                                                  getJsonField(
                                                                                    vehicleListItem,
                                                                                    r'''$.is_default''',
                                                                                  )
                                                                              ? FlutterFlowTheme.of(context).primaryBackground
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  ],
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
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('SelectVehicleTypePage');
                                },
                                text: 'Add new car',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 56.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        lineHeight: 1.2,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ],
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
