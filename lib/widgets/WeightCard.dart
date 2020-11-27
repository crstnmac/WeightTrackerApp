import 'package:WeightLossCal/constants.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: kBlueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "64" + "kg",
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              "12/Dec/2020",
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
