import 'package:WeightLossCal/constants.dart';
import 'package:WeightLossCal/screens/my_weight_screen.dart';
import 'package:WeightLossCal/screens/history_screen.dart';
import 'package:WeightLossCal/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kBackgroundColor, //top bar color
    statusBarIconBrightness: Brightness.dark, //top bar icons
    systemNavigationBarColor: kBackgroundColor, //bottom bar color
    systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
  ));
  runApp(WeightLossCal());
}

class WeightLossCal extends StatefulWidget {
  @override
  _WeightLossCalState createState() => _WeightLossCalState();
}

class _WeightLossCalState extends State<WeightLossCal> {
  @override
  void initState() {
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
      theme: ThemeData(
        primaryColor: kBlueColor,
        fontFamily: 'SF Pro Display',
      ),
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
