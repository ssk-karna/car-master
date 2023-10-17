import 'package:connectus_dummy/utils/color_set.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowTextWidget extends StatefulWidget {
  final String text;
  final bool isLabel;

  RowTextWidget({
    required this.text,
    this.isLabel = false,
  });
  @override
  State<RowTextWidget> createState() => _RowTextWidgetState();
}

class _RowTextWidgetState extends State<RowTextWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(widget.text,
      style: TextStyle(
        fontWeight: widget.isLabel ? FontWeight.bold : FontWeight.normal,
        fontSize: widget.isLabel ? 18.0 : 14.0,
        color: widget.isLabel ? ColorSet.labelText : Colors.blueGrey
      ),),
    );
  }
}
