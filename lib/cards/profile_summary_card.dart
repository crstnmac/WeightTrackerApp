import 'package:WeightLossCal/cards/gender_card/gender.dart';
import 'package:WeightLossCal/utils/widget.dart';
import 'package:flutter/material.dart';

class ProfileSummaryCard extends StatelessWidget {
  final Gender gender;
  final int height;
  final int weight;

  const ProfileSummaryCard({Key key, this.gender, this.height, this.weight})
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
              Expanded(child: _genderText()),
              _divider(),
              Expanded(child: _text("${weight}kg")),
              _divider(),
              Expanded(child: _text("${height}cm")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderText() {
    String genderText = gender == Gender.other
        ? '-'
        : (gender == Gender.male ? 'Male' : 'Female');
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
