import 'package:WeightLossCal/controllers/profile_controller.dart';
import 'package:WeightLossCal/utils/widget.dart' show screenAwareSize;
import 'package:WeightLossCal/widgets/card_title.dart';
import 'package:WeightLossCal/widgets/weight_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class WeightCard extends GetView<ProfileController> {
  final RxInt weight;

  const WeightCard({Key key, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                "WEIGHT",
                subtitle: "(KG)",
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenAwareSize(16.0, context)),
                    child: _drawSlider(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Obx(() => (WeightSlider(
                minValue: controller.minWeight,
                maxValue: controller.maxWeight,
                value: controller.weight.value,
                width: constraints.maxWidth,
              )));
        },
      ),
    );
  }
}

class WeightBackground extends StatelessWidget {
  final Widget child;
  const WeightBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: screenAwareSize(80.0, context),
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 244, 244, 1.0),
            borderRadius: BorderRadius.circular(screenAwareSize(26.0, context)),
          ),
          child: child,
        ),
        Icon(
          Feather.chevron_up,
          size: screenAwareSize(50.0, context),
        )
      ],
    );
  }
}
