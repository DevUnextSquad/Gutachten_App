import '/backend/api_requests/api_calls.dart';
import '/componants/blank_componant/blank_componant_widget.dart';
import '/componants/no_order_set_componant/no_order_set_componant_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmers/order_main_list_shimmer/order_main_list_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'complate_orders_componant_model.dart';
export 'complate_orders_componant_model.dart';

class ComplateOrdersComponantWidget extends StatefulWidget {
  const ComplateOrdersComponantWidget({super.key});

  @override
  State<ComplateOrdersComponantWidget> createState() =>
      _ComplateOrdersComponantWidgetState();
}

class _ComplateOrdersComponantWidgetState
    extends State<ComplateOrdersComponantWidget> {
  late ComplateOrdersComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComplateOrdersComponantModel());
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
              final containerCurrencyApiResponse = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    if (FFAppState().isVerified == true) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState()
                              .complateOrderCache(
                            uniqueQueryKey: FFAppState().userId,
                            requestFn: () =>
                                CarServiceGroup.completedOrdersApiCall.call(
                              userId: FFAppState().userId,
                              token: FFAppState().token,
                            ),
                          )
                              .then((result) {
                            try {
                              _model.apiRequestCompleted = true;
                              _model.apiRequestLastUniqueKey =
                                  FFAppState().userId;
                            } finally {}
                            return result;
                          }),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: OrderMainListShimmerWidget(),
                              );
                            }
                            final listViewCompletedOrdersApiResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final completedOrdersList =
                                    CarServiceGroup.completedOrdersApiCall
                                            .bookingDetailsList(
                                              listViewCompletedOrdersApiResponse
                                                  .jsonBody,
                                            )
                                            ?.toList() ??
                                        [];
                                if (completedOrdersList.isEmpty) {
                                  return Center(
                                    child: Container(
                                      height: 208.0,
                                      child: NoOrderSetComponantWidget(),
                                    ),
                                  );
                                }

                                return RefreshIndicator(
                                  key: Key('RefreshIndicator_zre8o158'),
                                  color: FlutterFlowTheme.of(context).primary,
                                  onRefresh: () async {
                                    safeSetState(() {
                                      FFAppState()
                                          .clearComplateOrderCacheCacheKey(
                                              _model.apiRequestLastUniqueKey);
                                      _model.apiRequestCompleted = false;
                                    });
                                    await _model.waitForApiRequestCompleted();
                                  },
                                  child: ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      24.0,
                                      0,
                                      24.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: completedOrdersList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 16.0),
                                    itemBuilder:
                                        (context, completedOrdersListIndex) {
                                      final completedOrdersListItem =
                                          completedOrdersList[
                                              completedOrdersListIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'MyOrderDetailPage',
                                            queryParameters: {
                                              'image': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.packageDetails.image''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'title': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.packageDetails.title''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'price': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.Total''',
                                                ),
                                                ParamType.double,
                                              ),
                                              'bookingDate': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.bookingDate''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'packageId': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.packageDetails.packageId''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'bookingId': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'bookingTime': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.bookingTime''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'status': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.orderStatus''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'currencySymbol': serializeParam(
                                                CarServiceGroup.currencyApiCall
                                                    .currency(
                                                  containerCurrencyApiResponse
                                                      .jsonBody,
                                                ),
                                                ParamType.String,
                                              ),
                                              'serviceId': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.serviceDetails.serviceId''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'serviceName': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.serviceDetails.name''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'serviceImage': serializeParam(
                                                getJsonField(
                                                  completedOrdersListItem,
                                                  r'''$.serviceDetails.image''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 200),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 200),
                                                    imageUrl:
                                                        '${FFAppConstants.imageUrl}${getJsonField(
                                                      completedOrdersListItem,
                                                      r'''$.packageDetails.image''',
                                                    ).toString()}',
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Order ID: #${getJsonField(
                                                            completedOrdersListItem,
                                                            r'''$.orderNo''',
                                                          ).toString()}',
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray400,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            completedOrdersListItem,
                                                            r'''$.packageDetails.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.2,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            6.0),
                                                                child: custom_widgets
                                                                    .GetCurrencySymboolBold(
                                                                  width: 15.0,
                                                                  height: 20.0,
                                                                  isSimbool: CarServiceGroup
                                                                      .currencyApiCall
                                                                      .currency(
                                                                    containerCurrencyApiResponse
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
                                                              functions
                                                                  .roundToTwoDecimalPlaces(
                                                                      getJsonField(
                                                                    completedOrdersListItem,
                                                                    r'''$.Total''',
                                                                  ).toDouble())
                                                                  .toString(),
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
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          functions
                                                              .capitalizeFirst(
                                                                  getJsonField(
                                                            completedOrdersListItem,
                                                            r'''$.orderStatus''',
                                                          ).toString()),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
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
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 208.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                26.0, 0.0, 26.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/No_Service_Yet.png',
                                    width: 108.0,
                                    height: 108.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  'No order yet!',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                Text(
                                  'Explore and shortlist somelist some \nproduct',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
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
