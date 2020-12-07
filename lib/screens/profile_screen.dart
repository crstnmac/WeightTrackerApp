import 'package:WeightLossCal/cards/gender_card.dart';
import 'package:WeightLossCal/cards/height_card.dart';
import 'package:WeightLossCal/cards/profile_summary_card.dart';
import 'package:WeightLossCal/cards/weight_card.dart';
import 'package:WeightLossCal/constants.dart';
import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/screens/my_weight_screen.dart';
import 'package:WeightLossCal/utils/gender.dart';
import 'package:WeightLossCal/widgets/button_blur.dart';
import 'package:flutter/material.dart';

import 'package:WeightLossCal/utils/widget.dart' show screenAwareSize;
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  final Rx<Gender> gender;
  final RxInt weight;
  final RxInt height;

  const ProfileScreen({Key key, this.height, this.weight, this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              SizedBox(height: 25.0),
              ProfileSummaryCard(
                gender: controller.gender,
                weight: controller.weight,
                height: controller.height,
              ),
              Expanded(child: _buildCards(context)),
              _buildBottom(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichLabelText(),
        FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Get.reset(
              clearRouteBindings: true,
            );
            navigator.pop(context);
          },
          child: Text(
            "Go back",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: screenAwareSize(22.0, context),
        top: screenAwareSize(14.0, context),
      ),
      child: ButtonBlur(
        height: 55.0,
        width: double.infinity,
        color: kBlueColor,
        child: FlatButton(
          // focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          // hoverColor: Colors.transparent,
          color: kBlueColor,
          onPressed: () => {
            controller.handleDoneTap(),
            navigator.push(
                MaterialPageRoute(builder: (context) => MyWeightScreen())),
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Done",
                style: TextStyle(color: Colors.white, fontSize: 19.0),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GenderCard(
                  gender: controller.gender,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Expanded(
                child: WeightCard(
                  weight: controller.weight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
            child: HeightCard(
          height: controller.height,
        )),
      ],
    );
  }
}

class RichLabelText extends StatelessWidget {
  const RichLabelText({Key key}) : super(key: key);

  static const String wavingHandEmoji = "\uD83D\uDC4B";
  static const String whiteSkinTone = "\uD83C\uDFFB";

  final String name = "Criston";

  String getEmoji(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? wavingHandEmoji
        : wavingHandEmoji + whiteSkinTone;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 28.0),
        children: [
          TextSpan(
            text: "Hello" + " " + name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: getEmoji(context)),
        ],
      ),
    );
  }
}
