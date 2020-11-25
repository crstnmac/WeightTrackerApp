import 'package:flutter/material.dart';

class TargetScreen extends StatefulWidget {
  TargetScreen({Key key}) : super(key: key);

  @override
  _TargetScreenState createState() => _TargetScreenState();
}

class _TargetScreenState extends State<TargetScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Target Screen"),
    );
  }
}
