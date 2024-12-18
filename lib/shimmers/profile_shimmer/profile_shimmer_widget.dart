import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_shimmer_model.dart';
export 'profile_shimmer_model.dart';

class ProfileShimmerWidget extends StatefulWidget {
  const ProfileShimmerWidget({super.key});

  @override
  State<ProfileShimmerWidget> createState() => _ProfileShimmerWidgetState();
}

class _ProfileShimmerWidgetState extends State<ProfileShimmerWidget>
    with TickerProviderStateMixin {
  late ProfileShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileShimmerModel());

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
      'containerOnPageLoadAnimation15': AnimationInfo(
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
      'containerOnPageLoadAnimation16': AnimationInfo(
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
      'containerOnPageLoadAnimation17': AnimationInfo(
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
      'containerOnPageLoadAnimation18': AnimationInfo(
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
      'containerOnPageLoadAnimation19': AnimationInfo(
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 217.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 63.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).gray100,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                      Container(
                        width: double.infinity,
                        height: 24.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).gray100,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 144.0, 40.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 148.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 22.0, 17.0, 22.0),
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
                            animationsMap['containerOnPageLoadAnimation3']!),
                        Expanded(
                          child: Container(
                            height: 27.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).gray100,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation4']!),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                0,
                12.0,
                0,
                24.0,
              ),
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation5']!),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).gray100,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation6']!),
                        ),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation7']!),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation8']!),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).gray100,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation9']!),
                        ),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation10']!),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation11']!),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).gray100,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation12']!),
                        ),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation13']!),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation14']!),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).gray100,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation15']!),
                        ),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation16']!),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation17']!),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).gray100,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation18']!),
                        ),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation19']!),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ],
    );
  }
}
