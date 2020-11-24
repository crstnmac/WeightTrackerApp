import 'package:WeightLossCal/constants.dart';
import 'package:WeightLossCal/widgets/ImtGraph.dart';
import 'package:WeightLossCal/widgets/WeightProgress.dart';
import 'package:WeightLossCal/widgets/buttonBlur.dart';
import 'package:WeightLossCal/widgets/weeklyChart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(WeightLossCal());
}

class WeightLossCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weight Loss Calculator',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedItem = 'Week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                            CircleAvatar(
                              radius: 20.0,
                            )
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
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "70kg",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ButtonBlur(
                              height: 32,
                              child: FlatButton(
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
                                      )
                                    ],
                                  ),
                                ),
                                shape: const StadiumBorder(),
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
