import 'package:hive/hive.dart';

part 'mission.g.dart';

@HiveType(typeId: 0)
class Mission extends HiveObject {
  @HiveField(0)
  String description;
  @HiveField(1)
  bool isComplete;

  Mission({required this.description, this.isComplete = false});
}
