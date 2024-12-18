import '/backend/api_requests/api_calls.dart';
import '/components/car_change_success_componant_widget.dart';
import '/components/change_car_componant_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmers/home_list_shimmer/home_list_shimmer_widget.dart';
import '/shimmers/home_shimmer/home_shimmer_widget.dart';
import '/shimmers/vehicle_home_shimmer/vehicle_home_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_componant_model.dart';
export 'home_componant_model.dart';

class HomeComponantWidget extends StatefulWidget {
  const HomeComponantWidget({super.key});

  @override
  State<HomeComponantWidget> createState() => _HomeComponantWidgetState();
}

class _HomeComponantWidgetState extends State<HomeComponantWidget> {
  late HomeComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeComponantModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        if (FFAppState().connected) {
          return FutureBuilder<ApiCallResponse>(
            future: _model
                .allServiceApi(
              requestFn: () => CarServiceGroup.servicesApiCall.call(),
            )
                .then((result) {
              _model.apiRequestCompleted3 = true;
              return result;
            }),
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
              final containerServicesApiResponse = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: FutureBuilder<ApiCallResponse>(
                  future: _model
                      .allbannerCache(
                    requestFn: () => CarServiceGroup.bannersCall.call(),
                  )
                      .then((result) {
                    _model.apiRequestCompleted1 = true;
                    return result;
                  }),
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
                    final containerBannersResponse = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: FutureBuilder<ApiCallResponse>(
                        future: _model
                            .allMaintainCache(
                          requestFn: () =>
                              CarServiceGroup.allPackagesApiCall.call(),
                        )
                            .then((result) {
                          _model.apiRequestCompleted2 = true;
                          return result;
                        }),
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
                          final containerAllPackagesApiResponse =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: FutureBuilder<ApiCallResponse>(
                              future: CarServiceGroup.getUserApiCall.call(
                                userId: FFAppState().userId,
                                token: FFAppState().token,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: HomeShimmerWidget(),
                                  );
                                }
                                final columnGetUserApiResponse = snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 217.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 63.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          if (FFAppState()
                                                                  .isLogin ==
                                                              true) {
                                                            return Text(
                                                              'Hello, ${CarServiceGroup.getUserApiCall.firstname(
                                                                columnGetUserApiResponse
                                                                    .jsonBody,
                                                              )} ${CarServiceGroup.getUserApiCall.lastname(
                                                                columnGetUserApiResponse
                                                                    .jsonBody,
                                                              )}',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            );
                                                          } else {
                                                            return Text(
                                                              'Hallo, Herr',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Text(
                                                        'View your account details here',
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                  if (false)
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'NotificationPage');
                                                      },
                                                      child: Container(
                                                        width: 48.0,
                                                        height: 48.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/bell_black.svg',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 8.0,
                                                              height: 8.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (FFAppState().isLogin ==
                                                  true) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 144.0, 0.0, 0.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: FFAppState()
                                                              .vehicleCache(
                                                            uniqueQueryKey:
                                                                FFAppState()
                                                                    .userId,
                                                            requestFn: () =>
                                                                CarServiceGroup
                                                                    .vehicleListApiCall
                                                                    .call(
                                                              userId:
                                                                  FFAppState()
                                                                      .userId,
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                            ),
                                                          )
                                                              .then((result) {
                                                            try {
                                                              _model.apiRequestCompleted4 =
                                                                  true;
                                                              _model.apiRequestLastUniqueKey4 =
                                                                  FFAppState()
                                                                      .userId;
                                                            } finally {}
                                                            return result;
                                                          }),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child:
                                                                    VehicleHomeShimmerWidget(),
                                                              );
                                                            }
                                                            final rowVehicleListApiResponse =
                                                                snapshot.data!;

                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                final vehicleList =
                                                                    CarServiceGroup
                                                                            .vehicleListApiCall
                                                                            .vehicleDetailsList(
                                                                              rowVehicleListApiResponse.jsonBody,
                                                                            )
                                                                            ?.toList() ??
                                                                        [];

                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        vehicleList
                                                                            .length,
                                                                        (vehicleListIndex) {
                                                                      final vehicleListItem =
                                                                          vehicleList[
                                                                              vehicleListIndex];
                                                                      return Container(
                                                                        width:
                                                                            320.0,
                                                                        height:
                                                                            148.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(14.0),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 22.0, 17.0, 22.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 104.0,
                                                                                    height: 104.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).gray100,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(18.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                        child: CachedNetworkImage(
                                                                                          fadeInDuration: Duration(milliseconds: 200),
                                                                                          fadeOutDuration: Duration(milliseconds: 200),
                                                                                          imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                            vehicleListItem,
                                                                                            r'''$.vehicleTypeDetails.image''',
                                                                                          ).toString()}',
                                                                                          fit: BoxFit.cover,
                                                                                          alignment: Alignment(0.0, -1.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        vehicleListItem,
                                                                                        r'''$.vehicle_name''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'SF Pro Display',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: false,
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 17.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, -1.0),
                                                                                      child: Builder(
                                                                                        builder: (context) => InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (dialogContext) {
                                                                                                return Dialog(
                                                                                                  elevation: 0,
                                                                                                  insetPadding: EdgeInsets.zero,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  child: ChangeCarComponantWidget(
                                                                                                    onTapYes: () async {
                                                                                                      _model.setDefaultCarFunction = await CarServiceGroup.setDefaultVehicleApiCall.call(
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
                                                                                                            (_model.setDefaultCarFunction?.jsonBody ?? ''),
                                                                                                          ) ==
                                                                                                          1) {
                                                                                                        safeSetState(() {
                                                                                                          FFAppState().clearVehicleCacheCacheKey(_model.apiRequestLastUniqueKey4);
                                                                                                          _model.apiRequestCompleted4 = false;
                                                                                                        });
                                                                                                        await _model.waitForApiRequestCompleted4();
                                                                                                        Navigator.pop(context);
                                                                                                        await showDialog(
                                                                                                          context: context,
                                                                                                          builder: (dialogContext) {
                                                                                                            return Dialog(
                                                                                                              elevation: 0,
                                                                                                              insetPadding: EdgeInsets.zero,
                                                                                                              backgroundColor: Colors.transparent,
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                              child: CarChangeSuccessComponantWidget(),
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      } else {
                                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                                          SnackBar(
                                                                                                            content: Text(
                                                                                                              CarServiceGroup.setDefaultVehicleApiCall.message(
                                                                                                                (_model.setDefaultCarFunction?.jsonBody ?? ''),
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
                                                                                                );
                                                                                              },
                                                                                            );

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          child: Container(
                                                                                            height: 28.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: true ==
                                                                                                      getJsonField(
                                                                                                        vehicleListItem,
                                                                                                        r'''$.is_default''',
                                                                                                      )
                                                                                                  ? FlutterFlowTheme.of(context).success
                                                                                                  : FlutterFlowTheme.of(context).gray200,
                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                              child: Text(
                                                                                                'Default',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'SF Pro Display',
                                                                                                      color: true ==
                                                                                                              getJsonField(
                                                                                                                vehicleListItem,
                                                                                                                r'''$.is_default''',
                                                                                                              )
                                                                                                          ? FlutterFlowTheme.of(context).primaryBackground
                                                                                                          : FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        width:
                                                                            16.0)),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (FFAppState()
                                                                    .isLogin ==
                                                                true) {
                                                              context.pushNamed(
                                                                  'SelectVehicleTypePage');
                                                            } else {
                                                              context.pushNamed(
                                                                  'SignInPage');
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 320.0,
                                                            height: 148.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 48.0,
                                                                  height: 48.0,
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
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/images/plus.svg',
                                                                      width:
                                                                          24.0,
                                                                      height:
                                                                          24.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Add car',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              width: 16.0))
                                                          .addToStart(SizedBox(
                                                              width: 16.0))
                                                          .addToEnd(SizedBox(
                                                              width: 16.0)),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(40.0, 144.0,
                                                          40.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (FFAppState()
                                                              .isLogin ==
                                                          true) {
                                                        context.pushNamed(
                                                            'SelectVehicleTypePage');
                                                      } else {
                                                        context.pushNamed(
                                                            'SignInPage');
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 148.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .gray100,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/plus.svg',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Add car',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.5,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Builder(
                                        builder: (context) {
                                          if ((CarServiceGroup.servicesApiCall
                                                      .serviceDetailsList(
                                                        containerServicesApiResponse
                                                            .jsonBody,
                                                      )
                                                      ?.length !=
                                                  0) ||
                                              (CarServiceGroup.bannersCall
                                                      .success(
                                                    containerBannersResponse
                                                        .jsonBody,
                                                  ) ==
                                                  1) ||
                                              (CarServiceGroup
                                                      .allPackagesApiCall
                                                      .packageDetailsList(
                                                        containerAllPackagesApiResponse
                                                            .jsonBody,
                                                      )
                                                      ?.length !=
                                                  0)) {
                                            return FutureBuilder<
                                                ApiCallResponse>(
                                              future: CarServiceGroup
                                                  .currencyApiCall
                                                  .call(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child:
                                                        HomeListShimmerWidget(),
                                                  );
                                                }
                                                final listViewCurrencyApiResponse =
                                                    snapshot.data!;

                                                return RefreshIndicator(
                                                  key: Key(
                                                      'RefreshIndicator_e77f5jp0'),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  onRefresh: () async {
                                                    safeSetState(() {
                                                      _model
                                                          .clearAllServiceApiCache();
                                                      _model.apiRequestCompleted3 =
                                                          false;
                                                    });
                                                    await _model
                                                        .waitForApiRequestCompleted3();
                                                    safeSetState(() {
                                                      _model
                                                          .clearAllbannerCacheCache();
                                                      _model.apiRequestCompleted1 =
                                                          false;
                                                    });
                                                    await _model
                                                        .waitForApiRequestCompleted1();
                                                    safeSetState(() {
                                                      _model
                                                          .clearAllMaintainCacheCache();
                                                      _model.apiRequestCompleted2 =
                                                          false;
                                                    });
                                                    await _model
                                                        .waitForApiRequestCompleted2();
                                                  },
                                                  child: ListView(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      12.0,
                                                      0,
                                                      0,
                                                    ),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      if (CarServiceGroup
                                                              .servicesApiCall
                                                              .serviceDetailsList(
                                                                containerServicesApiResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.length !=
                                                          0)
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (CarServiceGroup
                                                                    .servicesApiCall
                                                                    .serviceDetailsList(
                                                                      containerServicesApiResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.length !=
                                                                0)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Recommended service',
                                                                      maxLines:
                                                                          1,
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
                                                                        context.pushNamed(
                                                                            'RecommendedServicePage');
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'View all',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: ListView(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                  0,
                                                                  16.0,
                                                                  0,
                                                                  16.0,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                children: [
                                                                  if (CarServiceGroup
                                                                          .servicesApiCall
                                                                          .serviceDetailsList(
                                                                            containerServicesApiResponse.jsonBody,
                                                                          )
                                                                          ?.length !=
                                                                      0)
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final recommendedServiceList = (CarServiceGroup.servicesApiCall
                                                                                    .serviceDetailsList(
                                                                                      containerServicesApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.toList() ??
                                                                                [])
                                                                            .take(6)
                                                                            .toList();

                                                                        return Wrap(
                                                                          spacing:
                                                                              16.0,
                                                                          runSpacing:
                                                                              16.0,
                                                                          alignment:
                                                                              WrapAlignment.start,
                                                                          crossAxisAlignment:
                                                                              WrapCrossAlignment.start,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          runAlignment:
                                                                              WrapAlignment.start,
                                                                          verticalDirection:
                                                                              VerticalDirection.down,
                                                                          clipBehavior:
                                                                              Clip.none,
                                                                          children: List.generate(
                                                                              recommendedServiceList.length,
                                                                              (recommendedServiceListIndex) {
                                                                            final recommendedServiceListItem =
                                                                                recommendedServiceList[recommendedServiceListIndex];
                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
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
                                                                                  if (MediaQuery.sizeOf(context).width < 810.0) {
                                                                                    return ((MediaQuery.sizeOf(context).width - 64) * 1 / 3);
                                                                                  } else if ((MediaQuery.sizeOf(context).width >= 810.0) && (MediaQuery.sizeOf(context).width < 1280.0)) {
                                                                                    return ((MediaQuery.sizeOf(context).width - 96) * 1 / 5);
                                                                                  } else if (MediaQuery.sizeOf(context).width >= 1280.0) {
                                                                                    return ((MediaQuery.sizeOf(context).width - 144) * 1 / 8);
                                                                                  } else {
                                                                                    return ((MediaQuery.sizeOf(context).width - 144) * 1 / 8);
                                                                                  }
                                                                                }(),
                                                                                height: 142.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 91.0,
                                                                                      height: 91.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                        child: CachedNetworkImage(
                                                                                          fadeInDuration: Duration(milliseconds: 200),
                                                                                          fadeOutDuration: Duration(milliseconds: 200),
                                                                                          imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
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
                                                                                      textAlign: TextAlign.center,
                                                                                      maxLines: 2,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'SF Pro Display',
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: false,
                                                                                            lineHeight: 1.2,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      if (CarServiceGroup
                                                              .bannersCall
                                                              .success(
                                                            containerBannersResponse
                                                                .jsonBody,
                                                          ) ==
                                                          1)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      24.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (CarServiceGroup
                                                                      .bannersCall
                                                                      .success(
                                                                    containerBannersResponse
                                                                        .jsonBody,
                                                                  ) ==
                                                                  1)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final bannerList = CarServiceGroup
                                                                              .bannersCall
                                                                              .bannerDetailsList(
                                                                                containerBannersResponse.jsonBody,
                                                                              )
                                                                              ?.toList() ??
                                                                          [];

                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            140.0,
                                                                        child: CarouselSlider
                                                                            .builder(
                                                                          itemCount:
                                                                              bannerList.length,
                                                                          itemBuilder: (context,
                                                                              bannerListIndex,
                                                                              _) {
                                                                            final bannerListItem =
                                                                                bannerList[bannerListIndex];
                                                                            return Visibility(
                                                                              visible: bannerListItem != null,
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    'BannerPage',
                                                                                    queryParameters: {
                                                                                      'serviceId': serializeParam(
                                                                                        getJsonField(
                                                                                          bannerListItem,
                                                                                          r'''$.serviceId._id''',
                                                                                        ).toString(),
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'name': serializeParam(
                                                                                        getJsonField(
                                                                                          bannerListItem,
                                                                                          r'''$.serviceId.name''',
                                                                                        ).toString(),
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                  child: CachedNetworkImage(
                                                                                    fadeInDuration: Duration(milliseconds: 200),
                                                                                    fadeOutDuration: Duration(milliseconds: 200),
                                                                                    imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                      bannerListItem,
                                                                                      r'''$.image''',
                                                                                    ).toString()}',
                                                                                    width: double.infinity,
                                                                                    height: 140.0,
                                                                                    fit: BoxFit.cover,
                                                                                    alignment: Alignment(-1.0, -1.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          carouselController: _model.carouselController ??=
                                                                              CarouselSliderController(),
                                                                          options:
                                                                              CarouselOptions(
                                                                            initialPage:
                                                                                max(0, min(1, bannerList.length - 1)),
                                                                            viewportFraction:
                                                                                0.85,
                                                                            disableCenter:
                                                                                true,
                                                                            enlargeCenterPage:
                                                                                true,
                                                                            enlargeFactor:
                                                                                0.25,
                                                                            enableInfiniteScroll:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            autoPlay:
                                                                                true,
                                                                            autoPlayAnimationDuration:
                                                                                Duration(milliseconds: 400),
                                                                            autoPlayInterval:
                                                                                Duration(milliseconds: (400 + 2000)),
                                                                            autoPlayCurve:
                                                                                Curves.linear,
                                                                            pauseAutoPlayInFiniteScroll:
                                                                                true,
                                                                            onPageChanged:
                                                                                (index, _) async {
                                                                              _model.carouselCurrentIndex = index;

                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              if (CarServiceGroup
                                                                      .bannersCall
                                                                      .success(
                                                                    containerBannersResponse
                                                                        .jsonBody,
                                                                  ) ==
                                                                  1)
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final bannerIndexList = CarServiceGroup
                                                                            .bannersCall
                                                                            .bannerDetailsList(
                                                                              containerBannersResponse.jsonBody,
                                                                            )
                                                                            ?.toList() ??
                                                                        [];

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: List.generate(
                                                                          bannerIndexList
                                                                              .length,
                                                                          (bannerIndexListIndex) {
                                                                        final bannerIndexListItem =
                                                                            bannerIndexList[bannerIndexListIndex];
                                                                        return Container(
                                                                          width:
                                                                              8.0,
                                                                          height:
                                                                              8.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: _model.carouselCurrentIndex == bannerIndexListIndex
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).gray300,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                        );
                                                                      }).divide(SizedBox(
                                                                          width:
                                                                              8.0)),
                                                                    );
                                                                  },
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (CarServiceGroup
                                                              .allPackagesApiCall
                                                              .packageDetailsList(
                                                                containerAllPackagesApiResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.length !=
                                                          0)
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (CarServiceGroup
                                                                    .allPackagesApiCall
                                                                    .success(
                                                                  containerAllPackagesApiResponse
                                                                      .jsonBody,
                                                                ) ==
                                                                1)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Maintain your car with',
                                                                      maxLines:
                                                                          1,
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
                                                                        context.pushNamed(
                                                                            'MaintainYourCarPage');
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'View all',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            if (CarServiceGroup
                                                                    .allPackagesApiCall
                                                                    .success(
                                                                  containerAllPackagesApiResponse
                                                                      .jsonBody,
                                                                ) ==
                                                                1)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        16.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final maintainYourCarList = (CarServiceGroup.allPackagesApiCall
                                                                                .packageDetailsList(
                                                                                  containerAllPackagesApiResponse.jsonBody,
                                                                                )
                                                                                ?.toList() ??
                                                                            [])
                                                                        .take(3)
                                                                        .toList();

                                                                    return SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            maintainYourCarList.length,
                                                                            (maintainYourCarListIndex) {
                                                                          final maintainYourCarListItem =
                                                                              maintainYourCarList[maintainYourCarListIndex];
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
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
                                                                                  'packageName': serializeParam(
                                                                                    getJsonField(
                                                                                      maintainYourCarListItem,
                                                                                      r'''$.title''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'packageImage': serializeParam(
                                                                                    '${FFAppConstants.imageUrl}${getJsonField(
                                                                                      maintainYourCarListItem,
                                                                                      r'''$.image''',
                                                                                    ).toString()}',
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
                                                                                  'serviceName': serializeParam(
                                                                                    getJsonField(
                                                                                      maintainYourCarListItem,
                                                                                      r'''$.serviceDetails.name''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'serviceImage': serializeParam(
                                                                                    getJsonField(
                                                                                      maintainYourCarListItem,
                                                                                      r'''$.serviceDetails.image''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'currencySymbol': serializeParam(
                                                                                    CarServiceGroup.currencyApiCall.currency(
                                                                                      listViewCurrencyApiResponse.jsonBody,
                                                                                    ),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 320.0,
                                                                              height: 345.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(16.0),
                                                                                        topRight: Radius.circular(16.0),
                                                                                      ),
                                                                                      child: CachedNetworkImage(
                                                                                        fadeInDuration: Duration(milliseconds: 200),
                                                                                        fadeOutDuration: Duration(milliseconds: 200),
                                                                                        imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                          maintainYourCarListItem,
                                                                                          r'''$.image''',
                                                                                        ).toString()}',
                                                                                        width: double.infinity,
                                                                                        height: 174.0,
                                                                                        fit: BoxFit.cover,
                                                                                        alignment: Alignment(-1.0, -1.0),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              maintainYourCarListItem,
                                                                                              r'''$.title''',
                                                                                            ).toString(),
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'SF Pro Display',
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: false,
                                                                                                  lineHeight: 1.5,
                                                                                                ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                                  child: custom_widgets.GetCurrencySymboolBold(
                                                                                                    width: 15.0,
                                                                                                    height: 20.0,
                                                                                                    isSimbool: CarServiceGroup.currencyApiCall.currency(
                                                                                                      listViewCurrencyApiResponse.jsonBody,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 18.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                  maintainYourCarListItem,
                                                                                                  r'''$.price''',
                                                                                                ).toString(),
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'SF Pro Display',
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: custom_widgets.ReadMoreHtml(
                                                                                                  width: double.infinity,
                                                                                                  height: 50.0,
                                                                                                  htmlContent: getJsonField(
                                                                                                    maintainYourCarListItem,
                                                                                                    r'''$.description''',
                                                                                                  ).toString(),
                                                                                                  maxLength: 50,
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 1.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 8.0),
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(26.0, 12.0, 26.0, 12.0),
                                                                                                      child: Text(
                                                                                                        'Book now',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 1.0)).addToStart(SizedBox(height: 2.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }).divide(SizedBox(width: 16.0)).addToStart(SizedBox(width: 16.0)).addToEnd(SizedBox(
                                                                            width:
                                                                                16.0)),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            return Container(
                                              width: double.infinity,
                                              height: 310.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        26.0, 0.0, 26.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/No_Service_Yet.png',
                                                        width: 108.0,
                                                        height: 108.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  24.0),
                                                      child: Text(
                                                        'No service yet!',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'If so, you can call the service center to check on the status.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                  ],
                                                ),
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
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
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
    );
  }
}
