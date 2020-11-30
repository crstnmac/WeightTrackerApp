import 'dart:math' as math;
import 'package:WeightLossCal/constants.dart';
import 'package:WeightLossCal/widgets/buttonBlur.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'card_title.dart';
import 'gender.dart';
import 'package:flutter/material.dart';

import 'package:WeightLossCal/utils/widget.dart' show screenAwareSize;

class GenderCard extends StatefulWidget {
  final Gender initialGender;

  GenderCard({Key key, this.initialGender}) : super(key: key);

  @override
  _GenderCardState createState() => _GenderCardState();
}

double _circleSize(BuildContext context) => screenAwareSize(80.0, context);

class _GenderCardState extends State<GenderCard>
    with SingleTickerProviderStateMixin {
  AnimationController _arrowAnimationController;
  Gender selectedGender;

  @override
  void initState() {
    selectedGender = widget.initialGender ?? Gender.other;
    _arrowAnimationController = new AnimationController(
      vsync: this,
      lowerBound: -_defaultGenderAngle,
      upperBound: _defaultGenderAngle,
      value: _genderAngles[selectedGender],
    );
    super.initState();
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBlur(
      color: Colors.black,
      height: 100.0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(19.6),
            border:
                Border.all(color: Colors.black.withOpacity(0.4), width: 0.2)),
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
                  padding: EdgeInsets.only(
                    top: screenAwareSize(16.0, context),
                  ),
                  child: _drawMainStack(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawMainStack() {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _drawCircleIndicator(),
          GenderIconTranslated(gender: Gender.female),
          GenderIconTranslated(gender: Gender.other),
          GenderIconTranslated(gender: Gender.male),
          _drawGestureDetector()
        ],
      ),
    );
  }

  Widget _drawCircleIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: [
        GenderCircle(),
        GenderArrow(
          listenable: _arrowAnimationController,
        )
      ],
    );
  }

  _drawGestureDetector() {
    return Positioned.fill(
      child: TapHandler(
        onGenderTapped: _setSelectedGender,
      ),
    );
  }

  void _setSelectedGender(Gender gender) {
    setState(() => selectedGender = gender);
    _arrowAnimationController.animateTo(
      _genderAngles[gender],
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutQuad,
    );

    // final snackBar = SnackBar(
    //   content: Text(gender == Gender.female
    //       ? "Female"
    //       : gender == Gender.male
    //           ? "Male"
    //           : "Other"),
    // );

    // Scaffold.of(context).showSnackBar(snackBar);
  }
}

class GenderCircle extends StatelessWidget {
  const GenderCircle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  static final Map<Gender, IconData> _genderIcons = {
    Gender.female: MaterialCommunityIcons.gender_female,
    Gender.other: MaterialCommunityIcons.gender_transgender,
    Gender.male: MaterialCommunityIcons.gender_male,
  };

  double _circleSize(BuildContext context) => screenAwareSize(80.0, context);

  final Gender gender;

  const GenderIconTranslated({Key key, this.gender}) : super(key: key);

  bool get _isOtherGender => gender == Gender.other;

  IconData get _assetName => _genderIcons[gender];

  double _iconSize(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 28.0 : 22.0, context);
  }

  double _genderLeftPadding(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 8.0 : 0.0, context);
  }

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.only(left: _genderLeftPadding(context)),
      child: Icon(
        _assetName,
        size: _iconSize(context),
      ),
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
