import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedCircle extends CustomPainter {
  final double value;
  final double opacity;
  final int sAngle;
  final int mAngle;
  final int lAngle;
  final bool showOnLargeCircle;

  AnimatedCircle(
      {this.mAngle,
      this.lAngle,
      this.value,
      this.opacity,
      this.sAngle,
      this.showOnLargeCircle});
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var largeCircle = Paint();
    largeCircle.style = PaintingStyle.stroke;
    largeCircle.strokeWidth = 0.5;
    largeCircle.color = Colors.white.withOpacity(0.5);

    var childDot1 = Paint();
    childDot1.color = Colors.lightBlueAccent;
    var childDot2 = Paint();
    childDot2.color = Colors.lightGreenAccent;
    var childDot3 = Paint();
    childDot3.color = Colors.orangeAccent;

    canvas.drawCircle(center, radius, largeCircle);

    if (showOnLargeCircle) {
      double valX1 = x(min(centerX, centerY), sAngle, centerX);
      double valY1 = y(min(centerX, centerY), sAngle, centerY);
      Offset offset1 = Offset(valX1, valY1);
      canvas.drawCircle(
          offset1, (value * .15).clamp(1, 8).toDouble(), childDot1);
      double valX2 = x(min(centerX, centerY), mAngle, centerX);
      double valY2 = y(min(centerX, centerY), mAngle, centerY);
      Offset offset2 = Offset(valX2, valY2);
      canvas.drawCircle(
          offset2, (value * .15).clamp(1, 5).toDouble(), childDot2);
      double valX = x(min(centerX, centerY), lAngle, centerX);
      double valY = y(min(centerX, centerY), lAngle, centerY);
      Offset offset = Offset(valX, valY);
      canvas.drawCircle(
          offset, (value * .15).clamp(1, 6).toDouble(), childDot3);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

double x(r, angle, centerX) => r * cos((angle - pi / 2)) + centerX;
double y(r, angle, centerY) => r * sin((angle - pi / 2)) + centerY;
