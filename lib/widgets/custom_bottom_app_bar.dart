import 'package:WeightLossCal/constants.dart';
import 'package:WeightLossCal/screens/add_weight_screen.dart';
import 'package:WeightLossCal/widgets/button_blur.dart';
import 'package:flutter/material.dart';

class CustomAppBarItem {
  IconData icon;
  String text;
  CustomAppBarItem({this.icon, this.text});
}

class CustomBottomAppBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<CustomAppBarItem> items;

  CustomBottomAppBar({this.onTabSelected, this.items}) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabIcon(
          index: index, item: widget.items[index], onPressed: _updateIndex);
    });
    items.insert(items.length >> 1, _buildMiddleSeparator());

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
        height: 80.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }

  Widget _buildMiddleSeparator() {
    return Expanded(
      child: SizedBox(
        height: 120.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonBlur(
              height: 60,
              containerRadius: 30,
              blurRadius: 16,
              opacity: 0.2,
              offsetX: 0,
              offsetY: 8,
              color: kBlueColor,
              child: Container(
                width: 60,
                child: FlatButton(
                  color: kBlueColor,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => AddWeightScreen(),
                      ),
                    ),
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      )
                    ],
                  ),
                  shape: const CircleBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIcon(
      {int index, CustomAppBarItem item, ValueChanged<int> onPressed}) {
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => onPressed(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: _selectedIndex == index ? kBlueColor : Colors.black,
                  size: 30.0,
                ),
                Text(
                  item.text,
                  style: TextStyle(
                    color: _selectedIndex == index ? kBlueColor : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
