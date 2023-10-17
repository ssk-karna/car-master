import 'package:flutter/cupertino.dart';

class LabelWidget extends StatefulWidget {
  final String labelText;
  final String labelValue;

  LabelWidget({
    required this.labelText,
    this.labelValue = "",
});

  @override
  State<LabelWidget> createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12
            ),
          ),
          Text(
            widget.labelValue,
            style: TextStyle(
                fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

