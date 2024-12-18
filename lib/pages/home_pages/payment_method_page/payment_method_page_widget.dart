import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/payment_method_shimmer/payment_method_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'payment_method_page_model.dart';
export 'payment_method_page_model.dart';

class PaymentMethodPageWidget extends StatefulWidget {
  const PaymentMethodPageWidget({
    super.key,
    required this.total,
    required this.packageId,
    required this.packageTitle,
    required this.packageImage,
    required this.packagePrice,
    required this.addressId,
    required this.type,
    required this.street,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.country,
    required this.vehicleId,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
    required this.bookingDate,
    required this.bookingTime,
    required this.subTotal,
    required this.vat,
    this.couponCode,
    this.couponType,
    this.couponAmount,
    required this.currencySymbol,
  });

  final double? total;
  final String? packageId;
  final String? packageTitle;
  final String? packageImage;
  final double? packagePrice;
  final String? addressId;
  final String? type;
  final String? street;
  final String? city;
  final String? state;
  final String? zipcode;
  final String? country;
  final String? vehicleId;
  final String? vehicleName;
  final String? vehicleNumber;
  final String? serviceId;
  final String? serviceName;
  final String? serviceImage;
  final String? bookingDate;
  final String? bookingTime;
  final double? subTotal;
  final double? vat;
  final String? couponCode;
  final String? couponType;
  final double? couponAmount;
  final String? currencySymbol;

  @override
  State<PaymentMethodPageWidget> createState() =>
      _PaymentMethodPageWidgetState();
}

class _PaymentMethodPageWidgetState extends State<PaymentMethodPageWidget> {
  late PaymentMethodPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodPageModel());
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
            future: CarServiceGroup.paymentGatewayApiCall.call(
              token: FFAppState().token,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: PaymentMethodShimmerWidget(),
                );
              }
              final columnPaymentGatewayApiResponse = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.customCenterAppbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CustomCenterAppbarWidget(
                      title: 'Payment method',
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
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.selectPaymentIndex = 0;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 59.0,
                                                    height: 59.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/paypal_ic.svg',
                                                        width: 43.0,
                                                        height: 43.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Paypal',
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
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model
                                                              .selectPaymentIndex ==
                                                          0) {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/radio_button_fill.svg',
                                                            width: 32.0,
                                                            height: 32.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      } else {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/radio_button.svg',
                                                            width: 32.0,
                                                            height: 32.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.selectPaymentIndex = 1;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 59.0,
                                                    height: 59.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/stripe.png',
                                                        width: 43.0,
                                                        height: 43.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Stripe',
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
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model
                                                              .selectPaymentIndex ==
                                                          1) {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/radio_button_fill.svg',
                                                            width: 32.0,
                                                            height: 32.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      } else {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/radio_button.svg',
                                                            width: 32.0,
                                                            height: 32.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.selectPaymentIndex = 2;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 59.0,
                                                    height: 59.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/razorPay_1.png',
                                                        width: 43.0,
                                                        height: 43.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Razorpay',
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
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model
                                                              .selectPaymentIndex ==
                                                          2) {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/radio_button_fill.svg',
                                                            width: 32.0,
                                                            height: 32.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      } else {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/radio_button.svg',
                                                            width: 32.0,
                                                            height: 32.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'PaymentGatewayPage',
                                        queryParameters: {
                                          'total': serializeParam(
                                            widget!.total,
                                            ParamType.double,
                                          ),
                                          'paymentToName': serializeParam(
                                            widget!.packageTitle,
                                            ParamType.String,
                                          ),
                                          'paymentMethod': serializeParam(
                                            () {
                                              if (_model.selectPaymentIndex ==
                                                  0) {
                                                return 'Paypal';
                                              } else if (_model
                                                      .selectPaymentIndex ==
                                                  1) {
                                                return 'Stripe';
                                              } else {
                                                return 'RazorPay';
                                              }
                                            }(),
                                            ParamType.String,
                                          ),
                                          'stripeSecretKey': serializeParam(
                                            CarServiceGroup
                                                .paymentGatewayApiCall
                                                .stripeSecretKey(
                                              columnPaymentGatewayApiResponse
                                                  .jsonBody,
                                            ),
                                            ParamType.String,
                                          ),
                                          'stripePublishableKey':
                                              serializeParam(
                                            CarServiceGroup
                                                .paymentGatewayApiCall
                                                .stripePublishableKey(
                                              columnPaymentGatewayApiResponse
                                                  .jsonBody,
                                            ),
                                            ParamType.String,
                                          ),
                                          'addressId': serializeParam(
                                            widget!.addressId,
                                            ParamType.String,
                                          ),
                                          'addressType': serializeParam(
                                            widget!.type,
                                            ParamType.String,
                                          ),
                                          'addressStreet': serializeParam(
                                            widget!.street,
                                            ParamType.String,
                                          ),
                                          'addressCity': serializeParam(
                                            widget!.city,
                                            ParamType.String,
                                          ),
                                          'addressState': serializeParam(
                                            widget!.state,
                                            ParamType.String,
                                          ),
                                          'addressZipcode': serializeParam(
                                            widget!.zipcode,
                                            ParamType.String,
                                          ),
                                          'addressCountry': serializeParam(
                                            widget!.country,
                                            ParamType.String,
                                          ),
                                          'vehicleId': serializeParam(
                                            widget!.vehicleId,
                                            ParamType.String,
                                          ),
                                          'vehicleName': serializeParam(
                                            widget!.vehicleName,
                                            ParamType.String,
                                          ),
                                          'vehicleNumber': serializeParam(
                                            widget!.vehicleNumber,
                                            ParamType.String,
                                          ),
                                          'serviceId': serializeParam(
                                            widget!.serviceId,
                                            ParamType.String,
                                          ),
                                          'serviceName': serializeParam(
                                            widget!.serviceName,
                                            ParamType.String,
                                          ),
                                          'serviceImage': serializeParam(
                                            widget!.serviceImage,
                                            ParamType.String,
                                          ),
                                          'packageId': serializeParam(
                                            widget!.packageId,
                                            ParamType.String,
                                          ),
                                          'packageImage': serializeParam(
                                            widget!.packageImage,
                                            ParamType.String,
                                          ),
                                          'bookingDate': serializeParam(
                                            widget!.bookingDate,
                                            ParamType.String,
                                          ),
                                          'bookingTime': serializeParam(
                                            widget!.bookingTime,
                                            ParamType.String,
                                          ),
                                          'subTotal': serializeParam(
                                            widget!.subTotal,
                                            ParamType.double,
                                          ),
                                          'vat': serializeParam(
                                            widget!.vat,
                                            ParamType.double,
                                          ),
                                          'couponCode': serializeParam(
                                            widget!.couponCode,
                                            ParamType.String,
                                          ),
                                          'couponType': serializeParam(
                                            widget!.couponType,
                                            ParamType.String,
                                          ),
                                          'couponAmount': serializeParam(
                                            widget!.couponAmount,
                                            ParamType.double,
                                          ),
                                          'packagePrice': serializeParam(
                                            valueOrDefault<double>(
                                              widget!.packagePrice,
                                              564564564.0,
                                            ),
                                            ParamType.double,
                                          ),
                                          'currencySymbol': serializeParam(
                                            widget!.currencySymbol,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Pay ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
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
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: custom_widgets
                                                    .GetCurrencySymboolBold(
                                                  width: 12.0,
                                                  height: 20.0,
                                                  isSimbool:
                                                      widget!.currencySymbol,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget!.total?.toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
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
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
        ),
      ),
    );
  }
}
