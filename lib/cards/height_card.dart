import 'package:WeightLossCal/utils/widget.dart';
import 'package:WeightLossCal/widgets/card_title.dart';
import 'package:WeightLossCal/widgets/height_picker.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  final int height;
  final ValueChanged<int> onChanged;

  const HeightCard({Key key, this.height = 170, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19.6),
          border: Border.all(color: Colors.black.withOpacity(0.4), width: 0.2)),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            top: screenAwareSize(8.0, context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardTitle(
                "HEIGHT",
                subtitle: "(cm)",
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: screenAwareSize(8.0, context),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return HeightPicker(
                        widgetHeight: constraints.maxHeight,
                        height: height,
                        onChange: (val) => onChanged(val),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
