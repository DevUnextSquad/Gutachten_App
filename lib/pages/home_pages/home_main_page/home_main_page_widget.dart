import '/backend/api_requests/api_calls.dart';
import '/components/verified_email_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/home_pages/home_componant/home_componant_widget.dart';
import '/pages/my_order_pages/my_order_componant/my_order_componant_widget.dart';
import '/pages/profile_pages/profile_componant/profile_componant_widget.dart';
import '/pages/search_pages/search_componant/search_componant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_main_page_model.dart';
export 'home_main_page_model.dart';

class HomeMainPageWidget extends StatefulWidget {
  const HomeMainPageWidget({super.key});

  @override
  State<HomeMainPageWidget> createState() => _HomeMainPageWidgetState();
}

class _HomeMainPageWidgetState extends State<HomeMainPageWidget> {
  late HomeMainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print('token: ${FFAppState().tokenFcm}');
    _model = createModel(context, () => HomeMainPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isLogin == true) {
        _model.getUserFunction = await CarServiceGroup.getUserApiCall.call(
          userId: FFAppState().userId,
          token: FFAppState().token,
        );

        _model.userVerifiedFunction =
            await CarServiceGroup.verifyUserApiCall.call(
          email: CarServiceGroup.getUserApiCall.email(
            (_model.getUserFunction?.jsonBody ?? ''),
          ),
        );

        if (CarServiceGroup.verifyUserApiCall.success(
              (_model.userVerifiedFunction?.jsonBody ?? ''),
            ) ==
            1) {
          FFAppState().isVerified = true;
          FFAppState().countryCodeEdit =
              CarServiceGroup.getUserApiCall.countrycode(
            (_model.getUserFunction?.jsonBody ?? ''),
          )!;
          FFAppState().phone = CarServiceGroup.getUserApiCall.phone(
            (_model.getUserFunction?.jsonBody ?? ''),
          )!;
          FFAppState().update(() {});
          _model.vehicleListFunctionHome =
              await CarServiceGroup.vehicleListApiCall.call(
            userId: FFAppState().userId,
            token: FFAppState().token,
          );

          if (!(CarServiceGroup.vehicleListApiCall.vehicleDetailsList(
                    (_model.vehicleListFunctionHome?.jsonBody ?? ''),
                  ) !=
                  null &&
              (CarServiceGroup.vehicleListApiCall.vehicleDetailsList(
                (_model.vehicleListFunctionHome?.jsonBody ?? ''),
              ))!
                  .isNotEmpty)) {
            FFAppState().isLoginVehicleCheck = true;
            FFAppState().update(() {});

            context.goNamed('SelectVehicleTypePage');
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                CarServiceGroup.verifyUserApiCall.message(
                  (_model.userVerifiedFunction?.jsonBody ?? ''),
                )!,
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () => FocusScope.of(dialogContext).unfocus(),
                  child: VerifiedEmailDialogWidget(
                    email: CarServiceGroup.getUserApiCall.email(
                      (_model.getUserFunction?.jsonBody ?? ''),
                    )!,
                  ),
                ),
              );
            },
          );
        }
      }
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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().connected) {
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 500.0,
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: max(
                                        0,
                                        min(
                                            valueOrDefault<int>(
                                              FFAppState().homeIndex,
                                              0,
                                            ),
                                            3))),
                            scrollDirection: Axis.horizontal,
                            children: [
                              wrapWithModel(
                                model: _model.homeComponantModel,
                                updateCallback: () => safeSetState(() {}),
                                child: HomeComponantWidget(),
                              ),
                              wrapWithModel(
                                model: _model.searchComponantModel,
                                updateCallback: () => safeSetState(() {}),
                                child: SearchComponantWidget(),
                              ),
                              wrapWithModel(
                                model: _model.myOrderComponantModel,
                                updateCallback: () => safeSetState(() {}),
                                child: MyOrderComponantWidget(),
                              ),
                              wrapWithModel(
                                model: _model.profileComponantModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ProfileComponantWidget(),
                              ),
                            ],
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 26.0,
                      color: Color(0x15000000),
                      offset: Offset(
                        0.0,
                        -4.0,
                      ),
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().homeIndex = 0;
                            safeSetState(() {});
                            await _model.pageViewController?.animateToPage(
                              FFAppState().homeIndex,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (FFAppState().homeIndex == 0) {
                                    return Container(
                                      width: 59.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius:
                                            BorderRadius.circular(170.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: SvgPicture.asset(
                                            'assets/images/homefill.svg',
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/home.svg',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                'Home',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      color: FFAppState().homeIndex == 0
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ].divide(SizedBox(
                                height:
                                    FFAppState().homeIndex == 0 ? 5.0 : 8.0)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().homeIndex = 1;
                            safeSetState(() {});
                            await _model.pageViewController?.animateToPage(
                              FFAppState().homeIndex,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (FFAppState().homeIndex == 1) {
                                    return Container(
                                      width: 59.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius:
                                            BorderRadius.circular(170.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: SvgPicture.asset(
                                            'assets/images/search-normal.svg',
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/search.svg',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                'Search',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      color: FFAppState().homeIndex == 1
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ].divide(SizedBox(
                                height:
                                    FFAppState().homeIndex == 1 ? 5.0 : 8.0)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().homeIndex = 2;
                            safeSetState(() {});
                            await _model.pageViewController?.animateToPage(
                              FFAppState().homeIndex,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (FFAppState().homeIndex == 2) {
                                    return Container(
                                      width: 59.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius:
                                            BorderRadius.circular(170.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: SvgPicture.asset(
                                            'assets/images/note.svg',
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/MyOrder.svg',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                'My order',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      color: FFAppState().homeIndex == 2
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ].divide(SizedBox(
                                height:
                                    FFAppState().homeIndex == 2 ? 5.0 : 8.0)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().homeIndex = 3;
                            safeSetState(() {});
                            await _model.pageViewController?.animateToPage(
                              FFAppState().homeIndex,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (FFAppState().homeIndex == 3) {
                                    return Container(
                                      width: 59.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius:
                                            BorderRadius.circular(170.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: SvgPicture.asset(
                                            'assets/images/profile_fill.svg',
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/profile.svg',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                'Profile',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      color: FFAppState().homeIndex == 3
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ].divide(SizedBox(
                                height:
                                    FFAppState().homeIndex == 3 ? 5.0 : 8.0)),
                          ),
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
  }
}
