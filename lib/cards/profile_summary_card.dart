import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/utils/gender.dart';
import 'package:WeightLossCal/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSummaryCard extends GetView<ProfileController> {
  final Rx<Gender> gender;
  final RxInt height;
  final RxInt weight;

  const ProfileSummaryCard({Key key, this.height, this.weight, this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenAwareSize(8.0, context)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border:
                Border.all(color: Colors.black.withOpacity(0.4), width: 0.2)),
        child: SizedBox(
          height: screenAwareSize(32.0, context),
          child: Row(
            children: <Widget>[
              Expanded(child: Obx(() => (_genderText()))),
              _divider(),
              Expanded(
                  child: Obx(() => (_text("${controller.weight.value}kg")))),
              _divider(),
              Expanded(
                  child: Obx(() => (_text("${controller.height.value}cm")))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderText() {
    String genderText = controller.gender.value == Gender.other
        ? '-'
        : (controller.gender.value == Gender.male ? 'Male' : 'Female');
    return _text(genderText);
  }

  Widget _text(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black38,
        fontSize: 15.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _divider() {
    return Container(
      width: 1.0,
      color: Color.fromRGBO(151, 151, 151, 0.1),
    );
  }
}
