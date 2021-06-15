import 'package:get/get.dart';
import 'package:test_getx/data/database/posts_database.dart';
import 'package:test_getx/data/source/posts_source.dart';

void bindDatabase() => Get.lazyPut<PostsDatabase>(() => PostsDatabase());
