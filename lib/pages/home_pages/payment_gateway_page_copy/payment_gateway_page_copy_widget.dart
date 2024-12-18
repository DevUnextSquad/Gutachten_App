import '/backend/api_requests/api_calls.dart';
import '/componants/blank_componant/blank_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/components/order_success_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/payment_gateway_shimmer/payment_gateway_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'payment_gateway_page_copy_model.dart';
export 'payment_gateway_page_copy_model.dart';

class PaymentGatewayPageCopyWidget extends StatefulWidget {
  const PaymentGatewayPageCopyWidget({
    super.key,
    required this.total,
    required this.paymentToName,
    required this.paymentMethod,
    required this.stripeSecretKey,
    required this.stripePublishableKey,
    required this.addressId,
    required this.addressType,
    required this.addressStreet,
    required this.addressCity,
    required this.addressState,
    required this.addressZipcode,
    required this.addressCountry,
    required this.vehicleId,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
    required this.packageId,
    required this.packageImage,
    required this.bookingDate,
    required this.bookingTime,
    required this.subTotal,
    required this.vat,
    this.couponCode,
    this.couponType,
    this.couponAmount,
    required this.packagePrice,
    required this.currencySymbol,
  });

  final double? total;
  final String? paymentToName;
  final String? paymentMethod;
  final String? stripeSecretKey;
  final String? stripePublishableKey;
  final String? addressId;
  final String? addressType;
  final String? addressStreet;
  final String? addressCity;
  final String? addressState;
  final String? addressZipcode;
  final String? addressCountry;
  final String? vehicleId;
  final String? vehicleName;
  final String? vehicleNumber;
  final String? serviceId;
  final String? serviceName;
  final String? serviceImage;
  final String? packageId;
  final String? packageImage;
  final String? bookingDate;
  final String? bookingTime;
  final double? subTotal;
  final double? vat;
  final String? couponCode;
  final String? couponType;
  final double? couponAmount;
  final double? packagePrice;
  final String? currencySymbol;

  @override
  State<PaymentGatewayPageCopyWidget> createState() =>
      _PaymentGatewayPageCopyWidgetState();
}

class _PaymentGatewayPageCopyWidgetState
    extends State<PaymentGatewayPageCopyWidget> {
  late PaymentGatewayPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentGatewayPageCopyModel());
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
      future: CarServiceGroup.getUserApiCall.call(
        userId: FFAppState().userId,
        token: FFAppState().token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: Container(
                width: 0.0,
                height: 0.0,
                child: BlankComponantWidget(),
              ),
            ),
          );
        }
        final paymentGatewayPageCopyGetUserApiResponse = snapshot.data!;

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
                      child: PaymentGatewayShimmerWidget(),
                    );
                  }
                  final columnPaymentGatewayApiResponse = snapshot.data!;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.customCenterAppbarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomCenterAppbarWidget(
                          title: 'Payment',
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
                                            20.0, 0.0, 20.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            20.0,
                                            0,
                                            20.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 32.0,
                                                    color: Color(0x289A90B8),
                                                    offset: Offset(
                                                      0.0,
                                                      9.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(22.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(20.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Your Secured Payment Detail',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color: Color(0xFFF5F6F9),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Name :',
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
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Text(
                                                                '${CarServiceGroup.getUserApiCall.firstname(
                                                                  paymentGatewayPageCopyGetUserApiResponse
                                                                      .jsonBody,
                                                                )} ${CarServiceGroup.getUserApiCall.lastname(
                                                                  paymentGatewayPageCopyGetUserApiResponse
                                                                      .jsonBody,
                                                                )}',
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
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color: Color(0xFFF5F6F9),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Mobile No :',
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
                                                          ),
                                                          Text(
                                                            '${valueOrDefault<String>(
                                                              CarServiceGroup
                                                                  .getUserApiCall
                                                                  .countrycode(
                                                                paymentGatewayPageCopyGetUserApiResponse
                                                                    .jsonBody,
                                                              ),
                                                              'Country',
                                                            )} ${valueOrDefault<String>(
                                                              CarServiceGroup
                                                                  .getUserApiCall
                                                                  .phone(
                                                                paymentGatewayPageCopyGetUserApiResponse
                                                                    .jsonBody,
                                                              ),
                                                              'Phone',
                                                            )}',
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
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color: Color(0xFFF5F6F9),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Amount :',
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              widget!.total
                                                                  ?.toString(),
                                                              'Price',
                                                            ),
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
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color: Color(0xFFF5F6F9),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Payment To :',
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
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget!
                                                                      .paymentToName,
                                                                  'PaymentName',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                'Your payment will be processed securely via ${widget!.paymentMethod}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
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
                                    ),
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 16.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (widget!.paymentMethod ==
                                                'Paypal') {
                                              if (widget!.couponCode == '0') {
                                                _model.bookingApiNoCouponFunction =
                                                    await CarServiceGroup
                                                        .bookAVehicleNoCouponCall
                                                        .call(
                                                  userId: FFAppState().userId,
                                                  username: CarServiceGroup
                                                      .getUserApiCall
                                                      .username(
                                                    paymentGatewayPageCopyGetUserApiResponse
                                                        .jsonBody,
                                                  ),
                                                  email: CarServiceGroup
                                                      .getUserApiCall
                                                      .email(
                                                    paymentGatewayPageCopyGetUserApiResponse
                                                        .jsonBody,
                                                  ),
                                                  city: widget!.addressCity,
                                                  addressId: widget!.addressId,
                                                  type: widget!.addressType,
                                                  street: widget!.addressStreet,
                                                  state: widget!.addressState,
                                                  zipcode:
                                                      widget!.addressZipcode,
                                                  country:
                                                      widget!.addressCountry,
                                                  vehicleId: widget!.vehicleId,
                                                  vehicleName:
                                                      widget!.vehicleName,
                                                  vehicleNumber:
                                                      widget!.vehicleNumber,
                                                  serviceId: widget!.serviceId,
                                                  name: widget!.serviceName,
                                                  image: widget!.serviceImage,
                                                  packageId: widget!.packageId,
                                                  title: widget!.paymentToName,
                                                  packageImage:
                                                      widget!.packageImage,
                                                  price: widget!.packagePrice,
                                                  bookingDate:
                                                      widget!.bookingDate,
                                                  bookingTime:
                                                      widget!.bookingTime,
                                                  paymentMode:
                                                      widget!.paymentMethod,
                                                  transactionId:
                                                      'TTCNI022000800594',
                                                  paymentStatus: 'success',
                                                  orderStatus: 'pending',
                                                  subTotal: widget!.subTotal,
                                                  vat: widget!.vat,
                                                  total: widget!.total,
                                                  token: FFAppState().token,
                                                );

                                                if (CarServiceGroup
                                                        .bookAVehicleNoCouponCall
                                                        .success(
                                                      (_model.bookingApiNoCouponFunction
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                    1) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        CarServiceGroup
                                                            .bookAVehicleNoCouponCall
                                                            .message(
                                                          (_model.bookingApiNoCouponFunction
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
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

                                                  context.goNamed(
                                                    'PaymentSuccessPage',
                                                    queryParameters: {
                                                      'addressId':
                                                          serializeParam(
                                                        widget!.addressId,
                                                        ParamType.String,
                                                      ),
                                                      'addressType':
                                                          serializeParam(
                                                        widget!.addressType,
                                                        ParamType.String,
                                                      ),
                                                      'addressStreet':
                                                          serializeParam(
                                                        widget!.addressStreet,
                                                        ParamType.String,
                                                      ),
                                                      'addressCity':
                                                          serializeParam(
                                                        widget!.addressCity,
                                                        ParamType.String,
                                                      ),
                                                      'addresState':
                                                          serializeParam(
                                                        widget!.addressState,
                                                        ParamType.String,
                                                      ),
                                                      'addresZipcode':
                                                          serializeParam(
                                                        widget!.addressZipcode,
                                                        ParamType.String,
                                                      ),
                                                      'addressCountry':
                                                          serializeParam(
                                                        widget!.addressCountry,
                                                        ParamType.String,
                                                      ),
                                                      'vehicleId':
                                                          serializeParam(
                                                        widget!.vehicleId,
                                                        ParamType.String,
                                                      ),
                                                      'vehicleName':
                                                          serializeParam(
                                                        widget!.vehicleName,
                                                        ParamType.String,
                                                      ),
                                                      'vehicleNumber':
                                                          serializeParam(
                                                        widget!.vehicleNumber,
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
                                                      'packageId':
                                                          serializeParam(
                                                        widget!.packageId,
                                                        ParamType.String,
                                                      ),
                                                      'packageTitle':
                                                          serializeParam(
                                                        widget!.paymentToName,
                                                        ParamType.String,
                                                      ),
                                                      'packageImage':
                                                          serializeParam(
                                                        widget!.packageImage,
                                                        ParamType.String,
                                                      ),
                                                      'packagePrice':
                                                          serializeParam(
                                                        widget!.packagePrice,
                                                        ParamType.double,
                                                      ),
                                                      'bookingDate':
                                                          serializeParam(
                                                        widget!.bookingDate,
                                                        ParamType.String,
                                                      ),
                                                      'bookingTime':
                                                          serializeParam(
                                                        widget!.bookingTime,
                                                        ParamType.String,
                                                      ),
                                                      'paymentMode':
                                                          serializeParam(
                                                        widget!.paymentMethod,
                                                        ParamType.String,
                                                      ),
                                                      'transactionId':
                                                          serializeParam(
                                                        'TTCNI0220008500594',
                                                        ParamType.String,
                                                      ),
                                                      'paymentStatus':
                                                          serializeParam(
                                                        'success',
                                                        ParamType.String,
                                                      ),
                                                      'orderStatus':
                                                          serializeParam(
                                                        'pending',
                                                        ParamType.String,
                                                      ),
                                                      'subTotal':
                                                          serializeParam(
                                                        widget!.subTotal,
                                                        ParamType.double,
                                                      ),
                                                      'couponCode':
                                                          serializeParam(
                                                        widget!.couponCode,
                                                        ParamType.String,
                                                      ),
                                                      'couponType':
                                                          serializeParam(
                                                        widget!.couponType,
                                                        ParamType.String,
                                                      ),
                                                      'couponAmount':
                                                          serializeParam(
                                                        widget!.couponAmount,
                                                        ParamType.double,
                                                      ),
                                                      'vat': serializeParam(
                                                        widget!.vat,
                                                        ParamType.double,
                                                      ),
                                                      'total': serializeParam(
                                                        widget!.total,
                                                        ParamType.double,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        CarServiceGroup
                                                            .bookAVehicleNoCouponCall
                                                            .message(
                                                          (_model.bookingApiNoCouponFunction
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
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

                                                  context.goNamed(
                                                      'PaymentFailedPage');
                                                }
                                              } else {
                                                _model.bookingApiFunction =
                                                    await CarServiceGroup
                                                        .bookAVehicleCall
                                                        .call(
                                                  userId: FFAppState().userId,
                                                  username: CarServiceGroup
                                                      .getUserApiCall
                                                      .username(
                                                    paymentGatewayPageCopyGetUserApiResponse
                                                        .jsonBody,
                                                  ),
                                                  email: CarServiceGroup
                                                      .getUserApiCall
                                                      .email(
                                                    paymentGatewayPageCopyGetUserApiResponse
                                                        .jsonBody,
                                                  ),
                                                  addressId: widget!.addressId,
                                                  type: widget!.addressType,
                                                  street: widget!.addressStreet,
                                                  city: widget!.addressCity,
                                                  state: widget!.addressState,
                                                  zipcode:
                                                      widget!.addressZipcode,
                                                  country:
                                                      widget!.addressCountry,
                                                  vehicleId: widget!.vehicleId,
                                                  vehicleName:
                                                      widget!.vehicleName,
                                                  vehicleNumber:
                                                      widget!.vehicleNumber,
                                                  serviceId: widget!.serviceId,
                                                  name: widget!.serviceName,
                                                  image: widget!.serviceImage,
                                                  packageId: widget!.packageId,
                                                  title: widget!.paymentToName,
                                                  packageImage:
                                                      widget!.packageImage,
                                                  bookingDate:
                                                      widget!.bookingDate,
                                                  bookingTime:
                                                      widget!.bookingTime,
                                                  paymentMode:
                                                      widget!.paymentMethod,
                                                  transactionId:
                                                      'TTCNI022000800594',
                                                  paymentStatus: 'success',
                                                  orderStatus: 'pending',
                                                  subTotal: widget!.subTotal,
                                                  couponCode:
                                                      widget!.couponCode,
                                                  couponType:
                                                      widget!.couponType,
                                                  couponAmount:
                                                      widget!.couponAmount,
                                                  vat: widget!.vat,
                                                  total: widget!.total,
                                                  token: FFAppState().token,
                                                  price: widget!.packagePrice,
                                                );

                                                if (CarServiceGroup
                                                        .bookAVehicleCall
                                                        .success(
                                                      (_model.bookingApiFunction
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                    1) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        CarServiceGroup
                                                            .bookAVehicleCall
                                                            .message(
                                                          (_model.bookingApiFunction
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
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

                                                  context.goNamed(
                                                    'PaymentSuccessPage',
                                                    queryParameters: {
                                                      'addressId':
                                                          serializeParam(
                                                        widget!.addressId,
                                                        ParamType.String,
                                                      ),
                                                      'addressType':
                                                          serializeParam(
                                                        widget!.addressType,
                                                        ParamType.String,
                                                      ),
                                                      'addressStreet':
                                                          serializeParam(
                                                        widget!.addressStreet,
                                                        ParamType.String,
                                                      ),
                                                      'addressCity':
                                                          serializeParam(
                                                        widget!.addressCity,
                                                        ParamType.String,
                                                      ),
                                                      'addresState':
                                                          serializeParam(
                                                        widget!.addressState,
                                                        ParamType.String,
                                                      ),
                                                      'addresZipcode':
                                                          serializeParam(
                                                        widget!.addressZipcode,
                                                        ParamType.String,
                                                      ),
                                                      'addressCountry':
                                                          serializeParam(
                                                        widget!.addressCountry,
                                                        ParamType.String,
                                                      ),
                                                      'vehicleId':
                                                          serializeParam(
                                                        widget!.vehicleId,
                                                        ParamType.String,
                                                      ),
                                                      'vehicleName':
                                                          serializeParam(
                                                        widget!.vehicleName,
                                                        ParamType.String,
                                                      ),
                                                      'vehicleNumber':
                                                          serializeParam(
                                                        widget!.vehicleNumber,
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
                                                      'packageId':
                                                          serializeParam(
                                                        widget!.packageId,
                                                        ParamType.String,
                                                      ),
                                                      'packageTitle':
                                                          serializeParam(
                                                        widget!.paymentToName,
                                                        ParamType.String,
                                                      ),
                                                      'packageImage':
                                                          serializeParam(
                                                        widget!.packageImage,
                                                        ParamType.String,
                                                      ),
                                                      'packagePrice':
                                                          serializeParam(
                                                        widget!.packagePrice,
                                                        ParamType.double,
                                                      ),
                                                      'bookingDate':
                                                          serializeParam(
                                                        widget!.bookingDate,
                                                        ParamType.String,
                                                      ),
                                                      'bookingTime':
                                                          serializeParam(
                                                        widget!.bookingTime,
                                                        ParamType.String,
                                                      ),
                                                      'paymentMode':
                                                          serializeParam(
                                                        widget!.paymentMethod,
                                                        ParamType.String,
                                                      ),
                                                      'transactionId':
                                                          serializeParam(
                                                        'TTCNI0220008500594',
                                                        ParamType.String,
                                                      ),
                                                      'paymentStatus':
                                                          serializeParam(
                                                        'success',
                                                        ParamType.String,
                                                      ),
                                                      'orderStatus':
                                                          serializeParam(
                                                        'pending',
                                                        ParamType.String,
                                                      ),
                                                      'subTotal':
                                                          serializeParam(
                                                        widget!.subTotal,
                                                        ParamType.double,
                                                      ),
                                                      'couponCode':
                                                          serializeParam(
                                                        widget!.couponCode,
                                                        ParamType.String,
                                                      ),
                                                      'couponType':
                                                          serializeParam(
                                                        widget!.couponType,
                                                        ParamType.String,
                                                      ),
                                                      'couponAmount':
                                                          serializeParam(
                                                        widget!.couponAmount,
                                                        ParamType.double,
                                                      ),
                                                      'vat': serializeParam(
                                                        widget!.vat,
                                                        ParamType.double,
                                                      ),
                                                      'total': serializeParam(
                                                        widget!.total,
                                                        ParamType.double,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        CarServiceGroup
                                                            .bookAVehicleCall
                                                            .message(
                                                          (_model.bookingApiFunction
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
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

                                                  context.goNamed(
                                                      'PaymentFailedPage');
                                                }
                                              }
                                            } else {
                                              if (widget!.paymentMethod ==
                                                  'Stripe') {
                                                if (widget!.couponCode == '0') {
                                                  _model.bookingApiStripeNoCouponFunction =
                                                      await CarServiceGroup
                                                          .bookAVehicleNoCouponCall
                                                          .call(
                                                    userId: FFAppState().userId,
                                                    username: CarServiceGroup
                                                        .getUserApiCall
                                                        .username(
                                                      paymentGatewayPageCopyGetUserApiResponse
                                                          .jsonBody,
                                                    ),
                                                    email: CarServiceGroup
                                                        .getUserApiCall
                                                        .email(
                                                      paymentGatewayPageCopyGetUserApiResponse
                                                          .jsonBody,
                                                    ),
                                                    city: widget!.addressCity,
                                                    addressId:
                                                        widget!.addressId,
                                                    type: widget!.addressType,
                                                    street:
                                                        widget!.addressStreet,
                                                    state: widget!.addressState,
                                                    zipcode:
                                                        widget!.addressZipcode,
                                                    country:
                                                        widget!.addressCountry,
                                                    vehicleId:
                                                        widget!.vehicleId,
                                                    vehicleName:
                                                        widget!.vehicleName,
                                                    vehicleNumber:
                                                        widget!.vehicleNumber,
                                                    serviceId:
                                                        widget!.serviceId,
                                                    name: widget!.serviceName,
                                                    image: widget!.serviceImage,
                                                    packageId:
                                                        widget!.packageId,
                                                    title:
                                                        widget!.paymentToName,
                                                    packageImage:
                                                        widget!.packageImage,
                                                    price: widget!.packagePrice,
                                                    bookingDate:
                                                        widget!.bookingDate,
                                                    bookingTime:
                                                        widget!.bookingTime,
                                                    paymentMode:
                                                        widget!.paymentMethod,
                                                    transactionId:
                                                        'TTCNI022000800594',
                                                    paymentStatus: 'success',
                                                    orderStatus: 'pending',
                                                    subTotal: widget!.subTotal,
                                                    vat: widget!.vat,
                                                    total: widget!.total,
                                                    token: FFAppState().token,
                                                  );

                                                  if (CarServiceGroup
                                                          .bookAVehicleNoCouponCall
                                                          .success(
                                                        (_model.bookingApiStripeNoCouponFunction
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      1) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          CarServiceGroup
                                                              .bookAVehicleNoCouponCall
                                                              .message(
                                                            (_model.bookingApiStripeNoCouponFunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
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
                                                    await showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus(),
                                                            child:
                                                                OrderSuccessDialogWidget(
                                                              onTapLHome:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);

                                                                context.goNamed(
                                                                    'MyOrderConfirmPage');
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          CarServiceGroup
                                                              .bookAVehicleNoCouponCall
                                                              .message(
                                                            (_model.bookingApiStripeNoCouponFunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
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

                                                    context.goNamed(
                                                        'HomeMainPage');
                                                  }
                                                } else {
                                                  _model.bookingApiStripeFunction =
                                                      await CarServiceGroup
                                                          .bookAVehicleCall
                                                          .call(
                                                    userId: FFAppState().userId,
                                                    username: CarServiceGroup
                                                        .getUserApiCall
                                                        .username(
                                                      paymentGatewayPageCopyGetUserApiResponse
                                                          .jsonBody,
                                                    ),
                                                    email: CarServiceGroup
                                                        .getUserApiCall
                                                        .email(
                                                      paymentGatewayPageCopyGetUserApiResponse
                                                          .jsonBody,
                                                    ),
                                                    addressId:
                                                        widget!.addressId,
                                                    type: widget!.addressType,
                                                    street:
                                                        widget!.addressStreet,
                                                    city: widget!.addressCity,
                                                    state: widget!.addressState,
                                                    zipcode:
                                                        widget!.addressZipcode,
                                                    country:
                                                        widget!.addressCountry,
                                                    vehicleId:
                                                        widget!.vehicleId,
                                                    vehicleName:
                                                        widget!.vehicleName,
                                                    vehicleNumber:
                                                        widget!.vehicleNumber,
                                                    serviceId:
                                                        widget!.serviceId,
                                                    name: widget!.serviceName,
                                                    image: widget!.serviceImage,
                                                    packageId:
                                                        widget!.packageId,
                                                    title:
                                                        widget!.paymentToName,
                                                    packageImage:
                                                        widget!.packageImage,
                                                    bookingDate:
                                                        widget!.bookingDate,
                                                    bookingTime:
                                                        widget!.bookingTime,
                                                    paymentMode:
                                                        widget!.paymentMethod,
                                                    transactionId:
                                                        'TTCNI022000800594',
                                                    paymentStatus: 'success',
                                                    orderStatus: 'pending',
                                                    subTotal: widget!.subTotal,
                                                    couponCode:
                                                        widget!.couponCode,
                                                    couponType:
                                                        widget!.couponType,
                                                    couponAmount:
                                                        widget!.couponAmount,
                                                    vat: widget!.vat,
                                                    total: widget!.total,
                                                    token: FFAppState().token,
                                                    price: widget!.packagePrice,
                                                  );

                                                  if (CarServiceGroup
                                                          .bookAVehicleCall
                                                          .success(
                                                        (_model.bookingApiStripeFunction
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      1) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          CarServiceGroup
                                                              .bookAVehicleCall
                                                              .message(
                                                            (_model.bookingApiStripeFunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
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
                                                    await showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus(),
                                                            child:
                                                                OrderSuccessDialogWidget(
                                                              onTapLHome:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);

                                                                context.goNamed(
                                                                    'MyOrderConfirmPage');
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          CarServiceGroup
                                                              .bookAVehicleCall
                                                              .message(
                                                            (_model.bookingApiStripeFunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
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

                                                    context.goNamed(
                                                        'HomeMainPage');
                                                  }
                                                }
                                              } else {
                                                if (widget!.couponCode == '0') {
                                                  _model.bookingApiRazorpayNoCouponFunction =
                                                      await CarServiceGroup
                                                          .bookAVehicleNoCouponCall
                                                          .call(
                                                    userId: FFAppState().userId,
                                                    username: CarServiceGroup
                                                        .getUserApiCall
                                                        .username(
                                                      paymentGatewayPageCopyGetUserApiResponse
                                                          .jsonBody,
                                                    ),
                                                    email: CarServiceGroup
                                                        .getUserApiCall
                                                        .email(
                                                      paymentGatewayPageCopyGetUserApiResponse
                                                          .jsonBody,
                                                    ),
                                                    city: widget!.addressCity,
                                                    addressId:
                                                        widget!.addressId,
                                                    type: widget!.addressType,
                                                    street:
                                                        widget!.addressStreet,
                                                    state: widget!.addressState,
                                                    zipcode:
                                                        widget!.addressZipcode,
                                                    country:
                                                        widget!.addressCountry,
                                                    vehicleId:
                                                        widget!.vehicleId,
                                                    vehicleName:
                                                        widget!.vehicleName,
                                                    vehicleNumber:
                                                        widget!.vehicleNumber,
                                                    serviceId:
                                                        widget!.serviceId,
                                                    name: widget!.serviceName,
                                                    image: widget!.serviceImage,
                                                    packageId:
                                                        widget!.packageId,
                                                    title:
                                                        widget!.paymentToName,
                                                    packageImage:
                                                        widget!.packageImage,
                                                    price: widget!.packagePrice,
                                                    bookingDate:
                                                        widget!.bookingDate,
                                                    bookingTime:
                                                        widget!.bookingTime,
                                                    paymentMode:
                                                        widget!.paymentMethod,
                                                    transactionId:
                                                        'TTCNI022000800594',
                                                    paymentStatus: 'success',
                                                    orderStatus: 'pending',
                                                    subTotal: widget!.subTotal,
                                                    vat: widget!.vat,
                                                    total: widget!.total,
                                                    token: FFAppState().token,
                                                  );

                                                  if (CarServiceGroup
                                                          .bookAVehicleNoCouponCall
                                                          .success(
                                                        (_model.bookingApiRazorpayNoCouponFunction
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      1) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          CarServiceGroup
                                                              .bookAVehicleNoCouponCall
                                                              .message(
                                                            (_model.bookingApiRazorpayNoCouponFunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
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

                                                    context.goNamed(
                                                      'PaymentSuccessPage',
                                                      queryParameters: {
                                                        'addressId':
                                                            serializeParam(
                                                          widget!.addressId,
                                                          ParamType.String,
                                                        ),
                                                        'addressType':
                                                            serializeParam(
                                                          widget!.addressType,
                                                          ParamType.String,
                                                        ),
                                                        'addressStreet':
                                                            serializeParam(
                                                          widget!.addressStreet,
                                                          ParamType.String,
                                                        ),
                                                        'addressCity':
                                                            serializeParam(
                                                          widget!.addressCity,
                                                          ParamType.String,
                                                        ),
                                                        'addresState':
                                                            serializeParam(
                                                          widget!.addressState,
                                                          ParamType.String,
                                                        ),
                                                        'addresZipcode':
                                                            serializeParam(
                                                          widget!
                                                              .addressZipcode,
                                                          ParamType.String,
                                                        ),
                                                        'addressCountry':
                                                            serializeParam(
                                                          widget!
                                                              .addressCountry,
                                                          ParamType.String,
                                                        ),
                                                        'vehicleId':
                                                            serializeParam(
                                                          widget!.vehicleId,
                                                          ParamType.String,
                                                        ),
                                                        'vehicleName':
                                                            serializeParam(
                                                          widget!.vehicleName,
                                                          ParamType.String,
                                                        ),
                                                        'vehicleNumber':
                                                            serializeParam(
                                                          FFAppState()
                                                              .vehiclenumber,
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
                                                        'packageId':
                                                            serializeParam(
                                                          widget!.packageId,
                                                          ParamType.String,
                                                        ),
                                                        'packageTitle':
                                                            serializeParam(
                                                          widget!.paymentToName,
                                                          ParamType.String,
                                                        ),
                                                        'packageImage':
                                                            serializeParam(
                                                          widget!.packageImage,
                                                          ParamType.String,
                                                        ),
                                                        'packagePrice':
                                                            serializeParam(
                                                          widget!.packagePrice,
                                                          ParamType.double,
                                                        ),
                                                        'bookingDate':
                                                            serializeParam(
                                                          widget!.bookingDate,
                                                          ParamType.String,
                                                        ),
                                                        'bookingTime':
                                                            serializeParam(
                                                          widget!.bookingTime,
                                                          ParamType.String,
                                                        ),
                                                        'paymentMode':
                                                            serializeParam(
                                                          widget!.paymentMethod,
                                                          ParamType.String,
                                                        ),
                                                        'transactionId':
                                                            serializeParam(
                                                          'TTCNI0220008500594',
                                                          ParamType.String,
                                                        ),
                                                        'paymentStatus':
                                                            serializeParam(
                                                          'success',
                                                          ParamType.String,
                                                        ),
                                                        'orderStatus':
                                                            serializeParam(
                                                          'pending',
                                                          ParamType.String,
                                                        ),
                                                        'subTotal':
                                                            serializeParam(
                                                          widget!.subTotal,
                                                          ParamType.double,
                                                        ),
                                                        'couponCode':
                                                            serializeParam(
                                                          widget!.couponCode,
                                                          ParamType.String,
                                                        ),
                                                        'couponType':
                                                            serializeParam(
                                                          widget!.couponType,
                                                          ParamType.String,
                                                        ),
                                                        'couponAmount':
                                                            serializeParam(
                                                          widget!.couponAmount,
                                                          ParamType.double,
                                                        ),
                                                        'vat': serializeParam(
                                                          widget!.vat,
                                                          ParamType.double,
                                                        ),
                                                        'total': serializeParam(
                                                          widget!.total,
                                                          ParamType.double,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          CarServiceGroup
                                                              .bookAVehicleNoCouponCall
                                                              .message(
                                                            (_model.bookingApiRazorpayNoCouponFunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
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

                                                    context.goNamed(
                                                        'PaymentFailedPage');
                                                  }
                                                } else {
                                                  _model.bookingApiRazorpayFunction =
                                                      await CarServiceGroup
                                                          .bookAVehicleCall
                                                          .call(
                                                    userId: FFAppState().userId,
                                                    username: CarServiceGroup
                                                        .getUserApiCall
                                                        .username(
                                                      paymentGatewayPageCopyGetUserApiResponse
                                                          .jsonBody,
                                                    ),
                                                    email: CarServiceGroup
                                                        .getUserApiCall
                                                        .email(
                                                      paymentGatewayPageCopyGetUserApiResponse
                                                          .jsonBody,
                                                    ),
                                                    addressId:
                                                        widget!.addressId,
                                                    type: widget!.addressType,
                                                    street:
                                                        widget!.addressStreet,
                                                    city: widget!.addressCity,
                                                    state: widget!.addressState,
                                                    zipcode:
                                                        widget!.addressZipcode,
                                                    country:
                                                        widget!.addressCountry,
                                                    vehicleId:
                                                        widget!.vehicleId,
                                                    vehicleName:
                                                        widget!.vehicleName,
                                                    vehicleNumber:
                                                        widget!.vehicleNumber,
                                                    serviceId:
                                                        widget!.serviceId,
                                                    name: widget!.serviceName,
                                                    image: widget!.serviceImage,
                                                    packageId:
                                                        widget!.packageId,
                                                    title:
                                                        widget!.paymentToName,
                                                    packageImage:
                                                        widget!.packageImage,
                                                    bookingDate:
                                                        widget!.bookingDate,
                                                    bookingTime:
                                                        widget!.bookingTime,
                                                    paymentMode:
                                                        widget!.paymentMethod,
                                                    transactionId:
                                                        'TTCNI022000800594',
                                                    paymentStatus: 'success',
                                                    orderStatus: 'pending',
                                                    subTotal: widget!.subTotal,
                                                    couponCode:
                                                        widget!.couponCode,
                                                    couponType:
                                                        widget!.couponType,
                                                    couponAmount:
                                                        widget!.couponAmount,
                                                    vat: widget!.vat,
                                                    total: widget!.total,
                                                    token: FFAppState().token,
                                                    price: widget!.packagePrice,
                                                  );

                                                  if (CarServiceGroup
                                                          .bookAVehicleCall
                                                          .success(
                                                        (_model.bookingApiRazorpayFunction
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      1) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          CarServiceGroup
                                                              .bookAVehicleCall
                                                              .message(
                                                            (_model.bookingApiRazorpayFunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
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

                                                    context.goNamed(
                                                      'PaymentSuccessPage',
                                                      queryParameters: {
                                                        'addressId':
                                                            serializeParam(
                                                          widget!.addressId,
                                                          ParamType.String,
                                                        ),
                                                        'addressType':
                                                            serializeParam(
                                                          widget!.addressType,
                                                          ParamType.String,
                                                        ),
                                                        'addressStreet':
                                                            serializeParam(
                                                          widget!.addressStreet,
                                                          ParamType.String,
                                                        ),
                                                        'addressCity':
                                                            serializeParam(
                                                          widget!.addressCity,
                                                          ParamType.String,
                                                        ),
                                                        'addresState':
                                                            serializeParam(
                                                          widget!.addressState,
                                                          ParamType.String,
                                                        ),
                                                        'addresZipcode':
                                                            serializeParam(
                                                          widget!
                                                              .addressZipcode,
                                                          ParamType.String,
                                                        ),
                                                        'addressCountry':
                                                            serializeParam(
                                                          widget!
                                                              .addressCountry,
                                                          ParamType.String,
                                                        ),
                                                        'vehicleId':
                                                            serializeParam(
                                                          widget!.vehicleId,
                                                          ParamType.String,
                                                        ),
                                                        'vehicleName':
                                                            serializeParam(
                                                          widget!.vehicleName,
                                                          ParamType.String,
                                                        ),
                                                        'vehicleNumber':
                                                            serializeParam(
                                                          FFAppState()
                                                              .vehiclenumber,
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
                                                        'packageId':
                                                            serializeParam(
                                                          widget!.packageId,
                                                          ParamType.String,
                                                        ),
                                                        'packageTitle':
                                                            serializeParam(
                                                          widget!.paymentToName,
                                                          ParamType.String,
                                                        ),
                                                        'packageImage':
                                                            serializeParam(
                                                          widget!.packageImage,
                                                          ParamType.String,
                                                        ),
                                                        'packagePrice':
                                                            serializeParam(
                                                          widget!.packagePrice,
                                                          ParamType.double,
                                                        ),
                                                        'bookingDate':
                                                            serializeParam(
                                                          widget!.bookingDate,
                                                          ParamType.String,
                                                        ),
                                                        'bookingTime':
                                                            serializeParam(
                                                          widget!.bookingTime,
                                                          ParamType.String,
                                                        ),
                                                        'paymentMode':
                                                            serializeParam(
                                                          widget!.paymentMethod,
                                                          ParamType.String,
                                                        ),
                                                        'transactionId':
                                                            serializeParam(
                                                          'TTCNI0220008500594',
                                                          ParamType.String,
                                                        ),
                                                        'paymentStatus':
                                                            serializeParam(
                                                          'success',
                                                          ParamType.String,
                                                        ),
                                                        'orderStatus':
                                                            serializeParam(
                                                          'pending',
                                                          ParamType.String,
                                                        ),
                                                        'subTotal':
                                                            serializeParam(
                                                          widget!.subTotal,
                                                          ParamType.double,
                                                        ),
                                                        'couponCode':
                                                            serializeParam(
                                                          widget!.couponCode,
                                                          ParamType.String,
                                                        ),
                                                        'couponType':
                                                            serializeParam(
                                                          widget!.couponType,
                                                          ParamType.String,
                                                        ),
                                                        'couponAmount':
                                                            serializeParam(
                                                          widget!.couponAmount,
                                                          ParamType.double,
                                                        ),
                                                        'vat': serializeParam(
                                                          widget!.vat,
                                                          ParamType.double,
                                                        ),
                                                        'total': serializeParam(
                                                          widget!.total,
                                                          ParamType.double,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          CarServiceGroup
                                                              .bookAVehicleCall
                                                              .message(
                                                            (_model.bookingApiRazorpayFunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
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

                                                    context.goNamed(
                                                        'PaymentFailedPage');
                                                  }
                                                }
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Pay now',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 54.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
      },
    );
  }
}
