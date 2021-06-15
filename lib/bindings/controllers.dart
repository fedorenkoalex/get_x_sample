import 'package:get/get.dart';
import 'package:test_getx/component/post_details/post_details_controller.dart';
import 'package:test_getx/component/posts_list/posts_controller.dart';

import 'package:test_getx/data/repository/posts_repository.dart';

void bindingPostsListController() => Get.lazyPut<PostsController>(
    () => PostsController(Get.find<PostsRepository>()));

void bindingPostDetailsController() => Get.lazyPut<PostDetailsController>(
    () => PostDetailsController(Get.find<PostsRepository>()));
