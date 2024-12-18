import '/backend/api_requests/api_calls.dart';
import '/componants/blank_componant/blank_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/check_out_shimmer/check_out_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'checkout_page_model.dart';
export 'checkout_page_model.dart';

class CheckoutPageWidget extends StatefulWidget {
  const CheckoutPageWidget({
    super.key,
    required this.bookingDate,
    required this.packageId,
    required this.packageTitle,
    required this.packageImage,
    required this.packagePrice,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
    required this.bookingTime,
    required this.currencySymbol,
  });

  final String? bookingDate;
  final String? packageId;
  final String? packageTitle;
  final String? packageImage;
  final double? packagePrice;
  final String? serviceId;
  final String? serviceName;
  final String? serviceImage;
  final String? bookingTime;
  final String? currencySymbol;

  @override
  State<CheckoutPageWidget> createState() => _CheckoutPageWidgetState();
}

class _CheckoutPageWidgetState extends State<CheckoutPageWidget> {
  late CheckoutPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: CarServiceGroup.getCouponsApiCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: CheckOutShimmerWidget(),
            ),
          );
        }
        final checkoutPageGetCouponsApiResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future:
                    (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                          ..complete(CarServiceGroup.applyCouponApiCall.call(
                            userId: FFAppState().userId,
                            couponCode: _model.textController.text,
                            token: FFAppState().token,
                          )))
                        .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: CheckOutShimmerWidget(),
                    );
                  }
                  final containerApplyCouponApiResponse = snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: FutureBuilder<ApiCallResponse>(
                      future: CarServiceGroup.standardRateApiCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: CheckOutShimmerWidget(),
                          );
                        }
                        final columnStandardRateApiResponse = snapshot.data!;

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.customCenterAppbarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CustomCenterAppbarWidget(
                                title: 'Checkout',
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
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: ListView(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  16.0,
                                                  0,
                                                  16.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: CarServiceGroup
                                                        .vehicleListApiCall
                                                        .call(
                                                      userId:
                                                          FFAppState().userId,
                                                      token: FFAppState().token,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: Container(
                                                            width: 0.0,
                                                            height: 0.0,
                                                            child:
                                                                BlankComponantWidget(),
                                                          ),
                                                        );
                                                      }
                                                      final containerVehicleListApiResponse =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if (CarServiceGroup
                                                                        .vehicleListApiCall
                                                                        .vehicleDetailsList(
                                                                      containerVehicleListApiResponse
                                                                          .jsonBody,
                                                                    ) !=
                                                                    null &&
                                                                (CarServiceGroup
                                                                        .vehicleListApiCall
                                                                        .vehicleDetailsList(
                                                                  containerVehicleListApiResponse
                                                                      .jsonBody,
                                                                ))!
                                                                    .isNotEmpty) {
                                                              return Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (CarServiceGroup
                                                                              .vehicleListApiCall
                                                                              .vehicleDetailsList(
                                                                                containerVehicleListApiResponse.jsonBody,
                                                                              )
                                                                              ?.where((e) =>
                                                                                  true ==
                                                                                  getJsonField(
                                                                                    e,
                                                                                    r'''$.is_default''',
                                                                                  ))
                                                                              .toList() !=
                                                                          null &&
                                                                      (CarServiceGroup.vehicleListApiCall
                                                                              .vehicleDetailsList(
                                                                                containerVehicleListApiResponse.jsonBody,
                                                                              )
                                                                              ?.where((e) =>
                                                                                  true ==
                                                                                  getJsonField(
                                                                                    e,
                                                                                    r'''$.is_default''',
                                                                                  ))
                                                                              .toList())!
                                                                          .isNotEmpty) {
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: CachedNetworkImage(
                                                                                fadeInDuration: Duration(milliseconds: 200),
                                                                                fadeOutDuration: Duration(milliseconds: 200),
                                                                                imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                  CarServiceGroup.vehicleListApiCall
                                                                                      .vehicleDetailsList(
                                                                                        containerVehicleListApiResponse.jsonBody,
                                                                                      )
                                                                                      ?.where((e) =>
                                                                                          true ==
                                                                                          getJsonField(
                                                                                            e,
                                                                                            r'''$.is_default''',
                                                                                          ))
                                                                                      .toList()
                                                                                      ?.first,
                                                                                  r'''$.vehicleTypeDetails.image''',
                                                                                ).toString()}',
                                                                                width: 68.0,
                                                                                height: 68.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    CarServiceGroup.vehicleListApiCall
                                                                                        .vehicleDetailsList(
                                                                                          containerVehicleListApiResponse.jsonBody,
                                                                                        )!
                                                                                        .where((e) =>
                                                                                            true ==
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.is_default''',
                                                                                            ))
                                                                                        .toList()
                                                                                        .first,
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
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: CachedNetworkImage(
                                                                                fadeInDuration: Duration(milliseconds: 200),
                                                                                fadeOutDuration: Duration(milliseconds: 200),
                                                                                imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                  CarServiceGroup.vehicleListApiCall
                                                                                      .vehicleDetailsList(
                                                                                        containerVehicleListApiResponse.jsonBody,
                                                                                      )
                                                                                      ?.first,
                                                                                  r'''$.vehicleTypeDetails.image''',
                                                                                ).toString()}',
                                                                                width: 68.0,
                                                                                height: 68.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    CarServiceGroup.vehicleListApiCall
                                                                                        .vehicleDetailsList(
                                                                                          containerVehicleListApiResponse.jsonBody,
                                                                                        )!
                                                                                        .first,
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
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                              );
                                                            } else {
                                                              return InkWell(
                                                                splashColor: Colors
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
                                                                  context.pushNamed(
                                                                      'SelectVehicleTypePage');
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children:
                                                                          [
                                                                        Container(
                                                                          width:
                                                                              48.0,
                                                                          height:
                                                                              48.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).gray100,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/images/plus.svg',
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Add car',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                                lineHeight: 1.5,
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
                                                      );
                                                    },
                                                  ),
                                                  FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: CarServiceGroup
                                                        .getAddressApiCall
                                                        .call(
                                                      userId:
                                                          FFAppState().userId,
                                                      token: FFAppState().token,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: Container(
                                                            width: 0.0,
                                                            height: 0.0,
                                                            child:
                                                                BlankComponantWidget(),
                                                          ),
                                                        );
                                                      }
                                                      final containerGetAddressApiResponse =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Address',
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
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (CarServiceGroup.getAddressApiCall.addressDetails(
                                                                                containerGetAddressApiResponse.jsonBody,
                                                                              ) !=
                                                                              null &&
                                                                          (CarServiceGroup.getAddressApiCall.addressDetails(
                                                                            containerGetAddressApiResponse.jsonBody,
                                                                          ))!
                                                                              .isNotEmpty) {
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
                                                                            context.pushNamed('AddressPage');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Change address',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'SF Pro Display',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                  lineHeight: 1.5,
                                                                                ),
                                                                          ),
                                                                        );
                                                                      } else {
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
                                                                            context.pushNamed('AddressPage');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Add address',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'SF Pro Display',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                  lineHeight: 1.5,
                                                                                ),
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              if (CarServiceGroup
                                                                          .getAddressApiCall
                                                                          .addressDetails(
                                                                        containerGetAddressApiResponse
                                                                            .jsonBody,
                                                                      ) !=
                                                                      null &&
                                                                  (CarServiceGroup
                                                                          .getAddressApiCall
                                                                          .addressDetails(
                                                                    containerGetAddressApiResponse
                                                                        .jsonBody,
                                                                  ))!
                                                                      .isNotEmpty)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/location.svg',
                                                                          width:
                                                                              24.0,
                                                                          height:
                                                                              24.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (CarServiceGroup.getAddressApiCall
                                                                                      .addressDetails(
                                                                                        containerGetAddressApiResponse.jsonBody,
                                                                                      )
                                                                                      ?.where((e) =>
                                                                                          true ==
                                                                                          getJsonField(
                                                                                            e,
                                                                                            r'''$.is_default''',
                                                                                          ))
                                                                                      .toList() !=
                                                                                  null &&
                                                                              (CarServiceGroup.getAddressApiCall
                                                                                      .addressDetails(
                                                                                        containerGetAddressApiResponse.jsonBody,
                                                                                      )
                                                                                      ?.where((e) =>
                                                                                          true ==
                                                                                          getJsonField(
                                                                                            e,
                                                                                            r'''$.is_default''',
                                                                                          ))
                                                                                      .toList())!
                                                                                  .isNotEmpty) {
                                                                            return Text(
                                                                              '${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.where((e) =>
                                                                                        true ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.is_default''',
                                                                                        ))
                                                                                    .toList()
                                                                                    ?.first,
                                                                                r'''$.street''',
                                                                              ).toString()},${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.where((e) =>
                                                                                        true ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.is_default''',
                                                                                        ))
                                                                                    .toList()
                                                                                    ?.first,
                                                                                r'''$.city''',
                                                                              ).toString()},${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.where((e) =>
                                                                                        true ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.is_default''',
                                                                                        ))
                                                                                    .toList()
                                                                                    ?.first,
                                                                                r'''$.state''',
                                                                              ).toString()},${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.where((e) =>
                                                                                        true ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.is_default''',
                                                                                        ))
                                                                                    .toList()
                                                                                    ?.first,
                                                                                r'''$.zipcode''',
                                                                              ).toString()},${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.where((e) =>
                                                                                        true ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.is_default''',
                                                                                        ))
                                                                                    .toList()
                                                                                    ?.first,
                                                                                r'''$.country''',
                                                                              ).toString()}',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'SF Pro Display',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            );
                                                                          } else {
                                                                            return Text(
                                                                              '${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.first,
                                                                                r'''$.street''',
                                                                              ).toString()},${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.first,
                                                                                r'''$.city''',
                                                                              ).toString()},${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.first,
                                                                                r'''$.state''',
                                                                              ).toString()},${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.first,
                                                                                r'''$.zipcode''',
                                                                              ).toString()},${getJsonField(
                                                                                CarServiceGroup.getAddressApiCall
                                                                                    .addressDetails(
                                                                                      containerGetAddressApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.first,
                                                                                r'''$.country''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'SF Pro Display',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                            ].divide(SizedBox(
                                                                height: 14.0)),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
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
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  'Date and time',
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
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/calender.svg',
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${widget!.bookingDate} - ${widget!.bookingTime}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
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
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
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
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  'Service included',
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
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget!
                                                                          .packageTitle,
                                                                      'Name',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'SF Pro Display',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
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
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child: custom_widgets
                                                                    .GetCurrencySymbool(
                                                                  width: 15.0,
                                                                  height: 18.0,
                                                                  isSimbool: widget!
                                                                      .currencySymbol,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget!
                                                                      .packagePrice
                                                                      ?.toString(),
                                                                  '0',
                                                                ),
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
                                                                          1.4,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                if (_model
                                                                        .isApplied ==
                                                                    false) {
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textController,
                                                                              focusNode: _model.textFieldFocusNode,
                                                                              onFieldSubmitted: (_) async {
                                                                                if (_model.textController.text != null && _model.textController.text != '') {
                                                                                  _model.applyCouponFunctionCopy = await CarServiceGroup.applyCouponApiCall.call(
                                                                                    userId: FFAppState().userId,
                                                                                    couponCode: _model.textController.text,
                                                                                    token: FFAppState().token,
                                                                                  );

                                                                                  if (CarServiceGroup.applyCouponApiCall.success(
                                                                                        (_model.applyCouponFunctionCopy?.jsonBody ?? ''),
                                                                                      ) ==
                                                                                      1) {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          CarServiceGroup.applyCouponApiCall.message(
                                                                                            (_model.applyCouponFunctionCopy?.jsonBody ?? ''),
                                                                                          )!,
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 2000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                    );
                                                                                    _model.isApplied = true;
                                                                                    _model.showText = true;
                                                                                    safeSetState(() {});
                                                                                    await Future.delayed(const Duration(milliseconds: 2000));
                                                                                    _model.showText = false;
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          CarServiceGroup.applyCouponApiCall.message(
                                                                                            (_model.applyCouponFunctionCopy?.jsonBody ?? ''),
                                                                                          )!,
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 2000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                    );
                                                                                    safeSetState(() {
                                                                                      _model.textController?.clear();
                                                                                    });
                                                                                    _model.showText = true;
                                                                                    safeSetState(() {});
                                                                                    await Future.delayed(const Duration(milliseconds: 2000));
                                                                                    _model.showText = false;
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              autofocus: false,
                                                                              textInputAction: TextInputAction.next,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                hintText: 'Enter Coupon code',
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'SF Pro Display',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: false,
                                                                                      lineHeight: 1.2,
                                                                                    ),
                                                                                errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'SF Pro Display',
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: false,
                                                                                      lineHeight: 1.2,
                                                                                    ),
                                                                                enabledBorder: InputBorder.none,
                                                                                focusedBorder: InputBorder.none,
                                                                                errorBorder: InputBorder.none,
                                                                                focusedErrorBorder: InputBorder.none,
                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 17.0, 16.0, 17.0),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'SF Pro Display',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.2,
                                                                                  ),
                                                                              keyboardType: TextInputType.emailAddress,
                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                              validator: _model.textControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                          InkWell(
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
                                                                              if (_model.textController.text != null && _model.textController.text != '') {
                                                                                _model.applyCouponFunction = await CarServiceGroup.applyCouponApiCall.call(
                                                                                  userId: FFAppState().userId,
                                                                                  couponCode: _model.textController.text,
                                                                                  token: FFAppState().token,
                                                                                );

                                                                                if (CarServiceGroup.applyCouponApiCall.success(
                                                                                      (_model.applyCouponFunction?.jsonBody ?? ''),
                                                                                    ) ==
                                                                                    1) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        CarServiceGroup.applyCouponApiCall.message(
                                                                                          (_model.applyCouponFunction?.jsonBody ?? ''),
                                                                                        )!,
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 2000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  );
                                                                                  _model.isApplied = true;
                                                                                  _model.showText = true;
                                                                                  safeSetState(() {});
                                                                                  await Future.delayed(const Duration(milliseconds: 2000));
                                                                                  _model.showText = false;
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        CarServiceGroup.applyCouponApiCall.message(
                                                                                          (_model.applyCouponFunction?.jsonBody ?? ''),
                                                                                        )!,
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 2000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  );
                                                                                  safeSetState(() {
                                                                                    _model.textController?.clear();
                                                                                  });
                                                                                  _model.showText = true;
                                                                                  safeSetState(() {});
                                                                                  await Future.delayed(const Duration(milliseconds: 2000));
                                                                                  _model.showText = false;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              }

                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                                                                                child: Text(
                                                                                  'Apply',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'SF Pro Display',
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)),
                                                                      ),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          11.0,
                                                                          16.0,
                                                                          11.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              _model.textController.text,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'SF Pro Display',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
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
                                                                              _model.isApplied = false;
                                                                              safeSetState(() {});
                                                                              safeSetState(() => _model.apiRequestCompleter = null);
                                                                              await _model.waitForApiRequestCompleted();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/close.svg',
                                                                                  width: 24.0,
                                                                                  height: 24.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ),
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
                                                              context.pushNamed(
                                                                  'MyCouponPage');
                                                            },
                                                            child: Text(
                                                              'View all',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
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
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                      if (_model.showText ==
                                                          true)
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            CarServiceGroup
                                                                .applyCouponApiCall
                                                                .message(
                                                              (_model.applyCouponFunction
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            'Done',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(height: 3.0)),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Payment summary',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.2,
                                                            ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Cart total',
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
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child: custom_widgets
                                                                          .GetCurrencySymbool(
                                                                        width:
                                                                            15.0,
                                                                        height:
                                                                            18.0,
                                                                        isSimbool:
                                                                            widget!.currencySymbol,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    functions
                                                                        .roundToTwoDecimalPlaces(
                                                                            widget!.packagePrice!)
                                                                        .toString(),
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
                                                                ],
                                                              ),
                                                              if ((CarServiceGroup
                                                                          .applyCouponApiCall
                                                                          .success(
                                                                        (_model.applyCouponFunction?.jsonBody ??
                                                                            ''),
                                                                      ) ==
                                                                      1) &&
                                                                  (_model.isApplied ==
                                                                      true))
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Coupon',
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
                                                                    ),
                                                                    Text(
                                                                      '-',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
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
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            6.0),
                                                                        child: custom_widgets
                                                                            .GetCurrencySymbool(
                                                                          width:
                                                                              15.0,
                                                                          height:
                                                                              18.0,
                                                                          isSimbool:
                                                                              widget!.currencySymbol,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (CarServiceGroup
                                                                            .applyCouponApiCall
                                                                            .success(
                                                                          (_model.applyCouponFunction?.jsonBody ??
                                                                              ''),
                                                                        ) ==
                                                                        1)
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if ('fixed' ==
                                                                              getJsonField(
                                                                                CarServiceGroup.getCouponsApiCall
                                                                                    .couponDetailsList(
                                                                                      checkoutPageGetCouponsApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.where((e) =>
                                                                                        _model.textController.text ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.coupon_code''',
                                                                                        ).toString())
                                                                                    .toList()
                                                                                    ?.first,
                                                                                r'''$.coupon_type''',
                                                                              ).toString()) {
                                                                            return Text(
                                                                              (getJsonField(
                                                                                CarServiceGroup.getCouponsApiCall
                                                                                    .couponDetailsList(
                                                                                      checkoutPageGetCouponsApiResponse.jsonBody,
                                                                                    )!
                                                                                    .where((e) =>
                                                                                        _model.textController.text ==
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.coupon_code''',
                                                                                        ).toString())
                                                                                    .toList()
                                                                                    .first,
                                                                                r'''$.coupon_amount''',
                                                                              ).toDouble())
                                                                                  .toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'SF Pro Display',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            );
                                                                          } else {
                                                                            return Text(
                                                                              functions
                                                                                  .roundToTwoDecimalPlaces(functions.calculatePercentage(
                                                                                      widget!.packagePrice!,
                                                                                      getJsonField(
                                                                                        CarServiceGroup.getCouponsApiCall
                                                                                            .couponDetailsList(
                                                                                              checkoutPageGetCouponsApiResponse.jsonBody,
                                                                                            )!
                                                                                            .where((e) =>
                                                                                                _model.textController.text ==
                                                                                                getJsonField(
                                                                                                  e,
                                                                                                  r'''$.coupon_code''',
                                                                                                ).toString())
                                                                                            .toList()
                                                                                            .first,
                                                                                        r'''$.coupon_amount''',
                                                                                      ).toDouble()))
                                                                                  .toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'SF Pro Display',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                  ],
                                                                ),
                                                              if (valueOrDefault<
                                                                          String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        'Rate',
                                                                      ) !=
                                                                      null &&
                                                                  valueOrDefault<
                                                                          String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        'Rate',
                                                                      ) !=
                                                                      '')
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            CarServiceGroup.standardRateApiCall.taxName(
                                                                              columnStandardRateApiResponse.jsonBody,
                                                                            ),
                                                                            'Tax',
                                                                          ),
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
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        '+',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            6.0),
                                                                        child: custom_widgets
                                                                            .GetCurrencySymbool(
                                                                          width:
                                                                              15.0,
                                                                          height:
                                                                              18.0,
                                                                          isSimbool:
                                                                              widget!.currencySymbol,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (_model.isApplied ==
                                                                            true) {
                                                                          return Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (CarServiceGroup.applyCouponApiCall.success(
                                                                                    (_model.applyCouponFunction?.jsonBody ?? ''),
                                                                                  ) ==
                                                                                  1) {
                                                                                return Builder(
                                                                                  builder: (context) {
                                                                                    if ('fixed' ==
                                                                                        getJsonField(
                                                                                          CarServiceGroup.getCouponsApiCall
                                                                                              .couponDetailsList(
                                                                                                checkoutPageGetCouponsApiResponse.jsonBody,
                                                                                              )
                                                                                              ?.where((e) =>
                                                                                                  _model.textController.text ==
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.coupon_code''',
                                                                                                  ).toString())
                                                                                              .toList()
                                                                                              ?.first,
                                                                                          r'''$.coupon_type''',
                                                                                        ).toString()) {
                                                                                      return Text(
                                                                                        functions
                                                                                            .roundToTwoDecimalPlaces(functions.calculatePercentageOfDifference(
                                                                                                widget!.packagePrice!,
                                                                                                valueOrDefault<int>(
                                                                                                  getJsonField(
                                                                                                    CarServiceGroup.getCouponsApiCall
                                                                                                        .couponDetailsList(
                                                                                                          checkoutPageGetCouponsApiResponse.jsonBody,
                                                                                                        )
                                                                                                        ?.where((e) =>
                                                                                                            _model.textController.text ==
                                                                                                            getJsonField(
                                                                                                              e,
                                                                                                              r'''$.coupon_code''',
                                                                                                            ).toString())
                                                                                                        .toList()
                                                                                                        ?.first,
                                                                                                    r'''$.coupon_amount''',
                                                                                                  ),
                                                                                                  0,
                                                                                                ).toDouble(),
                                                                                                valueOrDefault<String>(
                                                                                                  CarServiceGroup.standardRateApiCall.taxRate(
                                                                                                    columnStandardRateApiResponse.jsonBody,
                                                                                                  ),
                                                                                                  'Rate',
                                                                                                )))
                                                                                            .toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'SF Pro Display',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                              lineHeight: 1.2,
                                                                                            ),
                                                                                      );
                                                                                    } else {
                                                                                      return Text(
                                                                                        functions
                                                                                            .roundToTwoDecimalPlaces(functions.calculatePercentageOfResult(
                                                                                                widget!.packagePrice!,
                                                                                                valueOrDefault<int>(
                                                                                                  getJsonField(
                                                                                                    CarServiceGroup.getCouponsApiCall
                                                                                                        .couponDetailsList(
                                                                                                          checkoutPageGetCouponsApiResponse.jsonBody,
                                                                                                        )
                                                                                                        ?.where((e) =>
                                                                                                            _model.textController.text ==
                                                                                                            getJsonField(
                                                                                                              e,
                                                                                                              r'''$.coupon_code''',
                                                                                                            ).toString())
                                                                                                        .toList()
                                                                                                        ?.first,
                                                                                                    r'''$.coupon_amount''',
                                                                                                  ),
                                                                                                  0,
                                                                                                ).toDouble(),
                                                                                                valueOrDefault<String>(
                                                                                                  CarServiceGroup.standardRateApiCall.taxRate(
                                                                                                    columnStandardRateApiResponse.jsonBody,
                                                                                                  ),
                                                                                                  'Rate',
                                                                                                )))
                                                                                            .toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'SF Pro Display',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                              lineHeight: 1.2,
                                                                                            ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                );
                                                                              } else {
                                                                                return Text(
                                                                                  functions
                                                                                      .roundToTwoDecimalPlaces(functions.calculatePercentageString(
                                                                                          widget!.packagePrice!,
                                                                                          valueOrDefault<String>(
                                                                                            CarServiceGroup.standardRateApiCall.taxRate(
                                                                                              columnStandardRateApiResponse.jsonBody,
                                                                                            ),
                                                                                            'Rate',
                                                                                          )))
                                                                                      .toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'SF Pro Display',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                        lineHeight: 1.2,
                                                                                      ),
                                                                                );
                                                                              }
                                                                            },
                                                                          );
                                                                        } else {
                                                                          return Text(
                                                                            functions
                                                                                .roundToTwoDecimalPlaces(functions.calculatePercentageString(
                                                                                    widget!.packagePrice!,
                                                                                    valueOrDefault<String>(
                                                                                      CarServiceGroup.standardRateApiCall.taxRate(
                                                                                        columnStandardRateApiResponse.jsonBody,
                                                                                      ),
                                                                                      'Rate',
                                                                                    )))
                                                                                .toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'SF Pro Display',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                  lineHeight: 1.2,
                                                                                ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              Divider(
                                                                height: 0.0,
                                                                thickness: 0.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Grand total',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                        isSimbool:
                                                                            widget!.currencySymbol,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (_model
                                                                              .isApplied ==
                                                                          true) {
                                                                        return Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (CarServiceGroup.applyCouponApiCall.success(
                                                                                  (_model.applyCouponFunction?.jsonBody ?? ''),
                                                                                ) ==
                                                                                1) {
                                                                              return Builder(
                                                                                builder: (context) {
                                                                                  if ('fixed' ==
                                                                                      getJsonField(
                                                                                        CarServiceGroup.getCouponsApiCall
                                                                                            .couponDetailsList(
                                                                                              checkoutPageGetCouponsApiResponse.jsonBody,
                                                                                            )
                                                                                            ?.where((e) =>
                                                                                                _model.textController.text ==
                                                                                                getJsonField(
                                                                                                  e,
                                                                                                  r'''$.coupon_code''',
                                                                                                ).toString())
                                                                                            .toList()
                                                                                            ?.first,
                                                                                        r'''$.coupon_type''',
                                                                                      ).toString()) {
                                                                                    return Text(
                                                                                      functions
                                                                                          .roundToTwoDecimalPlaces(functions.fixedCouponPrice(
                                                                                              widget!.packagePrice!,
                                                                                              valueOrDefault<int>(
                                                                                                getJsonField(
                                                                                                  CarServiceGroup.getCouponsApiCall
                                                                                                      .couponDetailsList(
                                                                                                        checkoutPageGetCouponsApiResponse.jsonBody,
                                                                                                      )
                                                                                                      ?.where((e) =>
                                                                                                          _model.textController.text ==
                                                                                                          getJsonField(
                                                                                                            e,
                                                                                                            r'''$.coupon_code''',
                                                                                                          ).toString())
                                                                                                      .toList()
                                                                                                      ?.first,
                                                                                                  r'''$.coupon_amount''',
                                                                                                ),
                                                                                                0,
                                                                                              ).toDouble(),
                                                                                              valueOrDefault<String>(
                                                                                                CarServiceGroup.standardRateApiCall.taxRate(
                                                                                                  columnStandardRateApiResponse.jsonBody,
                                                                                                ),
                                                                                                'Rate',
                                                                                              )))
                                                                                          .toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'SF Pro Display',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: false,
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    );
                                                                                  } else {
                                                                                    return Text(
                                                                                      functions
                                                                                          .roundToTwoDecimalPlaces(functions.percentageCouponPrice(
                                                                                              widget!.packagePrice!,
                                                                                              valueOrDefault<int>(
                                                                                                getJsonField(
                                                                                                  CarServiceGroup.getCouponsApiCall
                                                                                                      .couponDetailsList(
                                                                                                        checkoutPageGetCouponsApiResponse.jsonBody,
                                                                                                      )
                                                                                                      ?.where((e) =>
                                                                                                          _model.textController.text ==
                                                                                                          getJsonField(
                                                                                                            e,
                                                                                                            r'''$.coupon_code''',
                                                                                                          ).toString())
                                                                                                      .toList()
                                                                                                      ?.first,
                                                                                                  r'''$.coupon_amount''',
                                                                                                ),
                                                                                                0,
                                                                                              ).toDouble(),
                                                                                              valueOrDefault<String>(
                                                                                                CarServiceGroup.standardRateApiCall.taxRate(
                                                                                                  columnStandardRateApiResponse.jsonBody,
                                                                                                ),
                                                                                                'Rate',
                                                                                              )))
                                                                                          .toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'SF Pro Display',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: false,
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                              );
                                                                            } else {
                                                                              return Text(
                                                                                functions.roundToTwoDecimalPlaces(widget!.packagePrice!).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'SF Pro Display',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: false,
                                                                                      lineHeight: 1.5,
                                                                                    ),
                                                                              );
                                                                            }
                                                                          },
                                                                        );
                                                                      } else {
                                                                        return Text(
                                                                          functions
                                                                              .roundToTwoDecimalPlaces(functions.additionAmountVat(
                                                                                  widget!.packagePrice!,
                                                                                  valueOrDefault<String>(
                                                                                    CarServiceGroup.standardRateApiCall.taxRate(
                                                                                      columnStandardRateApiResponse.jsonBody,
                                                                                    ),
                                                                                    '0',
                                                                                  )))
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: false,
                                                                                lineHeight: 1.5,
                                                                              ),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 16.0)),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 24.0)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 16.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.getAddressFunction =
                                                    await CarServiceGroup
                                                        .getAddressApiCall
                                                        .call(
                                                  userId: FFAppState().userId,
                                                  token: FFAppState().token,
                                                );

                                                if (CarServiceGroup
                                                            .getAddressApiCall
                                                            .addressDetails(
                                                          (_model.getAddressFunction
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (CarServiceGroup
                                                            .getAddressApiCall
                                                            .addressDetails(
                                                      (_model.getAddressFunction
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty) {
                                                  _model.vehicleListfunction =
                                                      await CarServiceGroup
                                                          .vehicleListApiCall
                                                          .call(
                                                    userId: FFAppState().userId,
                                                    token: FFAppState().token,
                                                  );

                                                  if (CarServiceGroup
                                                              .vehicleListApiCall
                                                              .vehicleDetailsList(
                                                            (_model.vehicleListfunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      (CarServiceGroup
                                                              .vehicleListApiCall
                                                              .vehicleDetailsList(
                                                        (_model.vehicleListfunction
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!
                                                          .isNotEmpty) {
                                                    context.pushNamed(
                                                      'PaymentMethodPage',
                                                      queryParameters: {
                                                        'total': serializeParam(
                                                          () {
                                                            if ((CarServiceGroup
                                                                        .applyCouponApiCall
                                                                        .success(
                                                                      (_model.applyCouponFunction
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) ==
                                                                    1) &&
                                                                ('fixed' ==
                                                                    getJsonField(
                                                                      CarServiceGroup
                                                                          .getCouponsApiCall
                                                                          .couponDetailsList(
                                                                            checkoutPageGetCouponsApiResponse.jsonBody,
                                                                          )
                                                                          ?.where((e) =>
                                                                              _model.textController.text ==
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.coupon_code''',
                                                                              ).toString())
                                                                          .toList()
                                                                          ?.first,
                                                                      r'''$.coupon_type''',
                                                                    )
                                                                        .toString()) &&
                                                                (_model.isApplied ==
                                                                    true)) {
                                                              return functions.roundToTwoDecimalPlaces(functions
                                                                  .fixedCouponPrice(
                                                                      widget!
                                                                          .packagePrice!,
                                                                      valueOrDefault<
                                                                          int>(
                                                                        getJsonField(
                                                                          CarServiceGroup
                                                                              .getCouponsApiCall
                                                                              .couponDetailsList(
                                                                                checkoutPageGetCouponsApiResponse.jsonBody,
                                                                              )
                                                                              ?.where((e) =>
                                                                                  _model.textController.text ==
                                                                                  getJsonField(
                                                                                    e,
                                                                                    r'''$.coupon_code''',
                                                                                  ).toString())
                                                                              .toList()
                                                                              ?.first,
                                                                          r'''$.coupon_amount''',
                                                                        ),
                                                                        0,
                                                                      ).toDouble(),
                                                                      valueOrDefault<String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        'Rate',
                                                                      )));
                                                            } else if ((CarServiceGroup
                                                                        .applyCouponApiCall
                                                                        .success(
                                                                      (_model.applyCouponFunction
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) ==
                                                                    1) &&
                                                                ('percentage' ==
                                                                    getJsonField(
                                                                      CarServiceGroup
                                                                          .getCouponsApiCall
                                                                          .couponDetailsList(
                                                                            checkoutPageGetCouponsApiResponse.jsonBody,
                                                                          )
                                                                          ?.where((e) =>
                                                                              _model.textController.text ==
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.coupon_code''',
                                                                              ).toString())
                                                                          .toList()
                                                                          ?.first,
                                                                      r'''$.coupon_type''',
                                                                    )
                                                                        .toString()) &&
                                                                (_model.isApplied ==
                                                                    true)) {
                                                              return functions.roundToTwoDecimalPlaces(functions
                                                                  .percentageCouponPrice(
                                                                      widget!
                                                                          .packagePrice!,
                                                                      valueOrDefault<
                                                                          int>(
                                                                        getJsonField(
                                                                          CarServiceGroup
                                                                              .getCouponsApiCall
                                                                              .couponDetailsList(
                                                                                checkoutPageGetCouponsApiResponse.jsonBody,
                                                                              )
                                                                              ?.where((e) =>
                                                                                  _model.textController.text ==
                                                                                  getJsonField(
                                                                                    e,
                                                                                    r'''$.coupon_code''',
                                                                                  ).toString())
                                                                              .toList()
                                                                              ?.first,
                                                                          r'''$.coupon_amount''',
                                                                        ),
                                                                        0,
                                                                      ).toDouble(),
                                                                      valueOrDefault<String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        'Rate',
                                                                      )));
                                                            } else if (_model
                                                                    .isApplied ==
                                                                false) {
                                                              return functions.roundToTwoDecimalPlaces(functions
                                                                  .additionAmountVat(
                                                                      widget!
                                                                          .packagePrice!,
                                                                      valueOrDefault<
                                                                          String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        '0',
                                                                      )));
                                                            } else {
                                                              return functions.roundToTwoDecimalPlaces(functions
                                                                  .additionAmountVat(
                                                                      widget!
                                                                          .packagePrice!,
                                                                      valueOrDefault<
                                                                          String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        '0',
                                                                      )));
                                                            }
                                                          }(),
                                                          ParamType.double,
                                                        ),
                                                        'packageId':
                                                            serializeParam(
                                                          widget!.packageId,
                                                          ParamType.String,
                                                        ),
                                                        'packageTitle':
                                                            serializeParam(
                                                          widget!.packageTitle,
                                                          ParamType.String,
                                                        ),
                                                        'packageImage':
                                                            serializeParam(
                                                          widget!.packageImage,
                                                          ParamType.String,
                                                        ),
                                                        'packagePrice':
                                                            serializeParam(
                                                          functions
                                                              .roundToTwoDecimalPlaces(
                                                                  widget!
                                                                      .packagePrice!),
                                                          ParamType.double,
                                                        ),
                                                        'addressId':
                                                            serializeParam(
                                                          CarServiceGroup
                                                                  .getAddressApiCall
                                                                  .addressDetails(
                                                                    (_model.getAddressFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.id''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.id''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'type': serializeParam(
                                                          CarServiceGroup
                                                                  .getAddressApiCall
                                                                  .addressDetails(
                                                                    (_model.getAddressFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.type''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.type''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'street':
                                                            serializeParam(
                                                          CarServiceGroup
                                                                  .getAddressApiCall
                                                                  .addressDetails(
                                                                    (_model.getAddressFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.street''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.street''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'city': serializeParam(
                                                          CarServiceGroup
                                                                  .getAddressApiCall
                                                                  .addressDetails(
                                                                    (_model.getAddressFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.city''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.city''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'state': serializeParam(
                                                          CarServiceGroup
                                                                  .getAddressApiCall
                                                                  .addressDetails(
                                                                    (_model.getAddressFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.state''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.state''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'zipcode':
                                                            serializeParam(
                                                          CarServiceGroup
                                                                  .getAddressApiCall
                                                                  .addressDetails(
                                                                    (_model.getAddressFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.zipcode''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.zipcode''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'country':
                                                            serializeParam(
                                                          CarServiceGroup
                                                                  .getAddressApiCall
                                                                  .addressDetails(
                                                                    (_model.getAddressFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.country''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .getAddressApiCall
                                                                      .addressDetails(
                                                                        (_model.getAddressFunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.country''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'vehicleId':
                                                            serializeParam(
                                                          CarServiceGroup
                                                                  .vehicleListApiCall
                                                                  .vehicleDetailsList(
                                                                    (_model.vehicleListfunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .vehicleListApiCall
                                                                      .vehicleDetailsList(
                                                                        (_model.vehicleListfunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.id''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .vehicleListApiCall
                                                                      .vehicleDetailsList(
                                                                        (_model.vehicleListfunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.id''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'vehicleName':
                                                            serializeParam(
                                                          CarServiceGroup
                                                                  .vehicleListApiCall
                                                                  .vehicleDetailsList(
                                                                    (_model.vehicleListfunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .vehicleListApiCall
                                                                      .vehicleDetailsList(
                                                                        (_model.vehicleListfunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.vehicle_name''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .vehicleListApiCall
                                                                      .vehicleDetailsList(
                                                                        (_model.vehicleListfunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.vehicle_name''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'vehicleNumber':
                                                            serializeParam(
                                                          CarServiceGroup
                                                                  .vehicleListApiCall
                                                                  .vehicleDetailsList(
                                                                    (_model.vehicleListfunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .where((e) =>
                                                                      true ==
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.is_default''',
                                                                      ))
                                                                  .toList()
                                                                  .isNotEmpty
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .vehicleListApiCall
                                                                      .vehicleDetailsList(
                                                                        (_model.vehicleListfunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.where((e) =>
                                                                          true ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.is_default''',
                                                                          ))
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.vehicle_number''',
                                                                ).toString()
                                                              : getJsonField(
                                                                  CarServiceGroup
                                                                      .vehicleListApiCall
                                                                      .vehicleDetailsList(
                                                                        (_model.vehicleListfunction?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.first,
                                                                  r'''$.vehicle_number''',
                                                                ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'serviceId':
                                                            serializeParam(
                                                          widget!.serviceId,
                                                          ParamType.String,
                                                        ),
                                                        'serviceName':
                                                            serializeParam(
                                                          widget!.serviceName,
                                                          ParamType.String,
                                                        ),
                                                        'serviceImage':
                                                            serializeParam(
                                                          widget!.serviceImage,
                                                          ParamType.String,
                                                        ),
                                                        'bookingDate':
                                                            serializeParam(
                                                          widget!.bookingDate,
                                                          ParamType.String,
                                                        ),
                                                        'bookingTime':
                                                            serializeParam(
                                                          functions
                                                              .extractStartTime(
                                                                  widget!
                                                                      .bookingTime!),
                                                          ParamType.String,
                                                        ),
                                                        'subTotal':
                                                            serializeParam(
                                                          functions
                                                              .roundToTwoDecimalPlaces(
                                                                  widget!
                                                                      .packagePrice!),
                                                          ParamType.double,
                                                        ),
                                                        'vat': serializeParam(
                                                          () {
                                                            if ((CarServiceGroup
                                                                        .applyCouponApiCall
                                                                        .success(
                                                                      (_model.applyCouponFunction
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) ==
                                                                    1) &&
                                                                ('fixed' ==
                                                                    getJsonField(
                                                                      CarServiceGroup
                                                                          .getCouponsApiCall
                                                                          .couponDetailsList(
                                                                            checkoutPageGetCouponsApiResponse.jsonBody,
                                                                          )
                                                                          ?.where((e) =>
                                                                              _model.textController.text ==
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.coupon_code''',
                                                                              ).toString())
                                                                          .toList()
                                                                          ?.first,
                                                                      r'''$.coupon_type''',
                                                                    )
                                                                        .toString()) &&
                                                                (_model.isApplied ==
                                                                    true)) {
                                                              return functions.roundToTwoDecimalPlaces(functions
                                                                  .calculatePercentageOfDifference(
                                                                      widget!
                                                                          .packagePrice!,
                                                                      valueOrDefault<
                                                                          int>(
                                                                        getJsonField(
                                                                          CarServiceGroup
                                                                              .getCouponsApiCall
                                                                              .couponDetailsList(
                                                                                checkoutPageGetCouponsApiResponse.jsonBody,
                                                                              )
                                                                              ?.where((e) =>
                                                                                  _model.textController.text ==
                                                                                  getJsonField(
                                                                                    e,
                                                                                    r'''$.coupon_code''',
                                                                                  ).toString())
                                                                              .toList()
                                                                              ?.first,
                                                                          r'''$.coupon_amount''',
                                                                        ),
                                                                        0,
                                                                      ).toDouble(),
                                                                      valueOrDefault<String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        'Rate',
                                                                      )));
                                                            } else if ((CarServiceGroup
                                                                        .applyCouponApiCall
                                                                        .success(
                                                                      (_model.applyCouponFunction
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) ==
                                                                    1) &&
                                                                ('percentage' ==
                                                                    getJsonField(
                                                                      CarServiceGroup
                                                                          .getCouponsApiCall
                                                                          .couponDetailsList(
                                                                            checkoutPageGetCouponsApiResponse.jsonBody,
                                                                          )
                                                                          ?.where((e) =>
                                                                              _model.textController.text ==
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.coupon_code''',
                                                                              ).toString())
                                                                          .toList()
                                                                          ?.first,
                                                                      r'''$.coupon_type''',
                                                                    )
                                                                        .toString()) &&
                                                                (_model.isApplied ==
                                                                    true)) {
                                                              return functions.roundToTwoDecimalPlaces(functions
                                                                  .calculatePercentageOfResult(
                                                                      widget!
                                                                          .packagePrice!,
                                                                      valueOrDefault<
                                                                          int>(
                                                                        getJsonField(
                                                                          CarServiceGroup
                                                                              .getCouponsApiCall
                                                                              .couponDetailsList(
                                                                                checkoutPageGetCouponsApiResponse.jsonBody,
                                                                              )
                                                                              ?.where((e) =>
                                                                                  _model.textController.text ==
                                                                                  getJsonField(
                                                                                    e,
                                                                                    r'''$.coupon_code''',
                                                                                  ).toString())
                                                                              .toList()
                                                                              ?.first,
                                                                          r'''$.coupon_amount''',
                                                                        ),
                                                                        0,
                                                                      ).toDouble(),
                                                                      valueOrDefault<String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        'Rate',
                                                                      )));
                                                            } else if (_model
                                                                    .isApplied ==
                                                                false) {
                                                              return functions.roundToTwoDecimalPlaces(functions
                                                                  .calculatePercentageString(
                                                                      widget!
                                                                          .packagePrice!,
                                                                      valueOrDefault<
                                                                          String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        'Rate',
                                                                      )));
                                                            } else {
                                                              return functions.roundToTwoDecimalPlaces(functions
                                                                  .calculatePercentageString(
                                                                      widget!
                                                                          .packagePrice!,
                                                                      valueOrDefault<
                                                                          String>(
                                                                        CarServiceGroup
                                                                            .standardRateApiCall
                                                                            .taxRate(
                                                                          columnStandardRateApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        'Rate',
                                                                      )));
                                                            }
                                                          }(),
                                                          ParamType.double,
                                                        ),
                                                        'couponCode':
                                                            serializeParam(
                                                          CarServiceGroup
                                                                      .applyCouponApiCall
                                                                      .success(
                                                                    (_model.applyCouponFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) ==
                                                                  1
                                                              ? _model
                                                                  .textController
                                                                  .text
                                                              : '0',
                                                          ParamType.String,
                                                        ),
                                                        'couponType':
                                                            serializeParam(
                                                          CarServiceGroup
                                                                      .applyCouponApiCall
                                                                      .success(
                                                                    (_model.applyCouponFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) ==
                                                                  1
                                                              ? getJsonField(
                                                                  CarServiceGroup
                                                                      .getCouponsApiCall
                                                                      .couponDetailsList(
                                                                        checkoutPageGetCouponsApiResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.where((e) =>
                                                                          _model.textController.text ==
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.coupon_code''',
                                                                          ).toString())
                                                                      .toList()
                                                                      ?.first,
                                                                  r'''$.coupon_type''',
                                                                ).toString()
                                                              : 'Type',
                                                          ParamType.String,
                                                        ),
                                                        'couponAmount':
                                                            serializeParam(
                                                          () {
                                                            if ((CarServiceGroup
                                                                        .applyCouponApiCall
                                                                        .success(
                                                                      (_model.applyCouponFunction
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) ==
                                                                    1) &&
                                                                ('fixed' ==
                                                                    getJsonField(
                                                                      CarServiceGroup
                                                                          .getCouponsApiCall
                                                                          .couponDetailsList(
                                                                            checkoutPageGetCouponsApiResponse.jsonBody,
                                                                          )
                                                                          ?.where((e) =>
                                                                              _model.textController.text ==
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.coupon_code''',
                                                                              ).toString())
                                                                          .toList()
                                                                          ?.first,
                                                                      r'''$.coupon_type''',
                                                                    )
                                                                        .toString()) &&
                                                                (_model.isApplied ==
                                                                    true)) {
                                                              return functions
                                                                  .roundToTwoDecimalPlaces(
                                                                      getJsonField(
                                                                CarServiceGroup
                                                                    .getCouponsApiCall
                                                                    .couponDetailsList(
                                                                      checkoutPageGetCouponsApiResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .where((e) =>
                                                                        _model.textController.text ==
                                                                        getJsonField(
                                                                          e,
                                                                          r'''$.coupon_code''',
                                                                        ).toString())
                                                                    .toList()
                                                                    .first,
                                                                r'''$.coupon_amount''',
                                                              ).toDouble());
                                                            } else if ((CarServiceGroup
                                                                        .applyCouponApiCall
                                                                        .success(
                                                                      (_model.applyCouponFunction
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) ==
                                                                    1) &&
                                                                ('percentage' ==
                                                                    getJsonField(
                                                                      CarServiceGroup
                                                                          .getCouponsApiCall
                                                                          .couponDetailsList(
                                                                            checkoutPageGetCouponsApiResponse.jsonBody,
                                                                          )
                                                                          ?.where((e) =>
                                                                              _model.textController.text ==
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.coupon_code''',
                                                                              ).toString())
                                                                          .toList()
                                                                          ?.first,
                                                                      r'''$.coupon_type''',
                                                                    )
                                                                        .toString()) &&
                                                                (_model.isApplied ==
                                                                    true)) {
                                                              return functions.roundToTwoDecimalPlaces(functions
                                                                  .calculatePercentage(
                                                                      widget!
                                                                          .packagePrice!,
                                                                      getJsonField(
                                                                        CarServiceGroup
                                                                            .getCouponsApiCall
                                                                            .couponDetailsList(
                                                                              checkoutPageGetCouponsApiResponse.jsonBody,
                                                                            )!
                                                                            .where((e) =>
                                                                                _model.textController.text ==
                                                                                getJsonField(
                                                                                  e,
                                                                                  r'''$.coupon_code''',
                                                                                ).toString())
                                                                            .toList()
                                                                            .first,
                                                                        r'''$.coupon_amount''',
                                                                      ).toDouble()));
                                                            } else if (_model
                                                                    .isApplied ==
                                                                false) {
                                                              return 0.0;
                                                            } else {
                                                              return 0.0;
                                                            }
                                                          }(),
                                                          ParamType.double,
                                                        ),
                                                        'currencySymbol':
                                                            serializeParam(
                                                          widget!
                                                              .currencySymbol,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Please enter vehicle list!',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Please enter add address!',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              text: 'Procced to payment',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 56.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.2,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
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
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
