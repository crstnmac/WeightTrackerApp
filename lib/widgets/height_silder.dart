import 'package:WeightLossCal/constants.dart';
import 'package:WeightLossCal/utils/height_styles.dart';
import 'package:WeightLossCal/utils/widget.dart';
import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  final int height;

  const HeightSlider({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliderLabel(height: height),
          Row(
            children: [
              SliderCircle(),
              Expanded(child: SliderLine()),
            ],
          )
        ],
      ),
    );
  }
}

class SliderLine extends StatelessWidget {
  const SliderLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
          40,
          (index) => Expanded(
                  child: Container(
                height: 2.0,
                decoration: BoxDecoration(
                    color: index.isEven ? kBlueColor : Colors.white),
              ))),
    );
  }
}

class SliderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleSizeAdapted(context),
      height: circleSizeAdapted(context),
      decoration: BoxDecoration(color: kBlueColor, shape: BoxShape.circle),
      child: Icon(
        Icons.unfold_more,
        color: Colors.white,
        size: 0.6 * circleSizeAdapted(context),
      ),
    );
  }
}

class SliderLabel extends StatelessWidget {
  final int height;

  const SliderLabel({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(4.0, context),
        bottom: screenAwareSize(2.0, context),
      ),
      child: Text(
        "$height",
        style: TextStyle(
            fontSize: selectedLabelFontSize,
            color: kBlueColor,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
