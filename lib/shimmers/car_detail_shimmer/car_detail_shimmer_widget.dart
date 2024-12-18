import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_detail_shimmer_model.dart';
export 'car_detail_shimmer_model.dart';

class CarDetailShimmerWidget extends StatefulWidget {
  const CarDetailShimmerWidget({super.key});

  @override
  State<CarDetailShimmerWidget> createState() => _CarDetailShimmerWidgetState();
}

class _CarDetailShimmerWidgetState extends State<CarDetailShimmerWidget>
    with TickerProviderStateMixin {
  late CarDetailShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarDetailShimmerModel());

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
      'containerOnPageLoadAnimation3': AnimationInfo(
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
      'containerOnPageLoadAnimation4': AnimationInfo(
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
      'containerOnPageLoadAnimation5': AnimationInfo(
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
      'containerOnPageLoadAnimation6': AnimationInfo(
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
      'containerOnPageLoadAnimation7': AnimationInfo(
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
      'containerOnPageLoadAnimation8': AnimationInfo(
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
      'containerOnPageLoadAnimation9': AnimationInfo(
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
      'containerOnPageLoadAnimation10': AnimationInfo(
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
      'containerOnPageLoadAnimation11': AnimationInfo(
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
      'containerOnPageLoadAnimation12': AnimationInfo(
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
      'containerOnPageLoadAnimation13': AnimationInfo(
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
      'containerOnPageLoadAnimation14': AnimationInfo(
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 26.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).gray100,
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 26.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).gray100,
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation4']!),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 20.0),
          child: Container(
            width: double.infinity,
            height: 26.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).gray100,
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation5']!),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 400.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation6']!),
                Container(
                  width: double.infinity,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation7']!),
                Container(
                  width: double.infinity,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation8']!),
                Container(
                  width: double.infinity,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation9']!),
                Container(
                  width: double.infinity,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation10']!),
                Container(
                  width: double.infinity,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation11']!),
                Container(
                  width: double.infinity,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation12']!),
                Container(
                  width: double.infinity,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation13']!),
                Container(
                  width: double.infinity,
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation14']!),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ],
    );
  }
}
