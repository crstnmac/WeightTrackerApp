import 'dart:math' as math;

import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/utils/height_styles.dart';
import 'package:WeightLossCal/widgets/height_silder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HeightController extends GetxController {
  ProfileController profileController = Get.put(ProfileController());

  final minHeight = 145;
  final maxHeight = 190;

  double startDragYOffset;
  int startDragHeight;
  int newHeight;

  int get totalUnits => maxHeight - minHeight;

  double get _pixelPerUnit {
    return _drawHeight / totalUnits;
  }

  double get _sliderPosition {
    double halfOfBottomLabel = labelsFontSize / 2;
    int unitsFromBottom = profileController.height.value - minHeight;
    return halfOfBottomLabel + unitsFromBottom * _pixelPerUnit;
  }

  double get _drawHeight {
    double totalHeight = Get.height;
    // widget.widgetHeight;
    double marginBottom = 16.0;
    double marginTop = 26.0;
    return totalHeight - (marginBottom + marginTop + labelsFontSize);
  }

  _onDragStart(DragStartDetails dragStartDetails) {
    newHeight = _globalOffsetToHeight(dragStartDetails.globalPosition);
    startDragYOffset = dragStartDetails.globalPosition.dy;
    startDragHeight = newHeight;
  }

  _onDragUpdate(DragUpdateDetails dragUpdateDetails) {
    double currentYOffset = dragUpdateDetails.globalPosition.dy;
    double verticalDifference = startDragYOffset - currentYOffset;
    int diffHeight = verticalDifference ~/ _pixelPerUnit;
    int height = _normalizeHeight(startDragHeight + diffHeight);
    profileController.height(height);
  }

  _onTapDown(TapDownDetails tapDownDetails) {
    int height = _globalOffsetToHeight(tapDownDetails.globalPosition);
    _normalizeHeight(height);
  }

  int _normalizeHeight(int height) {
    return math.max(minHeight, math.min(maxHeight, height));
  }

  int _globalOffsetToHeight(Offset globalOffset) {
    RenderBox getBox = Get.context.findRenderObject();
    Offset localPosition = getBox.globalToLocal(globalOffset);
    double dy = localPosition.dy;
    dy = dy - 26.0 - labelsFontSize / 2;
    int height = maxHeight - (dy ~/ _pixelPerUnit);
    return height;
  }
}

class HeightPicker extends StatelessWidget {
  final int maxHeight;
  final int minHeight;
  final RxInt height;
  final double widgetHeight;

  HeightPicker(
      {Key key, this.height, this.widgetHeight, this.maxHeight, this.minHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeightController heightController = Get.put(HeightController());
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: heightController._onTapDown,
      onVerticalDragStart: heightController._onDragStart,
      onVerticalDragUpdate: heightController._onDragUpdate,
      child: Stack(
        children: [
          // _drawPerson(),
          Obx(() => (_drawSlider())),
          _drawLabels(),
        ],
      ),
    );
  }

  Widget _drawPerson() {
    HeightController heightController = Get.put(HeightController());

    double personImageHeight = heightController._sliderPosition + 16.0;
    return Align(
      alignment: Alignment.bottomCenter,
      child: SvgPicture.asset(
        "images/person.svg",
        height: personImageHeight,
        width: personImageHeight / 3,
      ),
    );
  }

  Widget _drawSlider() {
    HeightController heightController = Get.put(HeightController());

    return Positioned(
      child:
          HeightSlider(height: heightController.profileController.height.value),
      left: 0.0,
      right: 0.0,
      bottom: heightController._sliderPosition,
    );
  }

  Widget _drawLabels() {
    HeightController heightController = Get.put(HeightController());

    int labelsToDispaly = heightController.totalUnits ~/ 5 + 1;
    List<Widget> labels = List.generate(
      labelsToDispaly,
      (index) => Text(
        "${heightController.maxHeight - 5 * index}",
        style: labelsTextStyle,
      ),
    );

    return Align(
      alignment: Alignment.centerRight,
      child: IgnorePointer(
        child: Padding(
          padding: EdgeInsets.only(
            right: 12.0,
            bottom: 16.0,
            top: 26.0,
          ),
          child: Column(
            children: labels,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
