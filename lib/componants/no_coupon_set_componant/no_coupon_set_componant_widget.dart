import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_coupon_set_componant_model.dart';
export 'no_coupon_set_componant_model.dart';

class NoCouponSetComponantWidget extends StatefulWidget {
  const NoCouponSetComponantWidget({super.key});

  @override
  State<NoCouponSetComponantWidget> createState() =>
      _NoCouponSetComponantWidgetState();
}

class _NoCouponSetComponantWidgetState
    extends State<NoCouponSetComponantWidget> {
  late NoCouponSetComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoCouponSetComponantModel());
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
        padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 26.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/Coupon_Empty.png',
                width: 108.0,
                height: 108.0,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'No coupon available',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Display',
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                    lineHeight: 1.5,
                  ),
            ),
            Text(
              'But don’t worry you still get to enjoy the best deals & offers with us',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Display',
                    color: FlutterFlowTheme.of(context).secondaryText,
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
}
