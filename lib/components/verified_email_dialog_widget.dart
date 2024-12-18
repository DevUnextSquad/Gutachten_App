import '/backend/api_requests/api_calls.dart';
import '/components/verified_email_o_t_p_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verified_email_dialog_model.dart';
export 'verified_email_dialog_model.dart';

class VerifiedEmailDialogWidget extends StatefulWidget {
  const VerifiedEmailDialogWidget({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  State<VerifiedEmailDialogWidget> createState() =>
      _VerifiedEmailDialogWidgetState();
}

class _VerifiedEmailDialogWidgetState extends State<VerifiedEmailDialogWidget> {
  late VerifiedEmailDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifiedEmailDialogModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Container(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 300.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 395.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 395.0;
            } else {
              return 395.0;
            }
          }(),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(19.0, 30.0, 19.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/verifiy_email_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Verify your email',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display',
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                        lineHeight: 1.5,
                      ),
                ),
                RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Verify your email ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                      ),
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget!.email,
                          'Email',
                        ),
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: ' please enter 4 digit code check inbox',
                        style: TextStyle(),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.5,
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () async {
                      _model.resetOtpFunction =
                          await CarServiceGroup.resendOTPApiCall.call(
                        email: widget!.email,
                      );

                      if (CarServiceGroup.resendOTPApiCall.success(
                            (_model.resetOtpFunction?.jsonBody ?? ''),
                          ) ==
                          1) {
                        Navigator.pop(context);
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: VerifiedEmailOTPDialogWidget(
                                email: widget!.email!,
                              ),
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              CarServiceGroup.resendOTPApiCall.message(
                                (_model.resetOtpFunction?.jsonBody ?? ''),
                              )!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                            duration: Duration(milliseconds: 2000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                        );
                        Navigator.pop(context);
                      }

                      safeSetState(() {});
                    },
                    text: 'Send OTP',
                    options: FFButtonOptions(
                      width: 250.0,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'SF Pro Display',
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                                lineHeight: 1.2,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
