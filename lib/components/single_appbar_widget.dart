import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'single_appbar_model.dart';
export 'single_appbar_model.dart';

class SingleAppbarWidget extends StatefulWidget {
  const SingleAppbarWidget({
    super.key,
    String? title,
  }) : this.title = title ?? 'Title';

  final String title;

  @override
  State<SingleAppbarWidget> createState() => _SingleAppbarWidgetState();
}

class _SingleAppbarWidgetState extends State<SingleAppbarWidget> {
  late SingleAppbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 128.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 16.0),
          child: Text(
            valueOrDefault<String>(
              widget!.title,
              'Title',
            ),
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
        ),
      ),
    );
  }
}
