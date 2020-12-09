import 'package:get/state_manager.dart';

class WeightTrack {
  final int id;
  final int name;
  final int height;
  final int weight;
  final int targetWeight;

  WeightTrack(
      {this.id, this.name, this.height, this.weight, this.targetWeight});

  final isFavorite = false.obs;
}
