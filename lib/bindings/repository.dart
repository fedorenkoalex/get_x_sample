import 'package:get/get.dart';
import 'package:test_getx/data/database/posts_database.dart';
import 'package:test_getx/data/models/local/post.dart';
import 'package:test_getx/data/repository/posts_repository.dart';
import 'package:test_getx/data/source/posts_source.dart';

void bindRepository() => Get.lazyPut<PostsRepository>(
    () => PostsRepository(Get.find<PostsSource>(), Get.find<PostsDatabase>()));
