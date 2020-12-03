import 'package:WeightLossCal/screens/profile_screen.dart';
import 'package:WeightLossCal/cards/imt_card.dart';
import 'package:WeightLossCal/cards/weight_progress.dart';
import 'package:WeightLossCal/widgets/button_blur.dart';
import 'package:WeightLossCal/cards/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MyWeightScreen extends StatefulWidget {
  @override
  _MyWeightScreenState createState() => _MyWeightScreenState();
}

class _MyWeightScreenState extends State<MyWeightScreen> {
  String _selectedItem = 'Week';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Weight",
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ProfileScreen(),
                                  ),
                                ),
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
                              style: TextStyle(
                                  fontSize: 8.0, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "64kg",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _selectedItem,
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
                        SizedBox(
                          height: 15.0,
                        ),
                        WeeklyChart(),
                        SizedBox(
                          height: 15.0,
                        ),
                        ImtGraph(),
                        SizedBox(
                          height: 15.0,
                        ),
                        WeightProgress(),
                        SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bottomSheet(context) {
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
          onTap: () => _selectItem('Week'),
        ),
        ListTile(
          leading: Icon(Icons.accessibility_new),
          title: Text('Months'),
          onTap: () => _selectItem('Months'),
        ),
      ],
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }
}
