import 'package:hive/hive.dart';

part 'post_model.g.dart';

@HiveType(typeId: 0)
class PostModel extends HiveObject {
  @HiveField(0)
  int userId = 0;
  @HiveField(1)
  int id = 0;
  @HiveField(2)
  String title = "";
  @HiveField(3)
  String body = "";


}
