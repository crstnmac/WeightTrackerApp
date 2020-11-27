import 'package:WeightLossCal/screens/MyWeightScreen.dart';
import 'package:WeightLossCal/screens/HistoryScreen.dart';
import 'package:WeightLossCal/widgets/customBottomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() {
  runApp(WeightLossCal());
}

class WeightLossCal extends StatefulWidget {
  @override
  _WeightLossCalState createState() => _WeightLossCalState();
}

class _WeightLossCalState extends State<WeightLossCal> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  int index = 0;

  List<Widget> _widgets = [MyWeightScreen(), TargetScreen()];

  tapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weight Loss Calculator',
      home: Scaffold(
        bottomNavigationBar: CustomBottomAppBar(
          onTabSelected: tapped,
          items: [
            CustomAppBarItem(
                icon: MaterialCommunityIcons.scale_bathroom, text: "My weight"),
            CustomAppBarItem(icon: Icons.history, text: "History"),
          ],
        ),
        body: _widgets[index],
      ),
    );
  }
}
