import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'password_succsess_alrt_model.dart';
export 'password_succsess_alrt_model.dart';

class PasswordSuccsessAlrtWidget extends StatefulWidget {
  const PasswordSuccsessAlrtWidget({
    super.key,
    required this.onTapLogin,
  });

  final Future Function()? onTapLogin;

  @override
  State<PasswordSuccsessAlrtWidget> createState() =>
      _PasswordSuccsessAlrtWidgetState();
}

class _PasswordSuccsessAlrtWidgetState
    extends State<PasswordSuccsessAlrtWidget> {
  late PasswordSuccsessAlrtModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordSuccsessAlrtModel());
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
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
            color: FlutterFlowTheme.of(context).tertiary,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 38.0, 30.0, 38.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Lottie.asset(
                    'assets/jsons/5CeJyXS8q8.json',
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                ),
                Text(
                  'Password Updated',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display',
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                        lineHeight: 1.5,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 24.0),
                  child: Text(
                    'You have successfully change your password. please use your new password to log in ',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.5,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(43.0, 0.0, 43.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await widget.onTapLogin?.call();
                    },
                    text: 'Go to log In',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'SF Pro Display',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
