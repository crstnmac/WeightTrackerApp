import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.black.withOpacity(
            0.5,
          ),
          width: 0.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "64" + "kg",
              style: TextStyle(fontSize: 20.0),
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
