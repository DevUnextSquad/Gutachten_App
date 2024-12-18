import '/backend/api_requests/api_calls.dart';
import '/componants/no_slot_set_componant/no_slot_set_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'select_tme_date_page_copy_model.dart';
export 'select_tme_date_page_copy_model.dart';

class SelectTmeDatePageCopyWidget extends StatefulWidget {
  const SelectTmeDatePageCopyWidget({
    super.key,
    required this.packageId,
    required this.packageTitle,
    required this.packageImage,
    required this.packagePrice,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
    required this.currencySymbol,
  });

  final String? packageId;
  final String? packageTitle;
  final String? packageImage;
  final double? packagePrice;
  final String? serviceId;
  final String? serviceName;
  final String? serviceImage;
  final String? currencySymbol;

  @override
  State<SelectTmeDatePageCopyWidget> createState() =>
      _SelectTmeDatePageCopyWidgetState();
}

class _SelectTmeDatePageCopyWidgetState
    extends State<SelectTmeDatePageCopyWidget> {
  late SelectTmeDatePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectTmeDatePageCopyModel());
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
                  title: 'Select time & date',
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
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FlutterFlowCalendar(
                                    color: FlutterFlowTheme.of(context).primary,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    weekFormat: true,
                                    weekStartsMonday: true,
                                    initialDate: getCurrentTimestamp,
                                    rowHeight: 70.0,
                                    onChange:
                                        (DateTimeRange? newSelectedDate) async {
                                      if (_model.calendarSelectedDay ==
                                          newSelectedDate) {
                                        return;
                                      }
                                      _model.calendarSelectedDay =
                                          newSelectedDate;
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                      safeSetState(() {});
                                    },
                                    titleStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                    dayOfWeekStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                    dateStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    selectedDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                    inactiveDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (functions.isDateValid(
                                      _model.calendarSelectedDay!.start)) {
                                    return Builder(
                                      builder: (context) {
                                        if (_model.calendarSelectedDay?.start ==
                                            getCurrentTimestamp) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: (_model
                                                          .apiRequestCompleter ??=
                                                      Completer<
                                                          ApiCallResponse>()
                                                        ..complete(CarServiceGroup
                                                            .availableSlotsApiCall
                                                            .call(
                                                          bookingDate:
                                                              dateTimeFormat(
                                                                  "dd-MM-yyyy",
                                                                  _model
                                                                      .calendarSelectedDay
                                                                      ?.start),
                                                          token: FFAppState()
                                                              .token,
                                                        )))
                                                  .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewAvailableSlotsApiResponse =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final availableSlotsList =
                                                        FFAppState()
                                                            .selectTimeDate
                                                            .toList();
                                                    if (availableSlotsList
                                                        .isEmpty) {
                                                      return Center(
                                                        child: Container(
                                                          height: 208.0,
                                                          child:
                                                              NoSlotSetComponantWidget(),
                                                        ),
                                                      );
                                                    }

                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        0,
                                                        24.0,
                                                        0,
                                                        24.0,
                                                      ),
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          availableSlotsList
                                                              .length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 16.0),
                                                      itemBuilder: (context,
                                                          availableSlotsListIndex) {
                                                        final availableSlotsListItem =
                                                            availableSlotsList[
                                                                availableSlotsListIndex];
                                                        return Builder(
                                                          builder: (context) {
                                                            if ('0' ==
                                                                getJsonField(
                                                                  availableSlotsListItem,
                                                                  r'''$.booked''',
                                                                ).toString()) {
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
                                                                  _model.bookingTime =
                                                                      availableSlotsListIndex;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.bookingTimePage =
                                                                      getJsonField(
                                                                    availableSlotsListItem,
                                                                    r'''$.time''',
                                                                  ).toString();
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: availableSlotsListIndex ==
                                                                            _model
                                                                                .bookingTime
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            20.0,
                                                                            16.0,
                                                                            20.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (availableSlotsListIndex ==
                                                                                _model.bookingTime) {
                                                                              return ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/radio_button_time.svg',
                                                                                  width: 24.0,
                                                                                  height: 24.0,
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/radio_button.svg',
                                                                                  width: 24.0,
                                                                                  height: 24.0,
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                availableSlotsListItem,
                                                                                r'''$.time''',
                                                                              ).toString(),
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'SF Pro Display',
                                                                                    color: availableSlotsListIndex == _model.bookingTime ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
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
                                                                      .gray300,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          20.0,
                                                                          16.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            availableSlotsListItem,
                                                                            r'''$.time''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                color: availableSlotsListIndex == _model.bookingTime ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
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
                                                              );
                                                            }
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: CarServiceGroup
                                                  .availableSlotsApiCall
                                                  .call(
                                                bookingDate: dateTimeFormat(
                                                    "dd-MM-yyyy",
                                                    _model.calendarSelectedDay
                                                        ?.start),
                                                token: FFAppState().token,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewAvailableSlotsApiResponse =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final availableSlotsList =
                                                        CarServiceGroup
                                                                .availableSlotsApiCall
                                                                .availableSlotsList(
                                                                  listViewAvailableSlotsApiResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];
                                                    if (availableSlotsList
                                                        .isEmpty) {
                                                      return Center(
                                                        child: Container(
                                                          height: 208.0,
                                                          child:
                                                              NoSlotSetComponantWidget(),
                                                        ),
                                                      );
                                                    }

                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        0,
                                                        24.0,
                                                        0,
                                                        24.0,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          availableSlotsList
                                                              .length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 16.0),
                                                      itemBuilder: (context,
                                                          availableSlotsListIndex) {
                                                        final availableSlotsListItem =
                                                            availableSlotsList[
                                                                availableSlotsListIndex];
                                                        return Builder(
                                                          builder: (context) {
                                                            if ('0' ==
                                                                getJsonField(
                                                                  availableSlotsListItem,
                                                                  r'''$.booked''',
                                                                ).toString()) {
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
                                                                  _model.bookingTime =
                                                                      availableSlotsListIndex;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.bookingTimePage =
                                                                      getJsonField(
                                                                    availableSlotsListItem,
                                                                    r'''$.time''',
                                                                  ).toString();
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: availableSlotsListIndex ==
                                                                            _model
                                                                                .bookingTime
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            20.0,
                                                                            16.0,
                                                                            20.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (availableSlotsListIndex ==
                                                                                _model.bookingTime) {
                                                                              return ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/radio_button_time.svg',
                                                                                  width: 24.0,
                                                                                  height: 24.0,
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/radio_button.svg',
                                                                                  width: 24.0,
                                                                                  height: 24.0,
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                availableSlotsListItem,
                                                                                r'''$.time''',
                                                                              ).toString(),
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'SF Pro Display',
                                                                                    color: availableSlotsListIndex == _model.bookingTime ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
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
                                                                      .gray300,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          20.0,
                                                                          16.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            availableSlotsListItem,
                                                                            r'''$.time''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                color: availableSlotsListIndex == _model.bookingTime ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
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
                                                              );
                                                            }
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            26.0, 0.0, 26.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/Coupon_Empty.png',
                                                width: 108.0,
                                                height: 108.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: Text(
                                                'Slot not available',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              'No openings available try back soon \nfor service',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                    );
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: (_model.bookingTime == null)
                                    ? null
                                    : () async {
                                        context.pushNamed(
                                          'CheckoutPage',
                                          queryParameters: {
                                            'packageId': serializeParam(
                                              widget!.packageId,
                                              ParamType.String,
                                            ),
                                            'bookingDate': serializeParam(
                                              dateTimeFormat(
                                                  "dd-MM-yyyy",
                                                  _model.calendarSelectedDay
                                                      ?.start),
                                              ParamType.String,
                                            ),
                                            'packageTitle': serializeParam(
                                              widget!.packageTitle,
                                              ParamType.String,
                                            ),
                                            'packageImage': serializeParam(
                                              widget!.packageImage,
                                              ParamType.String,
                                            ),
                                            'packagePrice': serializeParam(
                                              widget!.packagePrice,
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
                                            'bookingTime': serializeParam(
                                              _model.bookingTimePage,
                                              ParamType.String,
                                            ),
                                            'currencySymbol': serializeParam(
                                              widget!.currencySymbol,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        FFAppState().selectTimeDate =
                                            FFAppState()
                                                .selectTimeDate
                                                .toList()
                                                .cast<dynamic>();
                                        FFAppState().update(() {});
                                      },
                                text: 'Checkout',
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
                                  disabledColor:
                                      FlutterFlowTheme.of(context).gray300,
                                  disabledTextColor:
                                      FlutterFlowTheme.of(context).primaryText,
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
