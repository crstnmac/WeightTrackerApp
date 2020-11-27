import 'dart:async';
import 'dart:math';

import 'package:WeightLossCal/widgets/circlePath.dart';
import 'package:flutter/material.dart';

class AnimatedView extends StatefulWidget {
  @override
  _AnimatedViewState createState() => _AnimatedViewState();
}

class _AnimatedViewState extends State<AnimatedView>
    with SingleTickerProviderStateMixin {
  Animation animation;
  Animation opacity;
  AnimationController animationController;
  int sAngle;
  int mAngle;
  int lAngle;
  Random random = new Random();
  Timer timer;

  @override
  void initState() {
    super.initState();
    sAngle = 44;
    mAngle = 42;
    lAngle = 40;

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    opacity = Tween<double>(begin: 0.8, end: 0.0).animate(new CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCirc));
    animation = Tween<double>(begin: 0, end: 140).animate(new CurvedAnimation(
        parent: animationController, curve: Curves.easeInCirc))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.8,
      child: CustomPaint(
        painter: AnimatedCircle(
          value: animation.value,
          sAngle: sAngle,
          mAngle: mAngle,
          lAngle: lAngle,
          opacity: opacity.value,
          showOnLargeCircle: true,
        ),
      ),
    );
  }
}
