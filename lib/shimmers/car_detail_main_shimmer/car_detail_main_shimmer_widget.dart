import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_detail_main_shimmer_model.dart';
export 'car_detail_main_shimmer_model.dart';

class CarDetailMainShimmerWidget extends StatefulWidget {
  const CarDetailMainShimmerWidget({super.key});

  @override
  State<CarDetailMainShimmerWidget> createState() =>
      _CarDetailMainShimmerWidgetState();
}

class _CarDetailMainShimmerWidgetState extends State<CarDetailMainShimmerWidget>
    with TickerProviderStateMixin {
  late CarDetailMainShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarDetailMainShimmerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
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
      'containerOnPageLoadAnimation2': AnimationInfo(
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 301.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).gray100,
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation1']!),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 63.0, 0.0, 0.0),
              child: Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).gray100,
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
            ),
          ],
        ),
      ],
    );
  }
}
