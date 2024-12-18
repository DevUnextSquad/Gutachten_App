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
import 'my_car_list_shimmer_model.dart';
export 'my_car_list_shimmer_model.dart';

class MyCarListShimmerWidget extends StatefulWidget {
  const MyCarListShimmerWidget({super.key});

  @override
  State<MyCarListShimmerWidget> createState() => _MyCarListShimmerWidgetState();
}

class _MyCarListShimmerWidgetState extends State<MyCarListShimmerWidget>
    with TickerProviderStateMixin {
  late MyCarListShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyCarListShimmerModel());

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
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final randomList = List.generate(random_data.randomInteger(4, 5),
            (index) => random_data.randomName(true, false)).toList();

        return ListView.separated(
          padding: EdgeInsets.fromLTRB(
            0,
            16.0,
            0,
            16.0,
          ),
          scrollDirection: Axis.vertical,
          itemCount: randomList.length,
          separatorBuilder: (_, __) => SizedBox(height: 16.0),
          itemBuilder: (context, randomListIndex) {
            final randomListItem = randomList[randomListIndex];
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Stack(
                alignment: AlignmentDirectional(1.0, -1.0),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 104.0,
                              height: 104.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).gray100,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation1']!),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 26.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).gray100,
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).gray100,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation3']!),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 17.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 73.0,
                          height: 28.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation4']!),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
