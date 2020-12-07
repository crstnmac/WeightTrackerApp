import 'package:WeightLossCal/constants.dart';
import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/screens/add_weight_screen.dart';
import 'package:WeightLossCal/screens/history_screen.dart';
import 'package:WeightLossCal/screens/my_weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kBackgroundColor, //top bar color
    statusBarIconBrightness: Brightness.dark, //top bar icons
    systemNavigationBarColor: kBackgroundColor, //bottom bar color
    systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
  ));
  runApp(WeightLossCal());
}

class WeightLossCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weight Loss Calculator',
      theme: ThemeData(
        primaryColor: kBlueColor,
        fontFamily: 'SF Pro Display',
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(ProfileController());
      }),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  final List<Widget> bodyContent = [
    MyWeightScreen(),
    AddWeightScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          child: bodyContent.elementAt(navController.selectedIndex),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "History",
            ),
          ],
          currentIndex: navController.selectedIndex,
          onTap: (index) => navController.selectedIndex = index,
        ),
      ),
    );
  }
}

class NavController extends GetxController {
  final _selectedIndex = 0.obs;

  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;
}
