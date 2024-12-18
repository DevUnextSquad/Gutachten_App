import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recommennded_list_shimmer_model.dart';
export 'recommennded_list_shimmer_model.dart';

class RecommenndedListShimmerWidget extends StatefulWidget {
  const RecommenndedListShimmerWidget({super.key});

  @override
  State<RecommenndedListShimmerWidget> createState() =>
      _RecommenndedListShimmerWidgetState();
}

class _RecommenndedListShimmerWidgetState
    extends State<RecommenndedListShimmerWidget> with TickerProviderStateMixin {
  late RecommenndedListShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommenndedListShimmerModel());

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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Builder(
        builder: (context) {
          final recomendedList = List.generate(random_data.randomInteger(3, 6),
              (index) => random_data.randomName(true, false)).toList();

          return GridView.builder(
            padding: EdgeInsets.fromLTRB(
              0,
              16.0,
              0,
              16.0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return 3;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return 5;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return 7;
                } else {
                  return 9;
                }
              }(),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return 0.65;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return 0.75;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return 0.80;
                } else {
                  return 0.95;
                }
              }(),
            ),
            scrollDirection: Axis.vertical,
            itemCount: recomendedList.length,
            itemBuilder: (context, recomendedListIndex) {
              final recomendedListItem = recomendedList[recomendedListIndex];
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 91.0,
                    height: 91.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).gray100,
                      shape: BoxShape.circle,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
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
              );
            },
          );
        },
      ),
    );
  }
}
