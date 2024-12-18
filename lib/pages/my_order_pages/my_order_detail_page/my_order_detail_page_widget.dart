import '/backend/api_requests/api_calls.dart';
import '/components/cancel_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/car_detail_shimmer/car_detail_shimmer_widget.dart';
import 'dart:math';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'my_order_detail_page_model.dart';
export 'my_order_detail_page_model.dart';

class MyOrderDetailPageWidget extends StatefulWidget {
  const MyOrderDetailPageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.bookingDate,
    required this.packageId,
    required this.bookingId,
    required this.bookingTime,
    required this.status,
    required this.currencySymbol,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
  });

  final String? image;
  final String? title;
  final double? price;
  final String? bookingDate;
  final String? packageId;
  final String? bookingId;
  final String? bookingTime;
  final String? status;
  final String? currencySymbol;
  final String? serviceId;
  final String? serviceName;
  final String? serviceImage;

  @override
  State<MyOrderDetailPageWidget> createState() =>
      _MyOrderDetailPageWidgetState();
}

class _MyOrderDetailPageWidgetState extends State<MyOrderDetailPageWidget>
    with TickerProviderStateMixin {
  late MyOrderDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyOrderDetailPageModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 1500.0.ms,
            color: FlutterFlowTheme.of(context).gray300,
            angle: 0.524,
          ),
        ],
      ),
    });
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
      future: FFAppState()
          .ongoingOrderCache(
        uniqueQueryKey: FFAppState().userId,
        requestFn: () => CarServiceGroup.getBookedDetailsApiCall.call(
          userId: FFAppState().userId,
          token: FFAppState().token,
        ),
      )
          .then((result) {
        try {
          _model.apiRequestCompleted = true;
          _model.apiRequestLastUniqueKey = FFAppState().userId;
        } finally {}
        return result;
      }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: CarDetailShimmerWidget(),
            ),
          );
        }
        final myOrderDetailPageGetBookedDetailsApiResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Builder(
              builder: (context) {
                if (FFAppState().connected) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FutureBuilder<ApiCallResponse>(
                          future: CarServiceGroup.packageDetailsApiCall.call(
                            packageId: widget!.packageId,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: CarDetailShimmerWidget(),
                              );
                            }
                            final listViewPackageDetailsApiResponse =
                                snapshot.data!;

                            return ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 200),
                                        fadeOutDuration:
                                            Duration(milliseconds: 200),
                                        imageUrl:
                                            '${FFAppConstants.imageUrl}${widget!.image}',
                                        width: double.infinity,
                                        height: 301.0,
                                        fit: BoxFit.cover,
                                        alignment: Alignment(-1.0, -1.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'imageOnPageLoadAnimation']!),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 63.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Container(
                                          width: 48.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/left.svg',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget!.title,
                                      'Title',
                                    ),
                                    maxLines: 1,
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
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 6.0),
                                          child: custom_widgets
                                              .GetCurrencySymboolBold(
                                            width: 15.0,
                                            height: 20.0,
                                            isSimbool: widget!.currencySymbol,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget!.price?.toString(),
                                          '0',
                                        ),
                                        maxLines: 1,
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 24.0, 16.0, 8.0),
                                  child: Text(
                                    'Package includes',
                                    maxLines: 1,
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
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: custom_widgets.HtmlConverter(
                                    width: double.infinity,
                                    height: 50.0,
                                    text: CarServiceGroup.packageDetailsApiCall
                                        .description(
                                      listViewPackageDetailsApiResponse
                                          .jsonBody,
                                    )!,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 24.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Time & date',
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
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/calender.svg',
                                                  width: 24.0,
                                                  height: 24.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${widget!.bookingDate} ${widget!.bookingTime}',
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.2,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (widget!.status == 'pending') {
                            return Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 36.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () =>
                                                FocusScope.of(dialogContext)
                                                    .unfocus(),
                                            child: Container(
                                              height: 204.0,
                                              child: CancelDialogWidget(
                                                onTapYes: () async {
                                                  _model.cancelOrderFunction =
                                                      await CarServiceGroup
                                                          .cancelOrderApiCall
                                                          .call(
                                                    userId: FFAppState().userId,
                                                    bookingId:
                                                        widget!.bookingId,
                                                    token: FFAppState().token,
                                                  );

                                                  if (CarServiceGroup
                                                          .cancelOrderApiCall
                                                          .success(
                                                        (_model.cancelOrderFunction
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      1) {
                                                    safeSetState(() {
                                                      FFAppState()
                                                          .clearOngoingOrderCacheCacheKey(
                                                              _model
                                                                  .apiRequestLastUniqueKey);
                                                      _model.apiRequestCompleted =
                                                          false;
                                                    });
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                    Navigator.pop(context);
                                                    context.safePop();
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          CarServiceGroup
                                                              .cancelOrderApiCall
                                                              .message(
                                                            (_model.cancelOrderFunction
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                    Navigator.pop(context);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    safeSetState(() {});
                                  },
                                  text: 'Cancel order',
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
                            );
                          } else {
                            return Visibility(
                              visible: widget!.status == 'completed',
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 42.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'SelectTmeDatePage',
                                      queryParameters: {
                                        'packageId': serializeParam(
                                          widget!.packageId,
                                          ParamType.String,
                                        ),
                                        'packageTitle': serializeParam(
                                          widget!.title,
                                          ParamType.String,
                                        ),
                                        'packageImage': serializeParam(
                                          widget!.image,
                                          ParamType.String,
                                        ),
                                        'packagePrice': serializeParam(
                                          widget!.price,
                                          ParamType.double,
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
                                        'currencySymbol': serializeParam(
                                          widget!.currencySymbol,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Book again',
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
                            );
                          }
                        },
                      ),
                    ],
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
        );
      },
    );
  }
}
