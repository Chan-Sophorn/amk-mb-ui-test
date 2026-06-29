import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  final _textStyle = const TextStyle(
    fontSize: 12,
    color: Colors.black87,
    height: 1.4,
  );

  final _actionStyle = const TextStyle(
    fontSize: 12,
    color: Colors.red,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const suffix = "Read more";

        final textPainter = TextPainter(
          text: TextSpan(text: widget.text, style: _textStyle),
          maxLines: 2,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflow = textPainter.didExceedMaxLines;

        if (!isOverflow) {
          return Text(widget.text, style: _textStyle);
        }

        if (_isExpanded) {
          return RichText(
            text: TextSpan(
              style: _textStyle,
              children: [
                TextSpan(text: widget.text),
                TextSpan(
                  text: "Read less",
                  style: _actionStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        _isExpanded = false;
                      });
                    },
                ),
              ],
            ),
          );
        }

        int endIndex = widget.text.length;

        while (endIndex > 0) {
          final span = TextSpan(
            text: widget.text.substring(0, endIndex) + suffix,
            style: _textStyle,
          );

          final tp = TextPainter(
            text: span,
            maxLines: 2,
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: constraints.maxWidth);

          if (!tp.didExceedMaxLines) break;

          endIndex--;
        }

        return RichText(
          maxLines: 2,
          text: TextSpan(
            style: _textStyle,
            children: [
              TextSpan(text: widget.text.substring(0, endIndex)),
              TextSpan(
                text: suffix,
                style: _actionStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      _isExpanded = true;
                    });
                  },
              ),
            ],
          ),
        );
      },
    );
  }
}
