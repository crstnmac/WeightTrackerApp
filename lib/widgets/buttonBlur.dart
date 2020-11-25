import 'package:flutter/material.dart';

class ButtonBlur extends StatelessWidget {
  final Widget child;
  final double height;
  final Color color;
  double width;

  ButtonBlur(
      {@required this.child,
      @required this.height,
      @required this.color,
      this.width})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(this.height / 2),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.08),
            blurRadius: height / 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: this.child,
    );
  }
}
