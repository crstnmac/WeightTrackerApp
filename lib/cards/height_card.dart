import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/utils/widget.dart';
import 'package:WeightLossCal/widgets/card_title.dart';
import 'package:WeightLossCal/widgets/height_silder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeightCard extends GetView<ProfileController> {
  final RxInt height;
  const HeightCard({Key key, this.height}) : super(key: key);

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
            mainAxisSize: MainAxisSize.min,
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
                  child: Obx(() => (HeightSlider(
                        height: controller.height.value,
                        unit: "cm",
                        onChange: controller.height,
                        currentHeightTextColor: Colors.blueAccent,
                        numberLineColor: Colors.blueAccent,
                      ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
