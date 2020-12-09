import 'dart:math' as math;

import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/utils/height_styles.dart';
import 'package:WeightLossCal/widgets/height_silder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HeightController extends GetxController {
  double startDragYOffset;
  int startDragHeight;

  ProfileController profileController = Get.put(ProfileController());

  final int maxHeight = 190;
  final int minHeight = 145;

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

  _onDragStart(DragStartDetails dragStartDetails) {
    int newHeight = _globalOffsetToHeight(dragStartDetails.globalPosition);
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
}

class HeightPicker extends GetView<ProfileController> {
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

    return Obx(() => (GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTapDown: heightController._onTapDown,
          onVerticalDragStart: heightController._onDragStart,
          onVerticalDragUpdate: heightController._onDragUpdate,
          child: Stack(
            children: [
              _drawPerson(),
              _drawSlider(),
              _drawLabels(),
            ],
          ),
        )));
  }

  Widget _drawPerson() {
    double personImageHeight =
        Get.put(HeightController())._sliderPosition + 16.0;
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
    return Positioned(
      child: HeightSlider(height: controller.height.value),
      left: 0.0,
      right: 0.0,
      bottom: Get.put(HeightController())._sliderPosition,
    );
  }

  Widget _drawLabels() {
    int labelsToDispaly = Get.put(HeightController()).totalUnits ~/ 5 + 1;
    List<Widget> labels = List.generate(
      labelsToDispaly,
      (index) => Text(
        "${Get.put(HeightController()).maxHeight - 5 * index}",
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
