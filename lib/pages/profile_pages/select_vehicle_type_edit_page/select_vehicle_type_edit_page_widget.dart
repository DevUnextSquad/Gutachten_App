import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/select_vehicle_type_list_shimmer/select_vehicle_type_list_shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'select_vehicle_type_edit_page_model.dart';
export 'select_vehicle_type_edit_page_model.dart';

class SelectVehicleTypeEditPageWidget extends StatefulWidget {
  const SelectVehicleTypeEditPageWidget({
    super.key,
    required this.vehicleId,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.vehicleTypeId,
  });

  final String? vehicleId;
  final String? vehicleName;
  final String? vehicleNumber;
  final String? vehicleTypeId;

  @override
  State<SelectVehicleTypeEditPageWidget> createState() =>
      _SelectVehicleTypeEditPageWidgetState();
}

class _SelectVehicleTypeEditPageWidgetState
    extends State<SelectVehicleTypeEditPageWidget> {
  late SelectVehicleTypeEditPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectVehicleTypeEditPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.vehicleTypeIdPage = widget!.vehicleTypeId;
      safeSetState(() {});
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.customCenterAppbarModel,
                updateCallback: () => safeSetState(() {}),
                child: CustomCenterAppbarWidget(
                  title: 'Select vehicle type',
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
                        child: FutureBuilder<ApiCallResponse>(
                          future: CarServiceGroup.vehicleTypesApiCall.call(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: SelectVehicleTypeListShimmerWidget(),
                                ),
                              );
                            }
                            final columnVehicleTypesApiResponse =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final selectVehicleTypeList =
                                            CarServiceGroup.vehicleTypesApiCall
                                                    .vehicleDetailsList(
                                                      columnVehicleTypesApiResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            16.0,
                                            0,
                                            16.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              selectVehicleTypeList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 16.0),
                                          itemBuilder: (context,
                                              selectVehicleTypeListIndex) {
                                            final selectVehicleTypeListItem =
                                                selectVehicleTypeList[
                                                    selectVehicleTypeListIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.vehicleTypeIdPage =
                                                    getJsonField(
                                                  selectVehicleTypeListItem,
                                                  r'''$.id''',
                                                ).toString();
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: _model
                                                              .vehicleTypeIdPage ==
                                                          getJsonField(
                                                            selectVehicleTypeListItem,
                                                            r'''$.id''',
                                                          ).toString()
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  border: Border.all(
                                                    color: _model
                                                                .vehicleTypeIdPage ==
                                                            getJsonField(
                                                              selectVehicleTypeListItem,
                                                              r'''$.id''',
                                                            ).toString()
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : Color(0x00000000),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 72.0,
                                                          height: 72.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .vehicleTypeIdPage ==
                                                                    getJsonField(
                                                                      selectVehicleTypeListItem,
                                                                      r'''$.id''',
                                                                    ).toString()
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray100,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: ClipRRect(
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
                                                                selectVehicleTypeListItem,
                                                                r'''$.image''',
                                                              ).toString()}',
                                                              width: 48.0,
                                                              height: 48.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          getJsonField(
                                                            selectVehicleTypeListItem,
                                                            r'''$.vehicle_type''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                      ),
                                                      if (_model
                                                              .vehicleTypeIdPage ==
                                                          getJsonField(
                                                            selectVehicleTypeListItem,
                                                            r'''$.id''',
                                                          ).toString())
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/checked_1.svg',
                                                            width: 24.0,
                                                            height: 24.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
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
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onDoubleTap: () async {
                                      if (FFAppState().selectVehicleTypeList ==
                                          0) {
                                        _model.vehicleTypeIdPage = getJsonField(
                                          CarServiceGroup.vehicleTypesApiCall
                                              .vehicleDetailsList(
                                                columnVehicleTypesApiResponse
                                                    .jsonBody,
                                              )
                                              ?.first,
                                          r'''$.id''',
                                        ).toString();
                                        safeSetState(() {});

                                        context.pushNamed(
                                          'CarDetailsEditPage',
                                          queryParameters: {
                                            'vehicleTypeId': serializeParam(
                                              _model.vehicleTypeIdPage,
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
                                            'vehicleId': serializeParam(
                                              widget!.vehicleId,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        context.pushNamed(
                                          'CarDetailsEditPage',
                                          queryParameters: {
                                            'vehicleTypeId': serializeParam(
                                              _model.vehicleTypeIdPage,
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
                                            'vehicleId': serializeParam(
                                              widget!.vehicleId,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (widget!.vehicleTypeId ==
                                            _model.vehicleTypeIdPage) {
                                          _model.vehicleTypeIdPage =
                                              widget!.vehicleTypeId;
                                          safeSetState(() {});

                                          context.pushNamed(
                                            'CarDetailsEditPage',
                                            queryParameters: {
                                              'vehicleTypeId': serializeParam(
                                                _model.vehicleTypeIdPage,
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
                                              'vehicleId': serializeParam(
                                                widget!.vehicleId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          context.pushNamed(
                                            'CarDetailsEditPage',
                                            queryParameters: {
                                              'vehicleTypeId': serializeParam(
                                                _model.vehicleTypeIdPage,
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
                                              'vehicleId': serializeParam(
                                                widget!.vehicleId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      text: 'Continue',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 56.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
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
