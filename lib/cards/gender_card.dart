import 'dart:math' as math;
import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/utils/gender.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../widgets/card_title.dart';
import 'package:flutter/material.dart';

import 'package:WeightLossCal/utils/widget.dart' show screenAwareSize;

class GenderCardController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _arrowAnimationController;

  ProfileController pController = Get.put(ProfileController());

  @override
  void onInit() {
    _arrowAnimationController = new AnimationController(
      vsync: this,
      lowerBound: -_defaultGenderAngle,
      upperBound: _defaultGenderAngle,
      value: _genderAngles[pController.gender],
    );
    super.onInit();
  }

  _setSelectedGender(Gender gender) {
    pController.gender(gender);
    _arrowAnimationController.animateTo(
      _genderAngles[pController.gender],
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutQuad,
    );
  }

  @override
  void onClose() {
    _arrowAnimationController.dispose();
    super.onClose();
  }
}

class GenderCard extends GetView<ProfileController> {
  final Rx<Gender> gender;

  GenderCard({Key key, this.gender}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19.6),
          border: Border.all(color: Colors.black.withOpacity(0.4), width: 0.2)),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            top: screenAwareSize(8.0, context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardTitle("GENDER"),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: _drawMainStack(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawMainStack() {
    return Container(
      width: double.infinity,
      child: Obx(() => (Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _drawCircleIndicator(),
              GenderIconTranslated(
                gender: Gender.female,
                isSelected: controller.gender.value == Gender.female,
              ),
              GenderIconTranslated(
                gender: Gender.other,
                isSelected: controller.gender.value == Gender.other,
              ),
              GenderIconTranslated(
                gender: Gender.male,
                isSelected: controller.gender.value == Gender.male,
              ),
              _drawGestureDetector()
            ],
          ))),
    );
  }

  Widget _drawCircleIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: [
        GenderCircle(),
        GetBuilder(
            init: GenderCardController(),
            builder: ((value) => GenderArrow(
                  listenable: value._arrowAnimationController,
                )))
      ],
    );
  }

  _drawGestureDetector() {
    final myGenderController = Get.put(GenderCardController());

    return Positioned.fill(
      child: TapHandler(
        onGenderTapped: myGenderController._setSelectedGender,
      ),
    );
  }
}

class GenderCircle extends StatelessWidget {
  const GenderCircle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _circleSize(BuildContext context) => screenAwareSize(80.0, context);

    return Container(
      width: _circleSize(context),
      height: _circleSize(context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(244, 244, 244, 1.0),
      ),
    );
  }
}

class GenderLine extends StatelessWidget {
  const GenderLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: screenAwareSize(6.0, context),
          top: screenAwareSize(8.0, context)),
      child: Container(
        height: screenAwareSize(8.0, context),
        width: 1.0,
        color: Color.fromRGBO(216, 217, 223, 0.54),
      ),
    );
  }
}

const double _defaultGenderAngle = math.pi / 4;

const Map<Gender, double> _genderAngles = {
  Gender.female: -_defaultGenderAngle,
  Gender.other: 0.0,
  Gender.male: _defaultGenderAngle,
};

class GenderIconTranslated extends StatelessWidget {
  final Gender gender;
  final bool isSelected;

  static final Map<Gender, IconData> _genderIcons = {
    Gender.female: MaterialCommunityIcons.gender_female,
    Gender.other: MaterialCommunityIcons.gender_transgender,
    Gender.male: MaterialCommunityIcons.gender_male,
  };

  double _circleSize(BuildContext context) => screenAwareSize(75.0, context);

  const GenderIconTranslated({Key key, this.gender, this.isSelected = false})
      : super(key: key);

  bool get _isOtherGender => gender == Gender.other;

  IconData get _assetName => _genderIcons[gender];

  double _iconSize(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 28.0 : 22.0, context);
  }

  // double _genderLeftPadding(BuildContext context) {
  //   return screenAwareSize(_isOtherGender ? 0.0 : 0.0, context);
  // }

  @override
  Widget build(BuildContext context) {
    Widget icon = Icon(
      _assetName,
      size: _iconSize(context),
      color: isSelected ? null : Color.fromRGBO(143, 144, 156, 1.0),
    );

    Widget rotatedIcon = Transform.rotate(
      angle: -_genderAngles[gender],
      child: icon,
    );

    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(
        bottom: _circleSize(context) / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          rotatedIcon,
          GenderLine(),
        ],
      ),
    );

    Widget rotatedTconWithALine = Transform.rotate(
      alignment: Alignment.bottomCenter,
      angle: _genderAngles[gender],
      child: iconWithALine,
    );

    Widget centerIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: _circleSize(context) / 2),
      child: rotatedTconWithALine,
    );

    return centerIconWithALine;
  }
}

class GenderArrow extends AnimatedWidget {
  const GenderArrow({Key key, Listenable listenable})
      : super(key: key, listenable: listenable);

  double _arrowLength(BuildContext context) => screenAwareSize(64.0, context);

  double _translationOffset(BuildContext context) =>
      _arrowLength(context) * 0.0;

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;

    return Transform.rotate(
      angle: animation.value,
      child: Transform.translate(
        offset: Offset(0.0, _translationOffset(context)),
        child: Transform.rotate(
          angle: -_defaultGenderAngle * 4,
          child: Icon(
            MaterialCommunityIcons.arrow_down_circle,
            size: _arrowLength(context),
          ),
        ),
      ),
    );
  }
}

class TapHandler extends StatelessWidget {
  final Function(Gender) onGenderTapped;

  const TapHandler({Key key, this.onGenderTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: GestureDetector(
          onTap: () => onGenderTapped(Gender.female),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () => onGenderTapped(Gender.other),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () => onGenderTapped(Gender.male),
        )),
      ],
    );
  }
}
