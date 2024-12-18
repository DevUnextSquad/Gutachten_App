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

import 'package:html/parser.dart' as html_parser;

class HtmlToPlainTextWidget extends StatefulWidget {
  const HtmlToPlainTextWidget({
    super.key,
    this.width,
    this.height,
    required this.htmlString,
  });

  final double? width;
  final double? height;
  final String htmlString;

  @override
  State<HtmlToPlainTextWidget> createState() => _HtmlToPlainTextWidgetState();
}

class _HtmlToPlainTextWidgetState extends State<HtmlToPlainTextWidget> {
  @override
  Widget build(BuildContext context) {
    return HtmlToPlainText(htmlString: widget.htmlString);
  }
}

class HtmlToPlainText extends StatelessWidget {
  final String htmlString;

  HtmlToPlainText({required this.htmlString});

  @override
  Widget build(BuildContext context) {
    // Parse the HTML string into a Document object
    final document = html_parser.parse(htmlString);

    // Extract the plain text from the Document object
    final plainText = document.body?.text ?? '';

    return Text(
      plainText,
      maxLines: 2, // Limit to 2 lines
      overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows
      textAlign: TextAlign.center, // Center align the text

      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
        height:
            1.2, // Line height in terms of font size (1.2 times the font size)
      ),
    );
  }
}
