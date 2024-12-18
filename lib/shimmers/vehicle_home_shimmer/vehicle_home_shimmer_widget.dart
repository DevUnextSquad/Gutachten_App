import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vehicle_home_shimmer_model.dart';
export 'vehicle_home_shimmer_model.dart';

class VehicleHomeShimmerWidget extends StatefulWidget {
  const VehicleHomeShimmerWidget({super.key});

  @override
  State<VehicleHomeShimmerWidget> createState() =>
      _VehicleHomeShimmerWidgetState();
}

class _VehicleHomeShimmerWidgetState extends State<VehicleHomeShimmerWidget>
    with TickerProviderStateMixin {
  late VehicleHomeShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehicleHomeShimmerModel());

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
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 320.0,
          height: 148.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Stack(
            alignment: AlignmentDirectional(1.0, -1.0),
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 22.0, 17.0, 22.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 104.0,
                      height: 104.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).gray100,
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                    Expanded(
                      child: Container(
                        height: 27.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).gray100,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 17.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Container(
                          width: 73.0,
                          height: 28.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation3']!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 320.0,
          height: 148.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Stack(
            alignment: AlignmentDirectional(1.0, -1.0),
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 22.0, 17.0, 22.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 104.0,
                      height: 104.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).gray100,
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation4']!),
                    Expanded(
                      child: Container(
                        height: 27.0,
                        decoration: BoxDecoration(),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation5']!),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 17.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Container(
                          width: 73.0,
                          height: 28.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation6']!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 320.0,
          height: 148.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Stack(
            alignment: AlignmentDirectional(1.0, -1.0),
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 22.0, 17.0, 22.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 104.0,
                      height: 104.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).gray100,
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation7']!),
                    Expanded(
                      child: Container(
                        height: 27.0,
                        decoration: BoxDecoration(),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation8']!),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 17.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Container(
                          width: 73.0,
                          height: 28.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation9']!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]
          .divide(SizedBox(width: 16.0))
          .addToStart(SizedBox(width: 16.0))
          .addToEnd(SizedBox(width: 16.0)),
    );
  }
}
