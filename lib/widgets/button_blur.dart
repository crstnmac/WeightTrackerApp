import 'package:flutter/material.dart';

class ButtonBlur extends StatelessWidget {
  final Widget child;
  final double height;
  final Color color;
  final double width;
  final double blurRadius;
  final double offsetY;
  final double offsetX;
  final double containerRadius;
  final double opacity;

  ButtonBlur(
      {@required this.child,
      @required this.height,
      @required this.color,
      this.blurRadius = 20.0,
      this.offsetY = 4,
      this.offsetX = 0,
      this.width,
      this.containerRadius = 18.0,
      this.opacity = 0.2})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(containerRadius),
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(opacity),
              blurRadius: blurRadius,
              offset: Offset(offsetX, offsetY),
            ),
            BoxShadow(
              color: color.withOpacity(opacity),
              blurRadius: blurRadius,
              offset: Offset(offsetX, offsetY),
            ),
          ]),
      child: this.child,
    );
  }
}
