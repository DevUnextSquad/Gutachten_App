// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dots_indicator/dots_indicator.dart';

class IntroDots extends StatefulWidget {
  const IntroDots({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<IntroDots> createState() => _IntroDotsState();
}

class _IntroDotsState extends State<IntroDots> {
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: 2,
      /* use AppState IntroIndex  (int) */
      // position: FFAppState().introIndex,
      decorator: DotsDecorator(
        color: const Color(0xFFE6E6E6), // Inactive color
        activeColor: const Color(0xFFEA3527),
        size: const Size.square(8.0),
        activeSize: const Size(32.0, 8.0),
        spacing: const EdgeInsets.only(left: 4, right: 4),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }
}
