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

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class HtmlConvert extends StatefulWidget {
  const HtmlConvert({
    super.key,
    this.width,
    this.height,
    this.htmlContent,
  });

  final double? width;
  final double? height;
  final String? htmlContent;

  @override
  State<HtmlConvert> createState() => _HtmlConvertState();
}

class _HtmlConvertState extends State<HtmlConvert> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HtmlWidget(
          widget.htmlContent!,

          // baseUrl: Uri.parse(widget.url),
          onTapUrl: (url) {
            launchURL(url);
            return true;
          },
        ),
      ],
    );
  }
}
