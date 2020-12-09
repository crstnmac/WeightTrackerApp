import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/screens/profile_screen.dart';
import 'package:WeightLossCal/widgets/button_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class WeightInfo extends GetView<ProfileController> {
  final RxInt weight;

  const WeightInfo({Key key, this.weight}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Weight",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => {
                Get.put(ProfileController()),
                navigator.push(
                    MaterialPageRoute(builder: (context) => ProfileScreen()))
              },
              child: Icon(
                MaterialCommunityIcons.face,
                size: 50.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "CURRENT WEIGHT",
              style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => (Text(
                  controller.weight.toString() + "Kg",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ))),
            ButtonBlur(
              color: Colors.black12,
              height: 32,
              blurRadius: 8,
              opacity: 0.05,
              offsetX: 0,
              offsetY: 0,
              child: FlatButton(
                splashColor: Colors.transparent,
                color: Colors.white,
                onPressed: () => _bottomSheet(context),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Week",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 120,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('Week'),
          // onTap: () => _selectItem('Week'),
        ),
        ListTile(
          leading: Icon(Icons.accessibility_new),
          title: Text('Months'),
          // onTap: () => _selectItem('Months'),
        ),
      ],
    );
  }
}
